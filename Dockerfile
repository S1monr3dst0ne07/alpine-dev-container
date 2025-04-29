FROM alpine

RUN apk update
RUN apk add python3 git make vim lftp
WORKDIR /root

#config path
ENV PATH "$PATH:/opt/"

#download baabnq
RUN git clone https://github.com/baabnq/kit
RUN mv kit/ baabnq/
RUN cd baabnq/ && chmod +x setupLinux.sh && ./setupLinux.sh

#install baabnq
RUN mv baabnq/vm.py    /opt/v
RUN mv baabnq/compi.py /opt/c
RUN chmod +x /opt/v
RUN chmod +x /opt/c

#download ext
RUN cd baabnq/ && git clone https://github.com/baabnq/ext

#copy uploader helper
COPY upload.sh /opt/upload


SHELL ["/bin/sh"]




