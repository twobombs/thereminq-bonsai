FROM nvidia/cudagl:11.4.2-devel-ubuntu20.04

LABEL com.nvidia.volumes.needed="nvidia_driver"

# upgrades
RUN apt update && export DEBIAN_FRONTEND=noninteractive && apt -y upgrade && apt clean all

############ start of desktop insert ##############

ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

# install glvnd ( + temp nv repo key fix )
RUN apt-get clean && \
    apt-key adv --fetch-keys "https://developer.download.nvidia.com/compute/cuda/repos/$(cat /etc/os-release | grep '^ID=' | awk -F'=' '{print $2}')$(cat /etc/os-release | grep '^VERSION_ID=' | awk -F'=' '{print $2}' | sed 's/[^0-9]*//g')/x86_64/3bf863cc.pub" && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt install -y software-properties-common && add-apt-repository multiverse && apt update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y --no-install-recommends pkg-config libglvnd-dev && apt-get -f -y install && dpkg --configure -a && apt-get clean all && apt -y autoremove

RUN add-apt-repository ppa:kisak/kisak-mesa -y && apt update && export DEBIAN_FRONTEND=noninteractive && apt -y upgrade && apt clean all && apt -y autoremove

# install baseline x, vnc
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y apt-utils software-properties-common && dpkg --add-architecture i386 && apt-get update -y && apt-get install -y git wget curl net-tools qemu-kvm qemu nvidia-modprobe qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager linux-tools-generic && apt-get clean all && apt -y autoremove
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y  --install-recommends net-tools xrdp xfce4 xfce4-goodies libsdl1.2-dev mesa-utils libgl1-mesa-dev libegl1-mesa-dev libgles2-mesa-dev && apt-get clean all && apt -y autoremove
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y x11vnc neofetch tightvncserver tigervnc-scraping-server novnc xvfb xterm mc lynx open-vm-tools ssh-askpass-gnome && apt-get clean all && apt -y autoremove
RUN cp /usr/share/novnc/vnc.html /usr/share/novnc/index.html && mkdir /root/.vnc

# add system frameworks
RUN export DEBIAN_FRONTEND=noninteractive && apt-get -y -f install lm-sensors python3-pip clinfo freeglut3 && apt-get clean all && apt -y autoremove

# cleanup idle shutdown
RUN apt-get -y remove xfce4-power-manager

############ end of desktop insert ##############

# install features
RUN apt-get update && apt-get -y install build-essential cmake datamash openssh-server wget vim-common opencl-headers curl libfreetype6-dev autotools-dev libicu-dev libbz2-dev libboost-all-dev && apt-get clean all

# fetch scripts and data repos
RUN git clone --depth=1 https://github.com/twobombs/thereminq.git && cd /thereminq/buildscripts && chmod 744 *
RUN git clone --depth=1 https://github.com/twobombs/thereminq-bonsai.git && cd /thereminq-bonsai/buildscripts && chmod 744 *

# install bonsai
RUN apt update && export DEBIAN_FRONTEND=noninteractive && apt install -y git cmake-curses-gui && apt clean all
RUN apt-get update && apt-get -y install time build-essential cmake openssh-server wget vim-common opencl-headers curl libfreetype6-dev freeglut3-dev autotools-dev libicu-dev libbz2-dev libboost-all-dev && apt-get clean all

RUN git clone --depth=1 https://github.com/treecode/Bonsai
RUN cd /Bonsai/runtime/lib && mv linux linux_temp && mv linux_fpic_glew linux
RUN cd /Bonsai/runtime && cmake -DCMAKE_CXX_COMPILER=mpicxx -DUSE_CUB=0 -DUSE_OPENGL=1 -DCUDA_CUDART_LIBRARY=/usr/local/cuda/lib64/libcudart.so && make -j 2 && cd /Bonsai/tools/IO && make -i -k -j 2

# install glvnd ( temp key fix )
RUN apt-get clean && \
    apt-key adv --fetch-keys "https://developer.download.nvidia.com/compute/cuda/repos/$(cat /etc/os-release | grep '^ID=' | awk -F'=' '{print $2}')$(cat /etc/os-release | grep '^VERSION_ID=' | awk -F'=' '{print $2}' | sed 's/[^0-9]*//g')/x86_64/3bf863cc.pub" && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt install -y software-properties-common net-tools openvpn netcat clinfo git mc opencl-headers ocl-icd-opencl-dev  && add-apt-repository multiverse && apt update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y --no-install-recommends pkg-config libglvnd-dev && apt-get -f -y install && dpkg --configure -a && apt-get clean all && apt -y autoremove

# NVidia hw integration
RUN mkdir -p /etc/OpenCL/vendors && echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

# clone repos - patch cmake for CUDA noGPU build
RUN git clone --depth=1 --recursive https://github.com/unitaryfund/qrack.git
RUN sed -i 's/native/50/g' /qrack/cmake/CUDA.cmake

RUN cp -r /qrack /qrack128
RUN cp -r /qrack /qrack64
RUN cp -r /qrack /qrack16
RUN cp -r /qrack /qrack8

# install features
RUN apt-get update && apt-get -y install build-essential cmake openssh-server wget vim-common opencl-headers curl libfreetype6-dev autotools-dev libicu-dev libbz2-dev libboost-all-dev && apt-get clean all
# Qrack install & dependancies 
RUN cd /qrack/include && mkdir CL && cd /var/log && mkdir qrack && cd /qrack && mkdir _build && cd _build && cmake -DENABLE_DEVRAND=ON -DFPPOW=5 -DUINTPOW=6 -DQBCAPPOW=6 -DENABLE_COMPLEX_X2=ON -DENABLE_OCL_MEM_GUARDS=ON .. && make -i -k -j $(grep -c ^processor /proc/cpuinfo) all && make install
# 64Qrack install & dependancies
RUN cd /qrack64/include && mkdir CL && cd /qrack64 && mkdir _build && cd _build && cmake -DENABLE_DEVRAND=ON -DFPPOW=6 -DUINTPOW=6 -DQBCAPPOW=7 -DENABLE_COMPLEX_X2=ON -DENABLE_OCL_MEM_GUARDS=ON -DENABLE_CUDA=ON .. && make -i -k -j $(grep -c ^processor /proc/cpuinfo) all && make install
# BigQrack install & dependancies
RUN cd /qrack128/include && mkdir CL && cd /qrack128 && mkdir _build && cd _build && cmake -DENABLE_DEVRAND=ON -DFPPOW=6 -DUINTPOW=6 -DQBCAPPOW=12 -DENABLE_RDRAND=OFF -DENABLE_COMPLEX_X2=ON -DENABLE_OCL_MEM_GUARDS=ON .. && make -i -k -j $(grep -c ^processor /proc/cpuinfo) all && make install

# install haskell, z3, num-utils, crackNum + dependancies
RUN apt-get install -y z3 num-utils && apt clean all
RUN curl -sSL https://get.haskellstack.org/ | sh
# RUN git clone --depth=1 https://github.com/LeventErkok/crackNum.git
RUN wget https://github.com/LeventErkok/crackNum/archive/refs/tags/v3.3.tar.gz && tar -xzvf v3.3.tar.gz && mv crackNum-3.3 crackNum
RUN cd crackNum && stack path --local-bin && stack setup && stack init && stack build && stack install && stack clean && rm -R /crackNum

# node run & benchmark script, make runnable 
COPY runscripts/run* /root/
RUN chmod 744 /root/run*

#cleanup
RUN mkdir /root/logs && mv /var/log/*.log /root/logs/

EXPOSE 22 80 8801-8811
ENTRYPOINT /root/run-bonsai
