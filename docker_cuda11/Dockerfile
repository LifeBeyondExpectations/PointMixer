FROM nvidia/cuda:11.1.1-cudnn8-devel-ubuntu18.04
MAINTAINER jaesung.choe@kaist.ac.kr

ENV PATH /opt/conda/bin:$PATH

RUN apt-get -y update
RUN apt-get install -y git vim screen python3-dev python3-pip wget curl libgl1-mesa-glx rsync
RUN apt install -y build-essential python3-dev libopenblas-dev
RUN echo "export PATH=\$PATH:/usr/local/cuda/bin" >> ~/.bashrc
RUN echo "export CUDADIR=/usr/local/cuda" >> ~/.bashrc
RUN echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64" >> ~/.bashrc
RUN echo "export CUDA_HOME=/usr/local/cuda" >> ~/.bashrc

RUN wget --quiet http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

ENV PATH=/miniconda/bin:$PATH
# RUN conda update -y conda
# RUN conda create -y -n pointmixer python=3.7 anaconda
# RUN conda init

# RUN /bin/bash -c "source activate pointmixer"
# error: RUN conda activate pointmixer

RUN apt-get update -y
RUN pip3 install --no-cache-dir --upgrade pip

RUN pip3 install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html

RUN conda install -c anaconda h5py pyyaml scikit-learn python-lmdb -y
RUN conda install -c conda-forge sharedarray tensorboardx einops neptune-client tqdm msgpack-numpy -y
RUN conda install -c fvcore -c iopath -c conda-forge fvcore iopath -y
# RUN conda install pytorch3d -c pytorch3d -y

WORKDIR /root/
COPY requirements.txt ./

RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip3 install --no-cache-dir torch-scatter -f https://data.pyg.org/whl/torch-1.9.0+cu111.html
