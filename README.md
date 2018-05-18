# docker-jenkins

`docker pull dustise/jenkins`

A Customizable docker image for Jenkins. With this image , you can simply add
your own init groovy script, set your first administrator, even change the
default config.xml.

And you can simply execute the command `install-plugins.sh plugin-name` to download
and install plugins and their dependencies.

Added some CI/CD related tools into the image.
Following the latest LTS version of Jenkins.
Support both Master or Slave mode.

Code for adding first user, comes from project
[issue](https://github.com/geerlingguy/ansible-role-jenkins/issues/50) of
[geerlingguy](https://github.com/geerlingguy), thank you.

`install-plugins.sh` and `jenkins-support` copied from
[Jenkins docker](https://github.com/jenkinsci/docker).

一个定制化程度较高的 Jenkins 镜像，跳过了系统的缺省初始化过程，在使用中可以方便的加入自己的
Groovy 初始化代码、设置初始用户，以及替换 config.xml。

提供了 install-plugins.sh 脚本，用于安装插件及其依赖。

另外还添加了一些 CI/CD 相关的工具。同时支持 Jenkins 的 Master 和 Slave 模式。

镜像会不定期跟踪更新 Jenkins 的 LTS 版本。

## Run

docker run -it -p 3001:8080 --rm  \
-e ADMIN_PASSWORD="MY_PaSS_W0rd" \
-e ADMIN_USER="administrator"  \
--name=jenkins \
dustise/jenkins:latest

## Build your own image

Build a new image with git support and some config file

Example:

~~~docker

FROM dustise/jenkins
COPY my_pretty_config.xml /usr/share/jenkins/config/config.xml
COPY some_strange_code.groovy /usr/share/jenkins/config/
RUN install-plugins.sh git

~~~

## Include

- Alpine Linux
- Oracle JDK 8u171
- Jenkins 2.107.3
- Maven 3.5.3
- Kubectl 1.10.2
- Sonar Scanner 3.1.0.1141-linux
- Robot Framework
- Jenkins Slave 3.9
- Ansible

## Volumes

- `/usr/share/jenkins/config`: Volume for **initialization**:

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
