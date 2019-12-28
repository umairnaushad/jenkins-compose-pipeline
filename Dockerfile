FROM jenkins/jenkins:lts

RUN /usr/local/bin/install-plugins.sh git matrix-auth workflow-aggregator docker-workflow blueocean credentials-binding


ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY plugins.txt /usr/share/jenkins/plugins.txt

VOLUME /var/jenkins_home
