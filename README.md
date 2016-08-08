# docker-jenkins

> docker pull dustise/jenkins

Added something into it.
Try to follow the latest version of jenkins.

## Include

- CentOS 7
- Open JDK 1.8.0
- Jenkins 2.17
- Maven 3.3
- kubectl

## Volumes

- `/kenkins`: Jenkins home
- `/conf/kube`: copy your kube config here.
- `/conf/maven`: Anything in it will be copied (**OVERWRITE**) into /usr/local/share/maven/conf,

## Ports

- 8080: Jenkins
