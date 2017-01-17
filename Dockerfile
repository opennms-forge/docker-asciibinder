FROM indigo/centos-jdk8:latest
MAINTAINER Ronny Trommer <ronny@opennms.org>

ENV DOC_SRC /usr/src/asciibinder

RUN yum -y install which git-core && \
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
    curl -sSL https://get.rvm.io | bash -s stable --ruby && \
    export PATH=$PATH:/usr/local/rvm/rubies/ruby-2.3.3/bin && \
    gem install ascii_binder

WORKSPACE ${DOC_SRC}

VOLUME ["/usr/src/asciibinder"]

ENTRYPOINT ["/usr/local/rvm/rubies/ruby-2.3.3/bin/asciibinder"]

CMD ["--help"]