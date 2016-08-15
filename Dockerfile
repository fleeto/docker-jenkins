FROM centos:7
COPY run.sh /usr/local/bin
COPY prepare.sh /usr/local/bin

ENV JENKINS_HOME="/data/jenkins" \
TIMEZONE="Asia/Shanghai" \
JAVA_HOME="/etc/alternatives/java_sdk_1.8.0"

RUN prepare.sh

EXPOSE 8080
VOLUME ["/data/jenkins", "/data/maven"]
CMD ["run.sh"]
