FROM centos:7
RUN yum update -y

RUN yum install -y java-1.8.0-openjdk openssh-server

RUN /usr/bin/ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ""
RUN /usr/bin/ssh-keygen -t rsa -b 1024 -f /etc/ssh/ssh_host_dsa_key -N ""

EXPOSE 22

RUN groupadd jenkins && useradd -d /home/jenkins -g jenkins -m jenkins

RUN mkdir /home/jenkins/.ssh

COPY /files/id_jenkins.pub /home/jenkins/.ssh/authorized_keys

RUN chown -R jenkins:jenkins /home/jenkins/.ssh \
  && chmod 700 /home/jenkins/.ssh \
  && chmod 644 /home/jenkins/.ssh/authorized_keys

