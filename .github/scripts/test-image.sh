#!/usr/bin/env bash
# Runtime checks for the Notifiarr nginx image.
# Usage: test-image.sh <image> [bot]
# Does not publish ports or remove any container it did not create.
set -euo pipefail

image=${1:?usage: test-image.sh <image> [bot]}
mode=${2:-app}

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

run() {
  docker run --rm --network bridge --entrypoint "$1" "$image" "${@:2}"
}

echo "image: $image"
echo "mode: $mode"

version=$(run terser --version)
echo "terser $version"
[[ "$version" =~ [0-9]+\.[0-9]+ ]] || fail "unexpected terser version: $version"

js='function hello(name) { var message = "Hello " + name; console.log(message); }'
minified=$(printf '%s\n' "$js" | docker run --rm -i --network bridge --entrypoint terser "$image" --compress --mangle | tr -d '[:space:]')
[[ -n "$minified" ]] || fail "terser produced no output"
[[ ${#minified} -lt ${#js} ]] || fail "terser did not shrink the sample: $minified"
echo "terser minify ok (${#js} -> ${#minified})"

run node -e 'if (!process.version) process.exit(1)'
echo "node ok"

run sh -c 'php -m | grep -qx ddtrace'
echo "php ddtrace ok"

run sh -c 'echo hi | gzip | gzip -dc | grep -qx hi'
echo "gzip ok"
run curl --version >/dev/null
echo "curl ok"

run sh -c 'getent group unraiddocker | grep -q ":281:" && id abc | grep -q "(unraiddocker)"'
echo "unraiddocker group ok"

if [[ "$mode" == bot ]]; then
  run ssh -V
  run docker --version
  echo "bot packages ok"
fi

name="notifiarr-nginx-citest-$$"
if docker container inspect "$name" >/dev/null 2>&1; then
  fail "container $name already exists; refusing to replace it"
fi

cleanup() {
  docker rm -f "$name" >/dev/null 2>&1 || true
}
trap cleanup EXIT INT TERM

docker run -d --name "$name" --network bridge \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  "$image" >/dev/null

code=
for _ in $(seq 1 40); do
  running=$(docker inspect -f '{{.State.Running}}' "$name" 2>/dev/null || echo false)
  if [[ "$running" != true ]]; then
    docker logs "$name" >&2 || true
    fail "nginx container exited during startup"
  fi
  code=$(docker exec "$name" curl -s -o /dev/null -w '%{http_code}' --max-time 3 http://127.0.0.1/ || true)
  case "$code" in
    200|301|302|303|307|308|401|403|404)
      echo "nginx http $code"
      exit 0
      ;;
  esac
  sleep 2
done

docker logs "$name" >&2 || true
fail "nginx did not answer on port 80 (last status: ${code:-none})"
