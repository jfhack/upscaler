#!/bin/bash

export BASICSR_EXT=True
git clone --depth 1 https://github.com/TencentARC/GFPGAN.git
mv inference.py ./GFPGAN/
cd GFPGAN
pip install -r requirements.txt
mkdir -p experiments/pretrained_models
cd experiments/pretrained_models

curl -JLO https://github.com/TencentARC/GFPGAN/releases/download/v0.1.0/GFPGANv1.pth
curl -JLO https://github.com/TencentARC/GFPGAN/releases/download/v0.2.0/GFPGANCleanv1-NoCE-C2.pth
curl -JLO https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.3.pth
curl -JLO https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.4.pth
curl -JLO https://github.com/TencentARC/GFPGAN/releases/download/v1.3.4/RestoreFormer.pth
curl -JLO https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.1/RealESRGAN_x2plus.pth

mkdir -p /core/gfpgan/GFPGAN/gfpgan/weights/
cd /core/gfpgan/GFPGAN/gfpgan/weights/
curl -JLO https://github.com/xinntao/facexlib/releases/download/v0.1.0/detection_Resnet50_Final.pth
curl -JLO https://github.com/xinntao/facexlib/releases/download/v0.2.2/parsing_parsenet.pth
