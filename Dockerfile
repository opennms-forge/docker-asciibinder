FROM centos/ruby-22-centos7

LABEL maintainer "Ronny Trommer <ronny@opennms.org>"

ARG JAVA_VERSION=1.8.0
ARG JAVA_VERSION_DETAIL=1.8.0.144

USER root

RUN yum -y --setopt=tsflags=nodocs update && \
    scl enable rh-ruby22 -- gem install listen -v 3.0.8 && \
    scl enable rh-ruby22 -- gem install ascii_binder && \
    yum -y install java-${JAVA_VERSION}-openjdk-devel-${JAVA_VERSION_DETAIL} && \
    yum clean all

ENV JAVA_HOME=/usr/lib/jvm/${JAVA_VERSION_DETAIL}/jre/
ENV LANG=en_US.UTF-8

LABEL url="http://www.asciibinder.org" \
      summary="a documentation system built on Asciidoctor" \
      description="AsciiBinder is for documenting versioned, interrelated projects. Run this container image from the documentation repository, which is mounted into the container. Note: Generated files will be owned by root." \
      RUN="docker run -it --rm \
          -v $(pwd):/usr/src/docs:z \
          IMAGE"

COPY ./docker-entrypoint.sh /

WORKDIR /usr/src/docs

VOLUME ["/usr/src/docs"]

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["--help"]
