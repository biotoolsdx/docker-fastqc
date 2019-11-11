FROM anapsix/alpine-java:jdk8

MAINTAINER CHEN, Yuelong <yuelong.chen.btr@gmail.com>


ARG fastqc_version=v0.11.8

# install fastqc


ENV package_name fastqc_${fastqc_version}.zip

ADD http://www.bioinformatics.babraham.ac.uk/projects/fastqc/${package_name} /tmp/

RUN cd /opt/ && unzip /tmp/${package_name} \
    && rm /tmp/${package_name} \
    && apk update \
    && apk add perl \
    && chmod 755 /opt/FastQC/fastqc

ENV PATH /opt/FastQC:$PATH

CMD fastqc