FROM centos/ruby-22-centos7

LABEL maintainer "Ronny Trommer <ronny@opennms.org>"

ARG JAVA_VERSION=1.8.0
ARG JAVA_VERSION_DETAIL=1.8.0.151

USER root

RUN scl enable rh-ruby22 -- gem install listen -v 3.0.8 && \
    scl enable rh-ruby22 -- gem install ascii_binder && \
    yum -y --setopt=tsflags=nodocs update && \
    yum -y install java-${JAVA_VERSION}-openjdk-devel-${JAVA_VERSION_DETAIL} && \
    yum -y install epel-release && \
    yum -y nstall python34 python34-pip && \
    pip3 install git+https://github.com/smitthakkar96/ascii_binder_search_plugin && \
    yum clean all && \
    rm -rf /var/cache/yum

# RUN pip install git+https://github.com/smitthakkar96/ascii_binder_search_plugin

ENV JAVA_HOME /usr/lib/jvm/java
ENV LANG=en_US.UTF-8

LABEL url="http://www.asciibinder.org" \
      summary="a documentation system built on Asciidoctor" \
      description="AsciiBinder is for documenting versioned, interrelated projects. Run this container image from the documentation repository, which is mounted into the container. Note: Generated files will be owned by root." \
      RUN="docker run -it --rm \
          -v $(pwd):/usr/src/docs:z \
          IMAGE"
LABEL org.opennms.java.version="openjdk-${JAVA_VERSION}-{JAVA_VERSION_DETAIL}"

COPY ./docker-entrypoint.sh /

WORKDIR /usr/src/docs

VOLUME ["/usr/src/docs"]

# ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["--help"]
