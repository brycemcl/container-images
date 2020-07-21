FROM brycemclachlan/base-ubuntu:latest AS base
FROM base


RUN apt-get update
RUN apt-get install -y --no-install-recommends apache2
RUN mkdir /var/www/webdav
RUN chown -R www-data:www-data /var/www/
RUN a2enmod dav
RUN a2enmod dav_fs

#RUN apt-get install -y --no-install-recommends samba samba-common
##ADD smb.conf /etc/samba/smb.conf
ENTRYPOINT ["tini", "--"]
#CMD ["/usr/sbin/smbd", "--foreground", "--no-process-group"]

## sudo podman run -p 137:137/udp -p 138:138/udp -p 139:139 -p 445:445