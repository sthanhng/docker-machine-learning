FROM ubuntu:18.04

LABEL maintainer=sthanhng@gmail.com

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        git \
        wget \
        zip \
        unzip \
        vim \
        nano \
        pkg-config \
        python-dev \
        software-properties-common \
        python3-dev \
        && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# Install pip3
RUN curl -fSsL -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

# Install useful Python packages using pip
RUN pip3 --no-cache-dir install --upgrade \
    Cython \  
    h5py \
    jupyter \
    matplotlib \
    numpy \
    pandas \
    Pillow \
    scipy \
    scikit-learn \
    scikit-image \
    six \
    tqdm

# Setting Jupyter notebook configurations
COPY jupyter_notebook_config.py /root/.jupyter/

# Expose ports for Jupyter notebook (8888)
EXPOSE 8888

CMD ["/bin/bash"]

