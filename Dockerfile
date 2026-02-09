# Ubuntu base image
FROM ubuntu:22.04

# Desktop environment aur tools install karna
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies \
    novnc python3-websockify python3-pip \
    x11vnc \
    firefox \
    && apt-get clean

# Ports set karna
EXPOSE 7860

# Desktop setup script
CMD x11vnc -create -forever -nopw -display :0 -rfbport 5900 & \
    websockify --web=/usr/share/novnc/ 7860 localhost:5900
    
