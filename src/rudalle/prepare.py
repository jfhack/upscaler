#!/usr/bin/env python
from huggingface_hub import  hf_hub_download

def main():
  for i in [2, 4, 8]:
    file_name = f'RealESRGAN_x{i}.pth'
    hf_hub_download(repo_id='shonenkov/rudalle-utils', local_dir="models", filename=file_name)

if __name__ == "__main__":
  main()
