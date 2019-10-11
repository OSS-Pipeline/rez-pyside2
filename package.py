name = "pyside2"

version = "2.0.0"

authors = [
    "The Qt Company"
]

description = \
    """
    The Qt for Python project aims to provide a complete port of the PySide module to Qt 5.
    """

requires = [
    "cmake-3+",
    "gcc-6+",
    "python-2.7+<3",
    "qt-5.6"
]

variants = [
    ["platform-linux"]
]

tools = [
    "pyside2-lupdate",
    "pyside2-rcc",
    "pyside2-uic",
    "shiboken2"
]

build_system = "cmake"

with scope("config") as config:
    config.build_thread_count = "logical_cores"

uuid = "pyside2-{version}".format(version=str(version))

def commands():
    env.PATH.prepend("{root}/bin")
    env.LD_LIBRARY_PATH.prepend("{root}/lib")
    env.PYTHONPATH.prepend("{root}/lib/python" + str(env.REZ_PYTHON_MAJOR_VERSION) + "." + str(env.REZ_PYTHON_MINOR_VERSION) + "/site-packages")
    env.PKG_CONFIG_PATH.prepend("{root}/lib/pkgconfig")

    # Helper environment variables.
    env.PYSIDE_BINARY_PATH.set("{root}/bin")
    env.PYSIDE_INCLUDE_PATH.set("{root}/include")
    env.PYSIDE_LIBRARY_PATH.set("{root}/lib")
