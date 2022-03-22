docker run \
-it \
--name ubuntu-for-nachos \
-p 3003:3003 \
-v "$(pwd)":/my_dir \
ubuntu:18.04