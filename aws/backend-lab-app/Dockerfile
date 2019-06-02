FROM murill00/backend-lab-baseimage:latest

USER root

RUN chmod -R 0777 /var/log/nginx
RUN chmod -R 0777 /var/cache/nginx
RUN chmod -R 0777 /var/run/

#Install app using yum
#RUN yum update -y && yum install unzip nginx backend-lab-app.x86_64 -y

#Adding index.html directly
COPY index.html /usr/share/nginx/html/

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
