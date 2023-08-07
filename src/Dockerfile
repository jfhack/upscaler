FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel
LABEL org.opencontainers.image.source=https://github.com/jfhack/upscaler
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y build-essential curl git libgl1-mesa-glx libglib2.0-0
RUN python -m pip install --upgrade pip
RUN pip install cython
ADD . /core
WORKDIR /core/rudalle
ENV PATH="/root/.cargo/bin:${PATH}"
RUN ./prepare.sh
WORKDIR /core/gfpgan
RUN ./prepare.sh
WORKDIR /core/realesrgan
RUN ./prepare.sh
WORKDIR /core
ENTRYPOINT ["/core/upscaler"]
