FROM ubuntu:18.04

# Update ubuntu
RUN apt-get update
RUN apt-get dist-upgrade -y

# get needed packages
RUN apt-get install -y nginx wget pip

COPY default /etc/nginx/sites-available/default

ADD requirements.txt /requirements.txt
RUN pip install -r requirements.txt

COPY python_mirror.py /usr/local/src/python_mirror

ADD start.sh /start.sh

RUN chmod 700 /start.sh

EXPOSE 80

CMD ["./start.sh"]