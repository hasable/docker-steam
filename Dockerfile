FROM debian:stable-slim
LABEL maintainer="hasable"

USER root

RUN dpkg --add-architecture i386 \
	&& apt-get update \
	&& apt-get install -y wget libstdc++6:i386

RUN mkdir /opt/steam \
	&& useradd -ms /bin/bash server \
	&& chown server:server /opt/steam

USER server

RUN wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz -O /tmp/steamcmd_linux.tar.gz \
	&& tar -zxvf /tmp/steamcmd_linux.tar.gz -C /opt/steam \
	&& rm -f /tmp/steamcmd_linux.tar.gz

RUN /opt/steam/steamcmd.sh +login anonymous +quit

