FROM ubuntu

RUN apt-get update \
    && apt-get install -y \
       autoconf \
       autotools-dev \
       build-essential \
       gcc \
       libattr1-dev \       
       libtool \
       wget \
       zlib1g-dev libyaml-0-2 \
    && wget http://ftp.software.ibm.com/storage/tivoli-storage-management/maintenance/client/v7r1/Linux/LinuxX86_DEB/BA/v716/7.1.6.0-TIV-TSMBAC-LinuxX86_DEB.tar \
    && tar xf 7.1.6.0-TIV-TSMBAC-LinuxX86_DEB.tar \
    && dpkg -i gskssl64_8.0-50.66.linux.x86_64.deb \
    && dpkg -i gskcrypt64_8.0-50.66.linux.x86_64.deb \
    && dpkg -i tivsm-api64.amd64.deb \
    && wget https://github.com/tstibor/ltsm.github.io/raw/master/lustre/lustre-builds/jessie/client/2.10/2.10.1/lustre-client-utils_2.10.1-1_amd64.deb \
    && wget https://github.com/tstibor/ltsm.github.io/raw/master/lustre/lustre-builds/jessie/client/2.10/2.10.1/lustre-dev_2.10.1-1_amd64.deb \
    && dpkg -i lustre-client-utils_2.10.1-1_amd64.deb \
    && dpkg -i lustre-dev_2.10.1-1_amd64.deb \
    && wget https://github.com/tstibor/ltsm/archive/master.tar.gz -O ltsm.tar.gz \
    && tar xf ltsm.tar.gz \
    && cd /ltsm-master \ 
    && ./autogen.sh && ./configure CFLAGS='-g -DDEBUG -O0' --enable-tests \
    && make \
    && cd .. \
    && rm -rf *.tar.gz *.tar *.deb
    