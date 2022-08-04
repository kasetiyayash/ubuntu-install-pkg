#!/bin/bash

echo Hello

echo Go back to home

cd ~

echo We are at home

echo -----------------------------------------------------------
echo -----------------------Packages Installing-----------------
echo -----------------------------------------------------------

sudo apt install curl
sudo apt autoremove -y

sudo apt update && sudo apt upgrade -y
echo -----------------------------------------------------------
echo -----------------------Packages Updated--------------------
echo -----------------------------------------------------------
source

echo -----------------------------------------------------------
echo --------------------------Chrome----------------------------
echo -----------------------------------------------------------
sudo apt install wget
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
rm -rf ./google-chrome-stable_current_amd64.deb

echo -----------------------------------------------------------
echo --------------------------VS Code----------------------------
echo -----------------------------------------------------------
sudo snap install --classic code
code --version

echo -----------------------------------------------------------
echo --------------------------Slack----------------------------
echo -----------------------------------------------------------
sudo snap install slack

echo -----------------------------------------------------------
echo ---------------------------GIT-----------------------------
echo -----------------------------------------------------------
sudo apt install curl wget git

echo -----------------------------------------------------------
echo ------------------------Installing Zsh---------------------
echo -----------------------------------------------------------
cd ~
sudo apt-get install zsh -y
zsh --version
whereis zsh
chsh -s /usr/bin/zsh

source ~/.zshrc

echo -----------------------------------------------------------
echo ---------------------------Oh My Zsh ----------------------
echo -----------------------------------------------------------
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

omz reload

echo -----------------------------------------------------------
echo --------------------------NVM Installing-------------------
echo -----------------------------------------------------------
cd ~
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh

source ~/.profile
source ~/.bashrc
source ~/.zshrc

echo -----------------------------------------------------------
echo -----------------------SpaceShip---------------------------
echo -----------------------------------------------------------
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

echo -----------------------------------------------------------
echo ----------------------------HTOP---------------------------
echo -----------------------------------------------------------
sudo apt install htop

echo -----------------------------------------------------------
echo ----------------------------Swap Memory--------------------
echo -----------------------------------------------------------
sudo swapoff -v /swapfile
sudo rm /swapfile
sudo dd if=/dev/zero of=/swapfile bs=1G count=8
sudo chmod 0600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

echo -----------------------------------------------------------
echo ----------------------------Auto Suggestions---------------
echo -----------------------------------------------------------
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo ------- "Update your zshrc file for theme changes"---------
echo 'ZSH_THEME="spaceship"'
echo "plugins=(git zsh-autosuggestions web-search dirhistory)"
