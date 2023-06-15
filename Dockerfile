FROM nvidia/cuda:11.3.0-devel-ubuntu20.04

# set timezone to Asia/Tokyo
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install Anaconda
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    sh Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    echo "export PATH=/opt/conda/bin:$PATH" >> ~/.bashrc

# Activate conda in non-interactive shell
RUN /opt/conda/bin/conda init bash

# create a new conda environment and activate it
COPY ./python3_8_env.yaml /tmp/python3_8_env.yaml
RUN /opt/conda/bin/conda env create -f /tmp/python3_8_env.yaml
ENV PATH /opt/conda/envs/pytorch-py3_8/bin:$PATH
RUN echo "conda activate python3_8_env" >> ~/.bashrc

# clean packages
RUN /opt/conda/bin/conda clean --all --yes

# enable SSH
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo "export VISIBLE=now" >> /etc/profile

# expose port 22 for SSH, port 8888 for JupytorLab
EXPOSE 22 8888

# set the working directory to /src
WORKDIR /simple-diabetes-prediction

# mount the current directory on the host to /src in the container
COPY . /simple-diabetes-prediction

SHELL ["/bin/bash", "-c", "source ~/.bashrc && conda activate winedb_env.yaml"]
