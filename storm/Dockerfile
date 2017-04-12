FROM steelhousedev/ubuntu-java-gradle

#FROM steelhousedev/java8base
#FROM wurstmeister/base

MAINTAINER steelhouse

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN echo $JAVA_HOME && java -version
ENV GRADLE_VERSION=3.1
ENV GRADLE_HOME=/opt/gradle
ENV PATH=$PATH:$GRADLE_HOME/bin
RUN gradle --version

RUN wget -q -O - http://mirrors.sonic.net/apache/storm/apache-storm-1.0.1/apache-storm-1.0.1.tar.gz | tar -xzf - -C /opt

ENV STORM_HOME /opt/apache-storm-1.0.1
RUN groupadd storm; useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm; chown -R storm:storm $STORM_HOME; mkdir /var/log/storm ; chown -R storm:storm /var/log/storm

RUN ln -s $STORM_HOME/bin/storm /usr/bin/storm
RUN mkdir -p /etc/supervisor
RUN mkdir -p /etc/supervisor/conf.d

ADD storm.yaml $STORM_HOME/conf/storm.yaml
ADD cluster.xml $STORM_HOME/logback/cluster.xml
ADD config-supervisord.sh /usr/bin/config-supervisord.sh
ADD start-supervisor.sh /usr/bin/start-supervisor.sh 

RUN echo [supervisord] | tee -a /etc/supervisor/supervisord.conf ; echo nodaemon=true | tee -a /etc/supervisor/supervisord.conf
