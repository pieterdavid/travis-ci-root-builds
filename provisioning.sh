#!/bin/sh

sudo apt-get -y update
sudo apt-get -y upgrade

# Install mandatory, and then optional, ROOT dependencies
sudo apt-get -y install git dpkg-dev ninja-build cmake3 g++ gcc binutils \
  libx11-dev libxpm-dev libxft-dev libxext-dev wget
sudo apt-get -y install gfortran libssl-dev libpcre3-dev \
  xlibmesa-glu-dev libglew-dev libftgl-dev \
  libmysqlclient-dev libfftw3-dev cfitsio-dev \
  graphviz-dev libavahi-compat-libdnssd-dev \
  libldap2-dev python-dev python3-dev libxml2-dev libkrb5-dev \
  libgsl0-dev libqt4-dev libpng-dev

# Install Python packages
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo pip install virtualenv
sudo pip install nose
