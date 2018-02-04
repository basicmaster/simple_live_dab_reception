#!/bin/bash -x

# install packages
sudo apt-get update || exit 1
sudo apt-get -y install build-essential git cmake libmpg123-dev libfaad-dev libsdl2-dev libgtkmm-3.0-dev libfftw3-dev libsndfile1-dev libsamplerate0-dev librtlsdr-dev || exit 1

# compile/install DABlin
git clone -b next https://github.com/Opendigitalradio/dablin.git || exit 1
pushd dablin || exit 1

mkdir build || exit 1
cd build || exit 1
cmake .. || exit 1
make -j 3 || exit 1
sudo make install || exit 1

popd || exit 1

# compile/install eti-cmdline
git clone https://github.com/JvanKatwijk/eti-stuff.git || exit 1
pushd eti-stuff || exit 1

cd eti-cmdline || exit 1
mkdir build || exit 1
cd build || exit 1
cmake .. -DRTLSDR=ON || exit 1
make -j 3 || exit 1
sudo make install || exit 1

popd || exit 1

# create call script
mkdir -p ~/bin || exit 1

echo dablin_gtk -d eti-cmdline-rtlsdr -D eti-cmdline > ~/bin/dablin_calling || exit 1
chmod +x ~/bin/dablin_calling || exit 1

echo ----- Script successfully finished - just call "dablin_calling" after the next login! -----
