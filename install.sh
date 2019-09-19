#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

INSTALL_PATH=${REZ_BUILD_INSTALL_PATH}
PYSIDE2_URL=$1
PYSIDE2_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script.
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] INSTALL PATH: ${INSTALL_PATH}"
echo -e "[INSTALL][ARGS] PYSIDE2 URL: ${PYSIDE2_URL}"
echo -e "[INSTALL][ARGS] PYSIDE2 VERSION: ${PYSIDE2_VERSION}"

# We install PySide2.
echo -e "\n"
echo -e "[INSTALL] Installing PySide2-${PYSIDE2_VERSION}..."
echo -e "\n"

# We copy the necessary files to the install directory.
pip3 install ${PYSIDE2_URL} --target ${INSTALL_PATH} --upgrade --no-dependencies

echo -e "\n"
echo -e "[INSTALL] Finished installing PySide2-${PYSIDE2_VERSION}!"
echo -e "\n"
