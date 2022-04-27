#!/bin/sh
#aptの更新
sudo apt update -y
sudo apt upgrade -y
sudo apt -y autoremove
#GUI環境の設定
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
#aptへのROSのダウンロード先の登録
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
#ダウンロードのための公開鍵の取得
sudo apt install -y curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
#ROSのインストール
sudo apt update -y
sudo apt install -y ros-melodic-desktop-full
#環境変数の設定
cd
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
#ROSのパッケージインストーラのインストール
sudo apt install -y python-rosinstall python-catkin-tools python-rosdep
#ROSの初期設定
sudo rosdep init
rosdep update
#ROSのワークスペースの作成とビルドテスト
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
catkin build
#自分のワークスペースをインストール環境に配置する
source devel/setup.bash
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
