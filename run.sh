#!/bin/sh
rm -f /etc/localtime
ln -s "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime
if [ -d "/data/maven" ]; then
  cp -Rf /data/maven/* /usr/local/share/maven/conf
fi

java -jar /usr/local/share/jenkins.jar
