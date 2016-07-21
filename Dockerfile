FROM centos:7
RUN yum -y update && \
    yum install -y --nogpgcheck java-1.8.0-openjdk-devel git subversion kubernetes-client
RUN yum clean all
ADD http://mirrors.jenkins-ci.org/war/2.11/jenkins.war /opt/jenkins.war
COPY run.sh /usr/local/bin
COPY config.testing /root/config.testing
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME="/jenkins" \
TIMEZONE="Asia/Shanghai"

ENTRYPOINT ["run.sh"]
EXPOSE 8080
CMD [""]
