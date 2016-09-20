FROM dustise/oracle-jdk:alpine-jdk-0.6
COPY run.sh /usr/local/bin
COPY prepare.sh /usr/local/bin
ENV JENKINS_HOME="/data/jenkins" \
MAVEN_HOME="/usr/local/share/maven" \
SONAR_HOME="/usr/local/share/sonar" \
MAVEN_VER="3.3.9" \
SONAR_SCANNER_VER="2.7" \
KUBECTL_VER="1.3.6" \
SLAVE_VER="2.9" \
JENKINS_MODE="MASTER" \
TIMEZONE="Asia/Shanghai"
RUN prepare.sh
EXPOSE 8080
VOLUME ["/data/jenkins", "/data/maven", "/data/kube", "/data/sonar", "/data/robot"]
CMD ["run.sh"]