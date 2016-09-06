#!/bin/sh

set -xe

#PREPARE
#Linux Version
SIG=`cat /etc/*release | grep  ^NAME | cut -c7`

# Alpine
if [ $SIG = "A" ]; then
  apk add --update git subversion curl
fi

if [ "$SIG" = "U" ]; then
  export DEBIAN_FRONTEND="noninteractive"
  apt-get update
  apt-get -y upgrade
  apt-get install ca-certificates curl git subversion unzip\
  -y --no-install-recommends
fi

curl -L -o /usr/share/jenkins.war \
http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war

curl -L -o apache-maven-3.3.9-bin.tar.gz \
http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-$MAVEN_VER-bin.tar.gz
tar xf apache-maven-$MAVEN_VER-bin.tar.gz
mv apache-maven-$MAVEN_VER $MAVEN_HOME
rm apache-maven-$MAVEN_VER-bin.tar.gz

curl -L -o /usr/local/bin/kubectl \
https://storage.googleapis.com/kubernetes-release/release/v$KUBECTL_VER/bin/linux/amd64/kubectl
chmod a+x /usr/local/bin/kubectl

curl -L -o sonar-scanner-$SONAR_SCANNER_VER.zip \
https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-$SONAR_SCANNER_VER.zip
unzip sonar-scanner-$SONAR_SCANNER_VER.zip
mv sonar-scanner-$SONAR_SCANNER_VER $SONAR_HOME
rm sonar-scanner-$SONAR_SCANNER_VER.zip

if [ $SIG = "A" ]; then
  apk add --update py-pip postgresql-dev gcc python-dev musl-dev
fi

if [ "$SIG" = "U" ]; then
  apt-get install python-pip python-setuptools libpq-dev python-dev gcc \
  -y --no-install-recommends
  pip install --upgrade pip
fi

pip install --no-cache-dir decorator Django django-filter djangorestframework docutils \
Markdown psycopg2 PyMySQL requests robotframework \
robotframework-databaselibrary robotframework-ftplibrary \
robotframework-requests robotframework-ride \
robotframework-selenium2library


ln -s /usr/share/maven/bin/* /usr/local/bin
mkdir -p /data/jenkins
mkdir -p /data/maven
mkdir -p /data/kube
mkdir -p /data/sonar

if [ $SIG = "A" ]; then
  rm -rf /var/cache/apk/*
fi

if [ $SIG = "U"]; then
  rm -rf /var/lib/apt/lists/*
fi
