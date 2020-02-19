FROM archlinux:latest

# set labels
LABEL maintainer="Nightah"

# environment variables
ENV HOME="/build" \
TERM="xterm"

# modifications
RUN \
 echo "**** Install Authelia CD pre-requisites ****" && \
   pacman -Sy && \
   pacman -S base-devel pacman-contrib --noconfirm && \
 echo "**** Add build user ****" && \
   useradd -m -s /bin/bash -d /build build && \
 echo "**** Cleanup ****" && \
   rm -rf /tmp/*

# set default user
USER build