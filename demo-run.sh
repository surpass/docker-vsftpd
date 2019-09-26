DOCKER_RUNTIME=/data/devops/ftpserver-test
docker run -d \
-v $DOCKER_RUNTIME/data:/home/vsftpd \
-v $DOCKER_RUNTIME/logs:/var/log/vsftpd \
-p 12020:12020 \
-p 12121:12121 -p 61100-61110:61100-61110 \
-e FTP_USER=myuser \
-e FTP_PASS=mypass \
-e PASV_MIN_PORT=61100 \
-e PASV_MAX_PORT=61110 \
-e PASV_ADDRESS=X.X.X.X \
--name ftpserver-test \
-e  LOG_STDOUT=1 \
--link=openldap:openldap \
--restart=always vsftpd-ldap:0.0.1

