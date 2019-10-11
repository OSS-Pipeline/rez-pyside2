#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

EXTRACT_PATH=$1
PYSIDE_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script.
echo -e "\n"
echo -e "============="
echo -e "=== BUILD ==="
echo -e "============="
echo -e "\n"

echo -e "[BUILD][ARGS] EXTRACT PATH: ${EXTRACT_PATH}"
echo -e "[BUILD][ARGS] PYSIDE2 VERSION: ${PYSIDE_VERSION}"

# We check if the arguments variables we need are correctly set.
# If not, we abort the process.
if [[ -z ${EXTRACT_PATH} || -z ${PYSIDE_VERSION} ]]; then
    echo -e "\n"
    echo -e "[BUILD][ARGS] One or more of the argument variables are empty. Aborting..."
    echo -e "\n"

    exit 1
fi

# We build PySide2.
echo -e "\n"
echo -e "[BUILD] Building PySide2-${PYSIDE_VERSION}..."
echo -e "\n"

cd ${EXTRACT_PATH}

rm -rf ${EXTRACT_PATH}/.git

python \
    ${EXTRACT_PATH}/setup.py \
    build \
    --qmake=${REZ_QT_ROOT}/bin/qmake \
    --cmake=${REZ_CMAKE_ROOT}/bin/cmake \
    --jobs=${REZ_BUILD_THREAD_COUNT}

echo -e "\n"
echo -e "[BUILD] Finished building PySide2-${PYSIDE_VERSION}!"
echo -e "\n"
