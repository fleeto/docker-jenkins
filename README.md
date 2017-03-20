# docker-jenkins

`docker pull dustise/jenkins`

Added something into it.
Following the latest LTS version of jenkins.
Support both Master or Slave mode.

## Include

- Alpine Linux
- Oracle JDK 8u121
- Jenkins 2.32.3
- Maven 3.3.9
- Kubectl 1.5.4
- Sonar Scanner 2.8
- Robot Framework
- Jenkins Slave 2.9
- Ansible
- Nodejs-npm

## Volumes

- `/data/jenkins`: Jenkins home

- `/data/kube`: you can copy your kube config here.

- `/data/maven`: Anything in `/data/maven/conf` will be copied (**OVERWRITE**) into /usr/local/share/maven/conf,

- `/data/sonar`: Anything in `/data/maven/conf` will be copied (**OVERWRITE**) into /usr/local/share/sonar/conf,

- `/data/robot`: Result here

## Ports

- 8080: Jenkins

## Env

|Name|Default Value|Comment|
|---|---|---|
|`JAVA_HOME`|`/usr/lib/java`||
|`TIMEZONE`|`Asia/Shanghai`|Will change the system settings, and Jenkins will use it when start up. |
|`JENKINS_MODE`|`MASTER`|`MASTER` or `SLAVE`|
|`MAVEN_HOME`|`/usr/local/share/maven`||
|`SONAR_HOME`|`/usr/local/share/sonar`||
|`JENKINS_HOME`|`/data/jenkins`||
