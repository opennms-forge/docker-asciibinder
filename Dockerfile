FROM centos/ruby-24-centos7

ARG LANG=en_US.UTF-8

ENV JAVA_HOME=/usr/lib/jvm/${JAVA_VERSION_DETAIL}/jre/

USER root

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y install libtool && \
    scl enable rh-ruby24 -- gem install listen && \
    scl enable rh-ruby24 -- gem install ascii_binder && \
    yum -y install java-1.8.0-openjdk-devel && \
    yum clean all && \
    rm -rf /var/cache/yum

LABEL url="http://www.asciibinder.org" \
      summary="a documentation system built on Asciidoctor" \
      description="AsciiBinder is for documenting versioned, interrelated projects. Run this container image from the documentation repository, which is mounted into the container. Note: Generated files will be owned by root." \
      RUN="docker run -it --rm \
          -v $(pwd):/docs:z \
          IMAGE"
LABEL org.opennms.java.version="openjdk-${JAVA_VERSION}-${JAVA_VERSION_DETAIL}"

COPY ./docker-entrypoint.sh /

RUN useradd -ms /bin/bash circleci

USER circleci

ENV HOME=/home/circleci

WORKDIR /home/circleci
