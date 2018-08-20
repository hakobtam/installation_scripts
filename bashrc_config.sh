#!/bin/bash
echo "export LANGUAGE=en_US.UTF-8" >> ~/.bashrc
echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc
echo "export LANG=en_US.UTF-8" >> ~/.bashrc
echo "export LC_TYPE=en_US.UTF-8" >> ~/.bashrc

echo "alias ll='ls -lhF'" >> ~/.bashrc

source ~/.bashrc
