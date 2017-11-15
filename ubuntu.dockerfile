FROM dustise/oracle-jdk:ubuntu-jdk-0.8.3
COPY run.sh /usr/local/bin
COPY prepare.sh /usr/local/bin
COPY config.xml /usr/share/jenkins/config/config.xml
COPY install-plugins.sh /usr/local/bin
COPY jenkins-support /usr/local/bin
ENV JENKINS_HOME="/data/jenkins" \
  MAVEN_HOME="/usr/local/share/maven" \
  SONAR_HOME="/usr/local/share/sonar" \
  MAVEN_VER="3.5.0" \
  SONAR_SCANNER_VER="3.0.3.778" \
  KUBECTL_VER="1.7.10" \
  SLAVE_VER="3.9" \
  JENKINS_MODE="MASTER" \
  TIMEZONE="Asia/Shanghai" \
  JENKINS_UC="https://updates.jenkins-ci.org" \
  REF="$JENKINS_HOME/plugins" \
  ADMIN_USER="root" \
  ADMIN_PASSWORD="abcd!@#$"
RUN prepare.sh
EXPOSE 8080
VOLUME ["/usr/share/jenkins/", "/data/jenkins", "/data/maven", "/data/kube", "/data/sonar", "/data/robot"]
CMD ["run.sh"]
