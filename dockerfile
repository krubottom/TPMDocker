
FROM solution360/apache2-php7-ioncube:latest

ARG TPM_VER=7.73.146
RUN apt-get update && apt-get install -y vim php7.0-mcrypt

WORKDIR /tmp
RUN wget http://teampasswordmanager.com/assets/download/teampasswordmanager_${TPM_VER}.zip && \
    unzip teampasswordmanager_${TPM_VER}.zip && \
    mv /tmp/teampasswordmanager_${TPM_VER}/* /var/www/html/

WORKDIR /var/www/html/

RUN chown -R www-data:www-data * && \
    rm install.txt && \
    rm index.html && \
    rm eula.txt && \
    rm upgrade.txt
