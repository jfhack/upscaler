#!/bin/bash

export BASICSR_EXT=True
git clone --depth 1 https://github.com/xinntao/Real-ESRGAN.git
mv inference.py ./Real-ESRGAN/
cd Real-ESRGAN
pip install -r requirements.txt

cd weights

ln -s /core/gfpgan/GFPGAN/experiments/pretrained_models/RealESRGAN_x2plus.pth .

curl -JLO https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth
curl -JLO https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.1/RealESRNet_x4plus.pth
curl -JLO https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B.pth
curl -JLO https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesr-animevideov3.pth
curl -JLO https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesr-general-wdn-x4v3.pth
curl -JLO https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesr-general-x4v3.pth

cd ..
python setup.py develop

mkdir -p gfpgan/weights/
cd gfpgan/weights/
ln -s /core/gfpgan/GFPGAN/gfpgan/weights/detection_Resnet50_Final.pth .
ln -s /core/gfpgan/GFPGAN/gfpgan/weights/parsing_parsenet.pth .
