import os
import glob
import sys


def which(program):
    """ Helper function emulating unix 'which' command """
    for path in os.environ["PATH"].split(os.pathsep):
        path = path.strip('"')
        exe_file = os.path.join(path, program)
        if os.path.isfile(exe_file) and os.access(exe_file, os.X_OK):
            return exe_file
    return None


pkgpath = os.environ.get("PKG_CONFIG_PATH", "")
os.environ["PKG_CONFIG_PATH"] = pkgpath

paths = [
    "./",
]

mains = [
    "./convert.cxx",
]

sources = []
for path in paths:
    sources += [
        item
        for item in glob.glob(path + "*.cxx")
        if item not in mains
    ]

# Read the preferred compiler from the environment - if none specified, choose CLANG if possible
#default_compiler = 'clang++' if which("clang++") else 'g++'
default_compiler = 'g++'
gcc = os.environ.get('CXX', default_compiler)

env = Environment(tools=["default"], CXX=gcc)

base = "/home/guillermo/Desktop/projects/pddl_translator/universal-pddl-parser"

include_paths = ['.', f'{base}/parser/']

env.AppendUnique(
    CPPPATH=[os.path.abspath(p) for p in include_paths],
    CXXFLAGS=[
        "-Wall",
        "-pedantic",
        "-std=c++11",
        "-g"
    ],
    LIBS=['libparser'],
    LIBPATH=[f'{base}/lib/'],
    LINKFLAGS=[
        f"-Wl,-rpath,{base}/lib/"]
)


convert = env.Program("./convert", sources + ["./convert.cxx"])

env.AlwaysBuild(convert)
