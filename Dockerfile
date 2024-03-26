FROM redhat/ubi8

RUN yum update && yum install wget -y

RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

RUN yum install fontconfig java-17-openjdk -y
RUN yum install jenkins -y

RUN echo -e "root ALL=(ALL) ALL" >> /etc/sudoers
RUN echo -e "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /var/lib/jenkins
CMD java -jar /usr/share/java/jenkins.war
EXPOSE 8080