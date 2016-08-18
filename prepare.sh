#!/bin/sh
apk add --update git subversion curl

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

apk add --update pip postgresql-dev gcc python-dev musl-dev
pip install decorator
pip install Django
pip install django-filter
pip install djangorestframework
pip install docutils
pip install Markdown
pip install psycopg2
pip install PyMySQL
pip install requests
pip install robotframework
pip install robotframework-databaselibrary
pip install robotframework-ftplibrary
pip install robotframework-requests
pip install robotframework-ride
pip install robotframework-selenium2library
pip install selenium

ln -s /usr/share/maven/bin/* /usr/local/bin
mkdir -p /data/jenkins
mkdir -p /data/maven
mkdir -p /data/kube
mkdir -p /data/sonar

rm -rf /var/cache/apk/*
