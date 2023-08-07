#!/usr/bin/env python
import torch
from rudalle.realesrgan.model import RealESRGAN
from PIL import Image
from pathlib import Path
import os
from tqdm import tqdm
import argparse

def get_model(scale):
  model = RealESRGAN(torch.device("cuda:0"), scale)
  model.load_weights(f"models/RealESRGAN_x{scale}.pth")
  return model

def main():
  parser = argparse.ArgumentParser()
  parser.add_argument("-s", "--scale", type=int, default=2, help="Upscaling factor")
  parser.add_argument("--uid", type=int, default=1000, help="User ID")
  parser.add_argument("--gid", type=int, default=None, help="Group ID")
  parser.add_argument("--force-png-output", action="store_true", help="Force output to be PNG")
  args = parser.parse_args()
  scale = args.scale
  uid = args.uid
  gid = args.gid
  if gid is None:
    gid = uid
  extensions = (".png", ".jpg", ".jpeg")
  input_dir = Path("/input")
  output_dir = Path("/output")
  os.chown(output_dir, uid, gid)
  images = [input_path for input_path in sorted(input_dir.iterdir()) if input_path.suffix.lower() in extensions]
  with torch.no_grad():
    model = get_model(scale)
    for input_path in tqdm(images):
      input_img = Image.open(input_path).convert("RGB")
      output_img = model.predict(input_img)
      if args.force_png_output:
        output_path = output_dir.joinpath(input_path.with_suffix(".png").name)
      else:
        output_path = output_dir.joinpath(input_path.name)
      output_img.save(output_path)
      os.chown(output_path, uid, gid)

if __name__ == "__main__":
  main()
