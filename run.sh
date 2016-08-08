#!/bin/sh
rm -f /etc/localtime
ln -s "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime
cp -Rf /conf/maven/* /usr/local/share/maven/conf
java -jar /usr/local/share/jenkins.jar
