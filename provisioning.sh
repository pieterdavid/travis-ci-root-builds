#!/bin/sh

sudo apt-get -y update
sudo apt-get -y upgrade

# Install mandatory, and then optional, ROOT dependencies
sudo apt-get -y install git dpkg-dev make cmake g++ gcc binutils \
  libx11-dev libxpm-dev libxft-dev libxext-dev
sudo apt-get -y install gfortran libssl-dev libpcre3-dev \
  xlibmesa-glu-dev libglew1.5-dev libftgl-dev \
  libmysqlclient-dev libfftw3-dev cfitsio-dev \
  graphviz-dev libavahi-compat-libdnssd-dev \
  libldap2-dev python-dev libxml2-dev libkrb5-dev \
  libgsl0-dev libqt4-dev libpng-dev

# Get GCC 4.8 for ROOT 6
# http://ubuntuhandbook.org/index.php/2013/08/install-gcc-4-8-via-ppa-in-ubuntu-12-04-13-04/
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get -y update
sudo apt-get -y install gcc-4.8 g++-4.8
sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
sudo update-alternatives --config gcc
sudo update-alternatives --config g++

# Install a modern CMake (ROOT requires >= 2.8.8)
curl -O http://www.cmake.org/files/v3.1/cmake-3.1.2.tar.gz
tar xf cmake-3.1.2.tar.gz
mkdir cmake-3.1.2/_build
cd cmake-3.1.2/_build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
make
sudo make install
sudo ldconfig
cd ../..
rm -rf cmake-3.1.2 cmake-3.1.2.tar.gz

# Add deadsnakes PPA for Python 2.6 and Python 3.3+
sudo add-apt-repository -y ppa:fkrull/deadsnakes
sudo apt-get -y update
sudo apt-get -y install python2.6 python2.6-dev
sudo apt-get -y install python3.3 python3.3-dev
sudo apt-get -y install python3.4 python3.4-dev

sudo ln -s /usr/lib/x86_64-linux-gnu/libpython3.3m.so /usr/lib/x86_64-linux-gnu/libpython3.3.so
sudo ln -s /usr/lib/x86_64-linux-gnu/libpython3.4m.so /usr/lib/x86_64-linux-gnu/libpython3.4.so

# Install Python packages
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo pip install virtualenv
sudo pip install nose
