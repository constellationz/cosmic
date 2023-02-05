#!/usr/bin/bash
# Installs packages from the package list

awk '{print $1}' packages | sudo xargs pacman -Syyu --noconfirm

for package in $(awk '{print $1}' aurpackages); do 
	cd /tmp/
	git clone https://aur.archlinux.org/$package.git
	cd $package
	git pull
	makepkg -si --noconfirm
done
