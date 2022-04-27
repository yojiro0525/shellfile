#!/bin/sh
echo "setup"
#------------------------------------
#aptのアプデ
sudo apt upadete -y 
sudo apt upgrade -y
sudo apt -y autoremove
#-----------------------------------
#unzipのダウンロード
sudo apt install -y unzip
#-----------------------------------
#denoのインストール
curl -fsSL https://deno.land/x/install/install.sh | sh
echo 'export DENO_INSTALL="/home/$USER/.deno"' >> ~/.bashrc
echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
#-----------------------------------
#vim8.2へのアプデ
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update -y
sudo apt install -y vim
#-----------------------------------
#vimの設定
cd 
git clone https://github.com/yojiro0525/vimfile.git .
#-----------------------------------
#pythonのインストール
cd
sudo apt install python3-pip
sudo pip3 install numpy
sudo pip3 install matplotlib
sudo pip3 install scipy
#-----------------------------------
