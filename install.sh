#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

EXTRACT_PATH=$1
INSTALL_PATH=${REZ_BUILD_INSTALL_PATH}
PYSIDE_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script.
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] EXTRACT PATH: ${EXTRACT_PATH}"
echo -e "[INSTALL][ARGS] INSTALL PATH: ${INSTALL_PATH}"
echo -e "[INSTALL][ARGS] PYSIDE2 VERSION: ${PYSIDE_VERSION}"

# We check if the arguments variables we need are correctly set.
# If not, we abort the process.
if [[ -z ${EXTRACT_PATH} || -z ${INSTALL_PATH} || -z ${PYSIDE_VERSION} ]]; then
    echo -e "\n"
    echo -e "[INSTALL][ARGS] One or more of the argument variables are empty. Aborting..."
    echo -e "\n"

    exit 1
fi

# We install PySide2.
echo -e "\n"
echo -e "[INSTALL] Installing PySide2-${PYSIDE_VERSION}..."
echo -e "\n"

# We copy the necessary files to the install directory.
cp -R ${EXTRACT_PATH}/pyside_install/py${REZ_PYTHON_MAJOR_VERSION}.${REZ_PYTHON_MINOR_VERSION}-qt${REZ_QT_VERSION}-64bit-release/* ${INSTALL_PATH}

echo -e "\n"
echo -e "[INSTALL] Finished installing PySide2-${PYSIDE_VERSION}!"
echo -e "\n"
