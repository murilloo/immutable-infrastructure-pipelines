FROM centos
COPY ./files/nginx.repo /etc/yum.repos.d/
COPY ./files/lab.repo /etc/yum.repos.d/
RUN yum update -y && yum install unzip nginx -y
COPY ./files/nginx.conf /etc/nginx/conf.d/default.conf
