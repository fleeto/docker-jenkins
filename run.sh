#!/bin/sh
rm -f /etc/localtime
ln -s "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime
if [ -d "/data/maven/conf" ]; then
  cp -Rf /data/maven/conf/* $MAVEN_HOME/conf
fi

if [ -d "/data/sonar/conf" ]; then
  cp -Rf /data/sonar/conf/* $SONAR_HOME/conf
fi

java -jar /usr/share/jenkins.war
