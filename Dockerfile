FROM alpine

RUN apk update
RUN apk add python3 git make vim
WORKDIR /root

#config path
RUN echo "export PATH=$PATH:/opt/" > ~/.bashrc

#download
RUN git clone https://github.com/baabnq/kit
RUN mv kit/ baabnq/
RUN cd baabnq/ && chmod +x setupLinux.sh && ./setupLinux.sh

#install
RUN mv baabnq/vm.py    /opt/v
RUN mv baabnq/compi.py /opt/c

SHELL ["/bin/sh"]




