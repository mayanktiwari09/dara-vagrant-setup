#!/usr/bin/env bash

# Variables

LOG=/vagrant/vm_build.log

# Clear old log contents
> $LOG

# Installing Go-Lang packages
echo -e "\n--- Installing Go-Lang ---\n"
sudo apt-get update
sudo apt-get -y upgrade
wget https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
sudo tar -xvf go1.13.3.linux-amd64.tar.gz
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
mkdir $GOPATH

# Installing Dara packages
echo -e "\n--- Installing Dara packages ---\n"
mkdir $GOPATH/src
mkdir $GOPATH/src/github.com
cd $GOPATH/src/github.com
mkdir DARA-Project
cd DARA-Project
git clone https://github.com/DARA-Project/GoDist.git
git clone https://github.com/DARA-Project/GoDist-Scheduler.git
cd $GOPATH/src/github.com/DARA-Project/GoDist/src
export GOROOT_BOOTSTRAP=$GOROOT
sudo apt-get -y install gcc
./make.bash
sudo ln -s $GOPATH/src/github.com/DARA-Project/GoDist/bin/go /usr/bin/dgo
cd $GOPATH/src/github.com/DARA-Project/GoDist-Scheduler
chmod +x dependencies.sh
./dependencies.sh
cd $GOPATH/src/github.com/DARA-Project/GoDist-Scheduler
 
