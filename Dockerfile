FROM python:2.7
ENV PYTHONUNBUFFERED 1
RUN apt-get update && apt-get -y upgrade
RUN pip install requests



RUN mkdir -p /my-django-app
ADD requirements.txt /my-django-app

RUN apt -y install openssh-client
RUN apt -y install openssh-client
RUN pip install -r /my-django-app/requirements.txt
RUN apt-get -y install iputils-ping
RUN apt-get -y install net-tools
RUN ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""
RUN apt-get -y install sshpass
RUN apt-get -y install vim
RUN apt-get -y install lsof
ADD . /my-django-app

WORKDIR /my-django-app


RUN python manage.py makemigrations
RUN python manage.py migrate --run-syncdb
RUN python manage.py migrate
EXPOSE 8000

CMD python manage.py runserver 0.0.0.0:8007

