FROM ubuntu:14.04

MAINTAINER Christoph Hahn <christoph.hahn@uni-graz.at>

#the following is based on the Dockerfile from robsyme/cegma-docker, with small modifications because
#his version wouldn't run with singularity

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y wget build-essential hmmer ncbi-blast+ wise && \
        apt-get clean && apt-get purge && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /usr/src

# Genewise
RUN wget http://korflab.ucdavis.edu/datasets/cegma/wise2.2.3-rc7.tar.gz && \
    tar xfz wise2.2.3-rc7.tar.gz && \
    rm wise2.2.3-rc7.tar.gz

# Install geneid
RUN wget ftp://genome.crg.es/pub/software/geneid/geneid_v1.4.4.Jan_13_2011.tar.gz && \
    tar xfz geneid_v1.4.4.Jan_13_2011.tar.gz && \
    rm geneid_v1.4.4.Jan_13_2011.tar.gz && \
    cd geneid && \
    make

# Install CEGMA
RUN wget https://github.com/KorfLab/CEGMA_v2/archive/v2.5.tar.gz && \
    tar -xzf v2.5.tar.gz && \
    cd CEGMA_v2-2.5 && \
    make

ENV WISECONFIGDIR /usr/src/wise2.2.3-rc7/wisecfg
ENV CEGMA /usr/src/CEGMA_v2-2.5
ENV PERL5LIB=${PERL5LIB}:$CEGMA/lib
ENV PATH=${PATH}:$CEGMA/bin:/usr/src/geneid/bin
