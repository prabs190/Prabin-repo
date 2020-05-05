

FROM ubuntu 
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install wordpress-y php
RUN apt-get install apache2 -y mysql-server php-mysql -y
COPY wordpress.conf /etc/apache2/sites-available/
RUN a2onsite
RUN apt-get update && apt-get install wordpress-y php
RUN apt-get install apache2 -y mysql-server php-mysql -y
COPY wordpress.conf /etc/apache2/sites-available/
RUN a2ensite wordpress
RUN a2rewrite
RUN service apache2 reload
RUN ["mysql","-U root","GRAND,SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress
EXPOSE 3306 80





