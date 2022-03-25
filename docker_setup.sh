docker run \
-it \
--name ubuntu-for-nachos \
-p 3003:3003 \
-v "$(pwd)":/my_dir \
--add-host=docker:0.0.0.0 \
ubuntu:18.04