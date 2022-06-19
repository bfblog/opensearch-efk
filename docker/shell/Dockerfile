FROM ubuntu:latest

# add install procedure 
ADD install.sh /root/install.sh

WORKDIR /root

RUN apt update && apt upgrade -y 
RUN chmod +x /root/install.sh && /root/install.sh

RUN useradd -G 0 --create-home --shell /bin/bash developer &&  \
    echo "source /completion.sh" >> /home/developer/.bashrc

USER developer