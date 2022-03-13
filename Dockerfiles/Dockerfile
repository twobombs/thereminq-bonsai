FROM twobombs/cudacluster:gaming

# install features
RUN apt-get update && apt-get -y install build-essential cmake openssh-server wget vim-common opencl-headers curl libfreetype6-dev autotools-dev libicu-dev libbz2-dev libboost-all-dev && apt-get clean all

# node run & benchmark script, make runnable 
COPY runscripts/run* /root/
RUN chmod 744 /root/run*

#cleanup
RUN mkdir /root/logs && mv /var/log/*.log /root/logs/

EXPOSE 22 80 8801-8811
ENTRYPOINT /root/run-node
