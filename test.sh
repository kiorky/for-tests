#!/usr/bin/env bash
img=testep
space() { echo;echo; }
vv() { echo "$@">&2;"$@"; }
if [ ! -e venv ] ;then 
    virtualenv --no-site-packages venv;
    venv/bin/pip install docker
fi
. venv/bin/activate
vv docker build -t $img .
space
vv docker run --rm $img 1 2 3 4
space
echo "Using python SDK to test list entrypoint"
python << EOF
import docker
client = docker.from_env()
print(client.containers.run(
    "$img",
    ["1", "2", "3", "4"], 
    entrypoint=["/bin/sh", "-c", "echo wrapped && /ep.sh"]))
EOF
space
vv docker-compose build $img
space
vv docker-compose run --rm $img 1 2 3 4
space
# vim:set et sts=4 ts=4 tw=80:
