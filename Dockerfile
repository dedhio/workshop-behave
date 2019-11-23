FROM python:3.6
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SECRET_KEY abcde0s&&$uyc)hf_3rv@!a95nasd22e-dxt^9k^7!f+$jxkk+$k-
RUN mkdir /webapps
WORKDIR /webapps
# Installing OS Dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
libsqlite3-dev
RUN pip install -U pip setuptools
COPY requirements.txt /webapps/
#COPY requirements-opt.txt /webapps/
RUN pip install -r /webapps/requirements.txt
#RUN pip install -r /webapps/requirements-opt.txt
ADD . /webapps/
# Django service
EXPOSE 8000