#!/usr/bin/env bash

echo ------------------------------------
echo For Ubuntu or Debian based input 1
echo For Arch input 2
echo ------------------------------------

read -p 'Distro ' OS

if [[ $OS=="1" ]]; then
    #Debian/Ubuntu/Kali

    sudo apt update -y
    sudo apt install -y fonts-font-awesome
    sudo apt install -y compton
    sudo apt install -y i3lock
    sudo apt install -y thunar
    sudo apt install gnome-icon-theme-full
    sudo apt install arc-theme
    sudo add-apt-repository -u ppa:snwh/ppa
    sudo apt install moka-icon-theme faba-icon-theme faba-mono-icons
    sudo apt install lxappearance

elif [[$OS=="2"]]; then
    #Arch
    sudo pacman -Syu --noconfirm
    sudo pacman -Syy --noconfirm
    sudo pacman -S --noconfirm fonts-font-awesome
    sudo pacman -S --noconfirm compton
    sudo pacman -S --noconfirm i3lock
    sudo pacman -S --noconfirm thunar
    sudo pacman -S --noconfirm rofi
    sudo pacman -S --noconfirm gnome-icon-theme-full
    sudo git clone https://aur.archlinux.org/moka-icon-theme-git.git
    cd moka-icon-theme-git
    makepkg -si

    sudo git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme
    ./autogen.sh --prefix=/usr
    sudo make install

    sudo pacman -S --noconfirm lxappearance

    sudo pacman -S --noconfirm arc-gtk-theme 

fi

cd conf-master
mv conf ~/home/usr/.config/i3