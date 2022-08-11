#!/bin/bash
docker build -t kali_ssh .
docker run -itd --name ftp_server kali_ssh
docker run -itd --name client kali_ssh
docker run -itd --name atacker kali_ssh