#! /bin/bash

function exec_docker() {
    args="$@"
    docker run \
        --user "$(id -u):$(id -g)" \
        --mount "type=bind,source=/home/$(id -u -n),destination=/home/$(id -u -n)" \
        -w "$(pwd)" \
        --net host \
        --rm \
        -it "yocto/$(basename $(pwd))"
        /bin/bash -c ". $(pwd)/src/poky/oe-init-build-env && $args"
}


function setup() {

cat << EOF > $(pwd)/env.txt
HOME_DIR=${HOME}
USER_NAME="$(id -u -n)"
GROUP_NAME="$(id -g -n)"
GROUP_ID="$(id -g)"
USER_ID="$(id -u)"
EOF
    docker build . -t "yocto/$(basename $(pwd))" 
    touch "$(pwd)/.setup_okay"
#    for m in meta-*; do
#        exec_docker "bitbake-layers add $m"
#    done
}


function run() {

    docker run \
        --user "$(id -u):$(id -g)" \
        --mount "type=bind,source=/home/$(id -u -n),destination=/home/$(id -u -n)" \
        -w "$(pwd)" \
        --net host \
        --rm \
        -it "yocto/$(basename $(pwd))"


}



if [ ! -e "$(pwd)/.setup_okay" ]; then
    setup
else
    run
fi