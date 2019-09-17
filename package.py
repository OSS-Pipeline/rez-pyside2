name = "pyside2"

version = "5.12.5.py3"

authors = [
    "The Qt Company"
]

description = \
    """
    The Qt for Python project aims to provide a complete port of the PySide module to Qt 5.
    """

requires = [
    "cmake-3",
    "python-3.7",
    "shiboken2-5.12.5.py3"
]

variants = [
    ["platform-linux"]
]

tools = [
    "pyside2-lupdate",
    "pyside2-rcc",
    "pyside2-uic"
]

build_system = "cmake"

with scope("config") as config:
    config.build_thread_count = "logical_cores"

#TODO: Use the SHA1 of the archive instead.
uuid = "pyside2-5.12.5.py3"

def commands():
    env.PATH.prepend("{root}/bin")
    env.PYTHONPATH.prepend("{root}")
