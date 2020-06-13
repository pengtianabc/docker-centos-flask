FROM centos:centos7

MAINTAINER pengtianabc

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY src /src
ENV HOME /root
# WORKDIR /root/

RUN yum install python3-pip mysql-devel python3-devel gcc python-imaging  -y --nogpgcheck 
RUN pip3 install flask-sqlacodegen mysqlclient flask flask_sqlalchemy redis redis-py-cluster flask-marshmallow marshmallow-sqlalchemy Pillow IPy
RUN chmod 755 docker-entrypoint.sh
# # Ensure UTF-8 lang and locale
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8



ARG REDIS_HOST="192.168.1.47"
ARG REDIS_PORT=6379
ARG DATABASE_URI="mysql://root:root@192.168.1.47:3306/db_tms"
ARG FLASK_LOG_FILE=/root/app.log
ARG FLASK_LOG_LEVEL=ERROR

ENV REDIS_HOST=${REDIS_HOST}
ENV REDIS_PORT=${REDIS_PORT}
ENV DATABASE_URI=${DATABASE_URI}
ENV FLASK_LOG_FILE=${FLASK_LOG_FILE}
ENV FLASK_LOG_LEVEL=${FLASK_LOG_LEVEL}

EXPOSE 5000
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ['app']

