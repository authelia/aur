FROM archlinux:base-devel

# set labels
LABEL maintainer="Nightah"

# environment variables
ENV HOME="/build" \
TERM="xterm"

# modifications
RUN \
  echo "**** Add build user ****" && \
    useradd -m -G wheel -s /bin/bash -d /build build && \
    echo "**** Install Authelia CD pre-requisites ****" && \
    cd /tmp && \
    pacman -Sy && \
    pacman -S git pacman-contrib --noconfirm && \
    sed -i 's/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers && \
    sudo -u build git clone https://aur.archlinux.org/makedeb.git && \
    cd makedeb && \
    sudo -u build makepkg -si --noconfirm && \
  echo "**** Cleanup ****" && \
    rm -rf /tmp/*

# set default user
USER build
