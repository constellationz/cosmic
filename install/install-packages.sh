#!/usr/bin/bash
# Installs packages from the package list

awk '{print $1}' packages | sudo xargs pacman -Syyu --noconfirm
