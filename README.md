# docker-jenkins

`docker pull dustise/jenkins`

Added something into it.
Try to follow the latest LTS version of jenkins.

## Include

- Alpine Linux
- Oracle JDK 8u102
- Jenkins 2.7.2
- Maven 3.3
- Kubectl 1.3.5
- Sonar Scanner 2.6.1
- Robot Framework

## Volumes

- `/data/jenkins`: Jenkins home
- `/data/kube`: you can copy your kube config here.
- `/data/maven/conf`: Anything in it will be copied (**OVERWRITE**) into /usr/local/share/maven/conf,
- `/data/sonar/conf`: Anything in it will be copied (**OVERWRITE**) into /usr/local/share/sonar/conf,
- `/data/robot`: Result here

## Ports

- 8080: Jenkins

## Env

- `JAVA_HOME`: `/usr/lib/java`
- `MAVEN_HOME`: `/usr/local/share/maven`
- `SONAR_HOME`: `/usr/local/share/sonar`
