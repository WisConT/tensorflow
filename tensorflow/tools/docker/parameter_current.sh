#!/usr/bin/env bash
# 
# The reason for creating this script is provided here: 
# https://github.com/tensorflow/tensorflow/tree/master/tensorflow/tools/docker
#
# These parameters should be set before attemting to run:
# https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/docker/parameterized_docker_build.sh

# In case you need to:
# $ chmod +x  /tensorflow/tensorflow/tools/docker/parameter_current.sh

export TF_DOCKER_BUILD_IS_DEVEL=NO
export TF_DOCKER_BUILD_TYPE=CPU
export TF_DOCKER_BUILD_PYTHON_VERSION=PYTHON3
export TF_DOCKER_BUILD_VERSION=1.4.0

export NIGHTLY_VERSION="1.head"

export TF_DOCKER_BUILD_CENTRAL_PIP=$(echo ${TF_DOCKER_BUILD_PYTHON_VERSION} | sed s^PYTHON2^http://ci.tensorflow.org/view/Nightly/job/nightly-matrix-cpu/TF_BUILD_IS_OPT=OPT,TF_BUILD_IS_PIP=PIP,TF_BUILD_PYTHON_VERSION=${TF_DOCKER_BUILD_PYTHON_VERSION},label=cpu-slave/lastSuccessfulBuild/artifact/pip_test/whl/tensorflow-${NIGHTLY_VERSION}-cp27-cp27mu-manylinux1_x86_64.whl^ | sed s^PYTHON3^http://ci.tensorflow.org/view/Nightly/job/nightly-python35-linux-cpu/lastSuccessfulBuild/artifact/pip_test/whl/tensorflow-${NIGHTLY_VERSION}-cp35-cp35m-manylinux1_x86_64.whl^)

./parameterized_docker_build.sh
