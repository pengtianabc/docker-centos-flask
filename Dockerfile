FROM centos:centos7

MAINTAINER pengtianabc

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY requirements.txt /requirements.txt
COPY src /root/app
COPY uwsgi /etc/uwsgi
ENV HOME /root
# WORKDIR /root/

RUN yum install python3-pip mysql-devel python3-devel gcc python-imaging  -y --nogpgcheck 
RUN pip3 install mysqlclient uwsgi
RUN pip3 install virtualenv
RUN virtualenv /venvpy3
RUN (. /venvpy3/bin/activate && pip install -r /requirements.txt)

RUN chmod 755 docker-entrypoint.sh
# # Ensure UTF-8 lang and locale
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

EXPOSE 5000
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ['bash', 'app']

