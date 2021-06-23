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
   # WORKAROUND for glibc 2.33 and old Docker
   # See https://github.com/actions/virtual-environments/issues/2658
   # Thanks to https://github.com/lxqt/lxqt-panel/pull/1562
   curl -fsSL "https://repo.archlinuxcn.org/x86_64/glibc-linux4-2.33-4-x86_64.pkg.tar.zst" | bsdtar -C / -xvf - && \
   pacman -Sy && \
   pacman -S git pacman-contrib sudo --noconfirm && \
   sed -i 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers && \
   sudo -u build git clone https://aur.archlinux.org/makedeb-alpha.git && \
   cd makedeb-alpha && \
   sudo -u build makepkg -si --noconfirm && \
 echo "**** Cleanup ****" && \
   rm -rf /tmp/*

# set default user
USER build