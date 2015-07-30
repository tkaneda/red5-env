FROM centos:latest
MAINTAINER Tadashi -money- KANEDA <tkaneda@gmail.com>
ENV RED5_VERSION 1.0.4-RELEASE

RUN echo "update latest modules"
RUN yum -y install unzip
RUN yum -y install which
RUN yum -y install wget
RUN wget --continue --no-check-certificate --header "Cookie: oraclelicense=a" -O jdk-linux-x64.rpm "http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.rpm"
RUN rpm -ihv jdk-linux-x64.rpm
ENV JAVA_HOME /usr/java/default
RUN curl -s get.gvmtool.net | bash
RUN source /.gvm/bin/gvm-init.sh
RUN wget -q https://github.com/Red5/red5-server/releases/download/v${RED5_VERSION}/red5-server-${RED5_VERSION}-server.tar.gz
RUN tar -xzf red5-server-${RED5_VERSION}-server.tar.gz
RUN mv red5-server-${RED5_VERSION} /opt/red5
RUN rm red5-server-${RED5_VERSION}-server.tar.gz
ADD hosts /etc/

WORKDIR /opt/red5

EXPOSE 843 5080 5443 1935 8443 8088 9999

ENTRYPOINT ["./red5.sh"]
CMD [""]



