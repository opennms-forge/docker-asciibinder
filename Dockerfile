FROM centos/ruby-22-centos7

MAINTAINER Ronny Trommer <ronny@opennms.org>

ARG OPENJDK_MAJOR_VERSION=1.7.0
ARG OPENJDK_VERSION=java-${OPENJDK_MAJOR_VERSION}-openjdk-${OPENJDK_MAJOR_VERSION}.95-2.6.4.0.el7_2.x86_64

ENV DOC_SRC /usr/src/docs

USER root

RUN scl enable rh-ruby22 -- gem install listen -v 3.0.8 && \
    scl enable rh-ruby22 -- gem install ascii_binder && \
    yum install -y java-${OPENJDK_MAJOR_VERSION}-openjdk && \
    yum clean all

ENV JAVA_HOME=/usr/lib/jvm/${OPENJDK_VERSION}/jre/
ENV LANG=en_US.UTF-8

LABEL url="http://www.asciibinder.org" \
      summary="a documentation system built on Asciidoctor" \
      description="AsciiBinder is for documenting versioned, interrelated projects. Run this container image from the documentation repository, which is mounted into the container. Note: Generated files will be owned by root." \
      RUN="docker run -it --rm \
          -v `pwd`:${DOC_SRC}:z \
          IMAGE"

WORKDIR ${DOC_SRC}

VOLUME ["/usr/src/docs"]

ENTRYPOINT ["/bin/bash", "-c", "/opt/rh/rh-ruby22/root/usr/local/bin/asciibinder"]

CMD ["--help"]

