FROM php:apache
COPY ./htadmin /var/www/html/htadmin
COPY ./httpd.conf /etc/apache2/apache2.conf
COPY ./index.html /var/www/html/index.html
#RUN chmod -R 777 /var/www/html
#COPY ./public-html/ /usr/local/apache2/htdocs/
#podman run --rm php:apache cat /etc/apache2/apache2.conf > deb_httpd.conf
