cd nachos/NachOS-4.0/code/build.linux &&
make clean &&
make depend &&
make &&

cd ../test &&

make clean &&
make &&

../build.linux/nachos -x "$1" -d u
