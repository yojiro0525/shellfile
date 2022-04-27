#!/bin/sh
echo "setup"
#------------------------------------
#aptのアプデ
sudo apt upadete -y 
sudo apt upgrade -y
sudo apt -y autoremove
#-----------------------------------
#GUIのダウンロード
sudo apt install -y libgl1-mesa-dev xorg-dev xbitmaps x11-apps
echo 'export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '\''{print $2}'\''):0.0 #https://astherier.com/blog/2020/08/run-gui-apps-on-wsl2/' >> ~/.profile
cat << 'EOS' | sudo tee /etc/fonts/local.conf
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <dir>/mnt/c/Windows/Fonts</dir>
</fontconfig> 
<!-- Created by https://astherier.com/blog/2020/08/run-gui-apps-on-wsl2/ -->
EOS
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
git clone git@github.com:yojiro0525/vimfile.git .
#-----------------------------------
#pythonのインストール
cd
sudo apt install -y python3-pip
sudo pip3 install -y numpy
sudo pip3 install -y matplotlib
sudo pip3 install -y scipy
#-----------------------------------
