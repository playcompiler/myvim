#!/bin/bash
#
#
# wanna lldb/lua, need modify lldb cmake files, change 5.3 to 5.4 for fedora.
sudo dnf install swig libedit-devel zx-devel lua-devel python-devel libxml2-devel

cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE="Debug" -DLLVM_ENABLE_PROJECTS="clang;lld;lldb" -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi" -DLLVM_TARGETS_TO_BUILD="AArch64;X86;BPF" ../llvm


