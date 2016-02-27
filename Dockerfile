FROM fedora:23
MAINTAINER Alexander Trost <galexrt@googlemail.com>

ENV STEAMCMD_PATH="/steamcmd"

RUN dnf -q upgrade -y && \
    dnf install -y tar glibc.i686 libstdc++.i686 && \
    mkdir -p "$STEAMCMD_PATH" && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | \
    tar xz -C "$STEAMCMD_PATH" && \
    "$STEAMCMD_PATH/steamcmd.sh" +login anonymous +quit && \
    dnf clean all && \
    rm -rf /var/lib/dnf/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/locale/*

ENTRYPOINT ["$STEAMCMD_PATH/steamcmd.sh"]
