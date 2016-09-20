#!/bin/sh
rm -f /etc/localtime
ln -s "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime
if [ -d "/data/maven/conf" ]; then
  cp -Rf /data/maven/conf/* $MAVEN_HOME/conf
fi

if [ -d "/data/sonar/conf" ]; then
  cp -Rf /data/sonar/conf/* $SONAR_HOME/conf
fi

if [ $JENKINS_MODE = "MASTER" ]; then
  java -jar /usr/share/jenkins.war
fi
if [ $JENKINS_MODE = "SLAVE" ]; then
  MASTER_URL="-url $JENKINS_URL"
	java -Dorg.jenkinsci.remoting.engine.JnlpProtocol3.disabled=true \
  -cp /usr/share/slave.jar hudson.remoting.jnlp.Main -headless $MASTER_URL "$@"
fi
