#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTSIZE=60
export LANG=en_US.UTF-8

alias ls='/usr/bin/lsd'

eval "$(starship init bash)"

alias ll='ls -l'

proxyoff() {
  unset http_proxy https_proxy all_proxy no_proxy
}

# for doas
alias sudo='doas'
alias sudoedit='doas rnano'
complete -cf doas
complete -F _command doas

# for ysyx
export NPC_HOME=/home/zuos/codpjt/c/ysyx/ysyx-workbench/npc
export NVBOARD_HOME=/home/zuos/codpjt/c/ysyx/ysyx-workbench/nvboard
export NEMU_HOME=/home/zuos/codpjt/c/ysyx/ysyx-workbench/nemu

export CC="clang"
export CPP="clang-cpp" # necessary for xorg-server and possibly other packages
export CXX="clang++"
export AR="llvm-ar"
export NM="llvm-nm"
export RANLIB="llvm-ranlib"
