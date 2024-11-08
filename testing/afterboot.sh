#!/bin/sh

pacman -Sy --noconfirm base-devel git
pacman -U --noconfirm --needed --overwrite "*" /var/cache/yay/yay-bin*
yay -U --noconfirm --needed --overwrite "*" /var/cache/yay/*
yay -S --noconfirm --needed --overwrite "*" $(cat /pkgs.txt)
yay -Syu --noconfirm

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen

locale | sort | bat -l sh --file-name "locale"
env | sort | bat -l sh --file-name "env"

bash

