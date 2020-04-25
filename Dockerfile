FROM jenkins/jenkins:lts

# lets disable the startup wizard for automation purposes.
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

# plugins.txt contains a list of all transient dependencies of the kubernetes plugin.
COPY plugins.txt /usr/share/jenkins/ref/

# custom.groovy includes some setup instructions for configuring our instance.
COPY custom.groovy /usr/share/jenkins/ref/init.groovy.d/custom.groovy

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt


