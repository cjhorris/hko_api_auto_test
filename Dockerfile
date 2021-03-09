FROM python:3.7-alpine

#RUN apk update && apk --no-cache add postgresql-dev gcc python3-dev musl-dev git &&\
#    mkdir /app
#
#RUN apk --no-cache add libaio libnsl libc6-compat curl

RUN mkdir /app
COPY requirements.txt /app
WORKDIR /app
RUN pip install -r requirements.txt

ADD . /app
