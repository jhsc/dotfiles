#!/bin/bash

stow bash
stow cheat
stow git
stow tmux
stow vim 
stow zsh

git submodule update --init --recursive git vim/.vim/bundle

