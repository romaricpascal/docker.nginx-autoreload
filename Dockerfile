FROM nginx:1.7.9
MAINTAINER Romaric Pascal "romaric.pascal@gmail.com"

RUN apt-get update

ENV SUPERVISOR_VERSION=3.0a8-1.1+deb7u1
RUN apt-get install -y supervisor=${SUPERVISOR_VERSION}

ENV INCRON_VERSION=0.5.10-1
RUN apt-get install -y incron=${INCRON_VERSION}

ADD supervisor/conf.d /etc/supervisor/conf.d
ADD incron.d /etc/incron.d

CMD ["supervisord", "-n"]