FROM dustise/oracle-jdk:alpine-jdk-0.7.4
COPY run.sh /usr/local/bin
COPY prepare.sh /usr/local/bin
COPY config.xml /usr/share/jenkins/config/config.xml
ENV JENKINS_HOME="/data/jenkins" \
  MAVEN_HOME="/usr/local/share/maven" \
  SONAR_HOME="/usr/local/share/sonar" \
  MAVEN_VER="3.3.9" \
  SONAR_SCANNER_VER="2.8" \
  KUBECTL_VER="1.6.0" \
  SLAVE_VER="2.9" \
  JENKINS_MODE="MASTER" \
  TIMEZONE="Asia/Shanghai" \
  ADMIN_USER="root" \
  ADMIN_PASSWORD="abcd!@#$"
RUN prepare.sh
EXPOSE 8080
VOLUME ["/usr/share/jenkins/", "/data/jenkins", "/data/maven", "/data/kube", "/data/sonar", "/data/robot"]
CMD ["run.sh"]
