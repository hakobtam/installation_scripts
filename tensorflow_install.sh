#http://www.python36.com/how-to-install-tensorflow-gpu-with-cuda-9-2-for-python-on-ubuntu/2/
source ~/venv3/bin/activate
./download_script.sh 11_BD9hU2OelbeCcTholye8EdV4MFTVv- nccl_2.2.13-1+cuda9.0_x86_64.txz
#Install NCCL
tar -xf nccl_2.2.13-1+cuda9.0_x86_64.txz
cd nccl_2.2.13-1+cuda9.0_x86_64
sudo cp -R * /usr/local/cuda-9.0/targets/x86_64-linux/
sudo ldconfig

sudo apt-get install libcupti-dev
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc

#Python related
sudo apt-get install python-numpy python-dev python-pip python-wheel
sudo apt-get install python3-numpy python3-dev python3-pip python3-wheel

#Download bazel
cd ~/
wget https://github.com/bazelbuild/bazel/releases/download/0.14.0/bazel-0.14.0-installer-linux-x86_64.sh
chmod +x bazel-0.14.0-installer-linux-x86_64.sh
./bazel-0.14.0-installer-linux-x86_64.sh --user
echo 'export PATH="$PATH:$HOME/bin"' >> ~/.bashrc

sudo ldconfig

#Downloading tensorflow 1.8.0
cd ~/
git clone https://github.com/tensorflow/tensorflow.git
cd tensorflow
git pull
git checkout r1.8
./configure

bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package
bazel-bin/tensorflow/tools/pip_package/build_pip_package tensorflow_pkg
cd tensorflow_pkg
pip install tensorflow*.whl

# Install keras from source
git clone https://github.com/fchollet/keras.git
cd keras
python setup.py install
cd ..
rm -rf keras
