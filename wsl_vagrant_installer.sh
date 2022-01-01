#!/bin/bash

# color
CYAN	=	\e[1;34m
END		=	\e[0m
##################################################
echo -e "$CYAN vagrant (WSL2) 설치 스크립트 $END"
##################################################
# virtual box가 윈도우에 미리 설치된 상태여야 합니다
#################################################

# wsl2에 vagrant 설치
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install vagrant

# vagrant의 WSL2 지원을 활성화합니다.
echo 'export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"' >> ~/.zshrc
echo 'export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"' >> ~/.zshrc

source ~/.zshrc

# vagrant의 WSL2 플러그인을 설치합니다.
# 만약 해당 플러그인을 설치하지 않으면 vm <-> WSL2의 ssh 연결이 되지않습니다.
vagrant plugin install virtualbox_WSL2

echo "vagrant vm 생성절차"
echo "1. vagrant init"
echo "2. vagrantfile 원하는데로 수정"
echo "3. vagrant up (가상머신 가동)"
echo "4. varant ssh (가상머신 ssh 연결)"
