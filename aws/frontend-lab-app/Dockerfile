FROM murill00/frontend-lab-baseimage:latest

USER root

RUN chmod -R 0777 /var/log/nginx
RUN chmod -R 0777 /var/cache/nginx
RUN chmod -R 0777 /var/run/

#Install app using yum
#RUN yum update -y && yum install frontend-lab-app.x86_64

#Adding index.html directly
COPY index.html /usr/share/nginx/html/

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
