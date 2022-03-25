# in ubuntu
apt-get update
apt-get -y install sudo
sudo apt -y install vim

sudo apt-get -y install nodejs
sudo apt-get -y install git
sudo apt-get -y install ed

# nachos

sudo apt-get -y install build-essential
sudo apt-get -y install wget
sudo apt-get -y install tar
sudo apt-get -y install gcc-multilib g++-multilib
sudo apt-get -y install lib32ncurses5 lib32z1
sudo apt-get -y install gcc-4.8 gcc-4.8-multilib g++-4.8 g++-4.8-multilib
sudo update-alternatives -y --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 40
sudo update-alternatives -y --install /usr/bin/g++ g++ /usr/bin/g++-4.8 40
gcc -v
g++ -v

dpkg --print-architecture
sudo dpkg --add-architecture i386