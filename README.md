# docker-jenkins

`docker pull dustise/jenkins`

Added something into it.
Following the latest LTS version of jenkins.

## Include

- Alpine Linux
- Oracle JDK 8u102
- Jenkins 2.7.4
- Maven 3.3.9
- Kubectl 1.3.6
- Sonar Scanner 2.7
- Robot Framework
- Jenkins Slave 2.9

## Volumes

- `/data/jenkins`: Jenkins home
- `/data/kube`: you can copy your kube config here.
- `/data/maven`: Anything in `/data/maven/conf` will be copied (**OVERWRITE**) into /usr/local/share/maven/conf,
- `/data/sonar`: Anything in `/data/maven/conf` will be copied (**OVERWRITE**) into /usr/local/share/sonar/conf,
- `/data/robot`: Result here

## Ports

- 8080: Jenkins

## Env

- `JAVA_HOME`: `/usr/lib/java`
- `MAVEN_HOME`: `/usr/local/share/maven`
- `SONAR_HOME`: `/usr/local/share/sonar`
- `JENKINS_MODE`: "MASTER"(default) or "SLAVE"
