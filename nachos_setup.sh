mkdir nachos
cd nachos
rm NachOS-4.0 -rf

# wget https://www.fit.hcmus.edu.vn/~ntquan/os/assignment/nachos_40.tar.gz
# tar zxvf nachos_40.tar.gz

if [ "$1" ]
   	then
	git clone -b "$1" https://github.com/lamnguyen5464/NachOS-Source.git 
 else
	git clone -b stable https://github.com/lamnguyen5464/NachOS-Source.git
 fi

mv NachOS-Source NachOS-4.0

if [[ -f "/my_dir/nachos/mips-decstation.linux-xgcc.gz" ]]
then
    echo "mips-decstation.linux-xgcc.gz exists."
else
	wget https://www.fit.hcmus.edu.vn/~ntquan/os/assignment/mips-decstation.linux-xgcc.gz
	tar zxvf mips-decstation.linux-xgcc.gz
fi

# wget https://www.fit.hcmus.edu.vn/~ntquan/os/assignment/nachos-gcc.diff.gz
# tar zxvf nachos-gcc.diff.gz
# patch -p0 < nachos-gcc.diff


cd NachOS-4.0
cd code/build.linux
make depend
make

./nachos

# cd ../../coff2noff
# make

cd ../test &&
if [ "$2" ]
   	then
	make clean &&
	make &&
	../build.linux/nachos -x "$2" -d u
 fi