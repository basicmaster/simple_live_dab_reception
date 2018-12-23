#!/bin/bash -x

# abort on error
set -e

# install packages
sudo apt-get update
sudo apt-get -y install build-essential git cmake libmpg123-dev libfaad-dev libsdl2-dev libgtkmm-3.0-dev libfftw3-dev libsndfile1-dev libsamplerate0-dev librtlsdr-dev

# compile/install DABlin
git clone -b next https://github.com/Opendigitalradio/dablin.git
pushd dablin

mkdir build
cd build
cmake ..
make -j 3
sudo make install

popd

# compile/install eti-cmdline
git clone https://github.com/JvanKatwijk/eti-stuff.git
pushd eti-stuff

cd eti-cmdline
mkdir build
cd build
cmake .. -DRTLSDR=ON
make -j 3
sudo make install

popd

# create call script
mkdir -p ~/bin

echo dablin_gtk -d eti-cmdline-rtlsdr -D eti-cmdline > ~/bin/dablin_calling
chmod +x ~/bin/dablin_calling

echo ----- Script successfully finished - just call "dablin_calling" after the next login! -----
