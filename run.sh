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
  if [ ! -f "${JENKINS_HOME}/jenkins.install.InstallUtil.lastExecVersion" ]; then
    echo "2.0" > "${JENKINS_HOME}/jenkins.install.InstallUtil.lastExecVersion"
    mkdir "${JENKINS_HOME}/init.groovy.d"
    cp /usr/share/jenkins/*.groovy "${JENKINS_HOME}/init.groovy.d/"
    cp /usr/share/jenkins/*.xml "${JENKINS_HOME}"
  fi
  java -jar -Duser.timezone=$TIMEZONE \
    -Dhudson.model.DirectoryBrowserSupport.CSP= \
    /usr/share/jenkins.war
fi
if [ $JENKINS_MODE = "SLAVE" ]; then
  MASTER_URL="-url $JENKINS_URL"
	java -Duser.timezone=$TIMEZONE \
  -Dorg.jenkinsci.remoting.engine.JnlpProtocol3.disabled=true \
  -cp /usr/share/slave.jar hudson.remoting.jnlp.Main -headless $MASTER_URL "$@"
fi
