# puglCMake 


This is a simple wrapper around the base https://github.com/lv2/pugl repo by -- David Robillard d@drobilla.net to make using it with CMake project structures easier.

This presently builds only on Windows, only static, and exposes the includes through CMake so this can be used as a submodule/subdirectory in another project (Ex. with clap for building plugins) 

As time allows I'll translate the rest of the meson.build logic. If anyone knows of a good transpiler or a simpler way to do this, let me know! I am not terribly familiar with Meson. 

