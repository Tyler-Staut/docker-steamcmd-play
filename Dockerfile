FROM ubuntu:latest

ENV RUNUSER steam
ENV DAEMON_HOME /home/${RUNUSER}
ENV STEAMCMD_LOC ${DAEMON_HOME}/steamcmd
ENV STEAMCMD ${STEAMCMD_LOC}/steamcmd.sh

# create user for steam
RUN adduser \
    --home /home/${RUNUSER} \
    --disabled-password \
    --shell /bin/bash \
    --gecos "user for running steam" \
    --quiet \
    ${RUNUSER}

# install dependencies
RUN apt-get update && \
    apt-get install -y \
    lib32gcc1 \
    ca-certificates \
    lib32stdc++6 \
    lib32z1 \
    lib32z1-dev \
    curl && \
    apt-get clean

# removing temp files
RUN rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    /usr/share/locale/* \
    /var/cache/debconf/*-old \
    /var/lib/apt/lists/* \
    /usr/share/doc/*

# Downloading SteamCMD and make the Steam directory owned by the steam user
RUN mkdir -p ${STEAMCMD_LOC}  && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -v -C ${STEAMCMD_LOC} -zx && \
    chown -R ${RUNUSER}:${RUNUSER} ${DAEMON_HOME}


USER ${RUNUSER}
WORKDIR ${STEAMCMD_LOC}

ENTRYPOINT ["/home/steam/steamcmd/steamcmd.sh"]
