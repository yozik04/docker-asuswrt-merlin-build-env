# this builds asus-merlin firmware
FROM ubuntu:bionic
MAINTAINER Jevgeni Kiski <yozik04@gmail.com>
WORKDIR /home/merlin

# setup the build environment (i386 arch needed for libelf1:i386
# since host os and ubuntu:bionic are 64-bit)
RUN dpkg --add-architecture i386
RUN apt-get update \
	&& apt-get install -y apt-utils \
	&& apt-get -y dist-upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
		ccache \
		vim \
		libncurses5 \
		libncurses5-dev \
		m4 \
		bison \
		gawk \
		flex \
		libstdc++-6-dev \
		g++-4.8 \
		g++ \
		gengetopt \
		git \
		gitk \
		zlib1g-dev \
		autoconf \
		autopoint \
		libtool \
		shtool \
		autogen \
		mtd-utils \
		intltool \
		sharutils \
		docbook-xsl-* \
		libstdc++5 \
		texinfo \
		dos2unix \
		xsltproc \
		u-boot-tools \
		device-tree-compiler \
		python \
		qemu \
		gperf \
		liblzo2-dev \
		uuid-dev \
		build-essential \
		lzma-dev \
		liblzma-dev \
		lzma \
		binutils-dev \
		patch \
		cmake \
		intltool \
		libglib2.0-dev \
		gtk-doc-tools \
		libc6-i386 \
		lib32stdc++6 \
		lib32z1 \
		libelf1:i386 \
		libncurses5:i386 \
		libc6-dev-i386 \
	&& apt-get autoremove -y \
	&& apt-get autoclean -y \
	&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/RMerl/am-toolchains.git /home/merlin/am-toolchains
RUN ln -s /home/merlin/am-toolchains/brcm-arm-sdk/hndtools-arm-linux-2.6.36-uclibc-4.5.3 /opt/brcm-arm; \
	ln -s /home/merlin/am-toolchains/brcm-arm-hnd /opt/toolchains; \
	echo "PATH=\$PATH:/opt/brcm-arm/bin" >> /root/.profile

ENV PATH="${PATH}:/opt/brcm-arm/bin"

VOLUME ["/home/merlin/asuswrt-merlin-root"]

CMD ["/bin/bash"]
