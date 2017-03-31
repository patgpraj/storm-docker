FROM ubuntu:latest 
MAINTAINER steelhouse 

RUN apt-get update; apt-get install -y software-properties-common unzip wget supervisor docker.io openssh-server
RUN echo 'root:wurstmeister' | chpasswd
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \ 
  rm -rf /var/cache/oracle-jdk8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN echo $JAVA_HOME && java -version

# Install Gradle (inspired by https://hub.docker.com/r/frekele/gradle/~/dockerfile/ )
ENV GRADLE_VERSION=3.1
ENV GRADLE_HOME=/opt/gradle
ENV GRADLE_FOLDER=/root/.gradle
RUN wget -q --no-check-certificate --no-cookies https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
		-O /tmp/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip -q /tmp/gradle-${GRADLE_VERSION}-bin.zip -d /opt \
	&& ln -s /opt/gradle-${GRADLE_VERSION} /opt/gradle \
	&& rm -f /tmp/gradle-${GRADLE_VERSION}-bin.zip
RUN update-alternatives --install "/usr/bin/gradle" "gradle" "/opt/gradle/bin/gradle" 1 \
&& update-alternatives --set "gradle" "/opt/gradle/bin/gradle" 

ENV PATH=$PATH:$GRADLE_HOME/bin
RUN gradle --version

EXPOSE 22