FROM centos:7
MAINTAINER Georg Zachl <georg.zachl@jku.at>

# Directory with all EDA Tools from the host should be mounted there
VOLUME /eda
VOLUME /home
VOLUME /sim
VOLUME /sim_nfs


# Install dnf, followed by enabeling some repos
RUN yum -y install dnf && dnf -y install 'dnf-command(config-manager)' && dnf -y install epel-release && dnf --enablerepo=epel group && dnf -y install centos-release-scl-rh && dnf -y clean all
# Install required packages for commercial EDA Tools
RUN dnf -y install xfce4-terminal ksh redhat-lsb-core redhat-lsb xterm motif-devel libXp-devel libpng12 libXtst glibc-devel gdb libXScrnSaver apr apr-util xorg-x11-server-Xvfb mesa-dri-drivers openssl-devel libxkbcommon-x11 xcb-util-image xcb-util-keysyms xcb-util-renderutil xcb-util-wm xdpyinfo openssl compat-db47 mesa-libGLU xorg-x11-fonts-misc xorg-x11-fonts-ISO8859-1-75dpi redhat-lsb compat-libtiff3 boost libgfortran5 gedit subversion git evince firefox vim parallel numactl nano tcsh htop nss_wrapper pulseaudio-libs-glib2 && dnf -y install glibc.i686 elfutils-libelf.i686 mesa-libGL.i686 mesa-libGLU.i686 motif-devel.i686 libXp-devel.i686 libpng.i686 libjpeg-turbo.i686 expat.i686 glibc-devel.i686 redhat-lsb.i686 && dnf -y clean all
RUN dnf group -y install "fonts" && dnf -y clean all

# Install fakeuname to report a supported kernel version, based on gttps://github.com/borting/fakeuname
RUN mv /bin/uname /bin/uname.real
COPY uname /bin/uname
RUN chmod 755 /bin/uname

# Finalize the container
WORKDIR /
COPY ui_startup.sh generate_container_user.sh /
RUN chmod +x /ui_startup.sh /generate_container_user.sh; /bin/dbus-uuidgen > /etc/machine-id
ENV HOME=/home/user
ENTRYPOINT ["/ui_startup.sh"]
