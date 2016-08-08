#!/bin/sh
yum -y update
yum install -y --nogpgcheck java-1.8.0-openjdk-devel git subversion kubernetes-client
yum clean all

curl -L -o /usr/local/share/jenkins.jar http://mirrors.jenkins-ci.org/war/latest/jenkins.war

curl -L -o apache-maven-3.3.9-bin.tar.gz http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
tar xf apache-maven-3.3.9-bin.tar.gz
mv apache-maven-3.3.9 /usr/local/share/maven
rm apache-maven-3.3.9-bin.tar.gz

ln -s /usr/local/share/maven/bin/* /usr/local/bin
mkdir -p /data/jenkins
