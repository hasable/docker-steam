FROM debian:stable-slim
LABEL maintainer="hasable"

# 60000 should be ok, according to this page:
# https://docs.oracle.com/cd/E19120-01/open.solaris/819-2379/userconcept-3/index.html	
ARG USER_NAME=steamu
ARG UID=60000

USER root

RUN dpkg --add-architecture i386 \
	&& apt-get update \
	&& apt-get install -y wget libstdc++6:i386 \
	&& mkdir /opt/steam \
	&& useradd -u ${UID} -ms /bin/bash ${USER_NAME} \
	&& chown ${USER_NAME}:${USER_NAME} /opt/steam

USER ${USER_NAME}

RUN wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz -O /tmp/steamcmd_linux.tar.gz \
	&& tar -zxvf /tmp/steamcmd_linux.tar.gz -C /opt/steam \
	&& rm -f /tmp/steamcmd_linux.tar.gz \
	&& /opt/steam/steamcmd.sh +login anonymous +quit
