FROM centos:centos7

MAINTAINER Aaditya Tiwari <aadityatiwari2801@gmail.com>

RUN echo -e "\
[mongodb]\n\
name=MongoDB Repository\n\
baseurl=https://repo.mongodb.org/yum/redhat/7Server/mongodb-org/3.0/x86_64/\n\
gpgcheck=0\n\
enabled=1\n" >> /etc/yum.repos.d/mongodb.repo

RUN yum update -y && yum install -y mongodb-org

RUN mkdir -p /data/mongodb /var/log/mongodb /var/run/mongodb

VOLUME ["/data/mongodb", "/var/log/mongodb"]

EXPOSE 27017

ENTRYPOINT ["/usr/bin/mongod"]

CMD ["--port", "27017", "--dbpath", "/data/mongodb", "--pidfilepath", "/var/run/mongodb/mongod.pid"]

