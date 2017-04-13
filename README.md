# docker-jenkins

`docker pull dustise/jenkins`


Code for adding first user, comes from project
[issue](https://github.com/geerlingguy/ansible-role-jenkins/issues/50) of
[geerlingguy](https://github.com/geerlingguy), thank you.


Added some CI/CD related tools into the image.
Following the latest LTS version of jenkins.
Support both Master or Slave mode.

## Include

- Alpine Linux
- Oracle JDK 8u121
- Jenkins 2.46.1
- Maven 3.3.9
- Kubectl 1.6.0
- Sonar Scanner 2.8
- Robot Framework
- Jenkins Slave 2.9
- Ansible
- Nodejs-npm

## Volumes

- `/usr/share/jenkins/`: Volume for **initialization**:

  - Any `*.groovy` in it will be copied in to `$JENKINS_HOME/init.groovy.d/`

  - Any `*.xml` in it will be copied in to `$JENKINS_HOME`

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
|`ADMIN_USER`|root||
|`ADMIN_PASSWORD`|`abcd!@#$`|
