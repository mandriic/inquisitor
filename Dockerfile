FROM kalilinux/kali-rolling
RUN apt update && apt install -y openssh-server && apt install -y sudo && apt install nano && apt install net-tools
RUN useradd -m -p '$1$ZCsRdJTX$AYbcC41lCuf1UgzBCbeIX.' sshcls
RUN usermod -aG sudo sshcls
COPY . .
RUN chmod +x /script.sh
# RUN echo "sshcls:yoquese" | chpasswd

CMD /script.sh