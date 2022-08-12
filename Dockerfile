FROM kalilinux/kali-rolling
RUN apt update && apt install -y openssh-server\
    && apt install -y sudo && apt install nano\
    && apt install net-tools && apt install -y vsftpd\
    && apt install -y gcc && apt install -y make && apt install -y zlib1g zlib1g-dev ftp traceroute nmap
RUN useradd -m -p '$1$M0Ld1W6K$V6mxfJ3LBT71EE/V3.0cX/' -s /bin/bash sshcls
RUN usermod -aG sudo sshcls
COPY . /home/sshcls
RUN tar -xvf /home/sshcls/Python-3.7.12.tgz
RUN apt install -y libssl-dev libncurses5-dev libsqlite3-dev\
     libreadline-dev libtk8.6 libgdm-dev libdb4o-cil-dev libpcap-dev
WORKDIR /Python-3.7.12
RUN ./configure
RUN make
# RUN make test
RUN make install
RUN /usr/local/bin/python3.7 -m pip install --upgrade pip
RUN apt-get install -y  python3-scapy
RUN pip3 install pre scapy[basic]
RUN pip3 install Cython
RUN pip3 install python-libpcap
WORKDIR ../home/sshcls/
RUN chown sshcls:sshcls /home/sshcls/*
RUN chmod +x script.sh
# RUN echo "sshcls:yoquese" | chpasswd

CMD /home/sshcls/script.sh