FROM nginx:1.7.9
MAINTAINER Romaric Pascal "romaric.pascal@gmail.com"

RUN apt-get update

ENV PYTHON_VERSION=2.7.3-4+deb7u1
ENV SETUPTOOLS_VERSION=0.6.24-1
ENV SUPERVISOR_VERSION=3.1.3
RUN apt-get install -y python=${PYTHON_VERSION} python-setuptools=${SETUPTOOLS_VERSION} \
    && easy_install supervisor==${SUPERVISOR_VERSION} \
    && mkdir -p /var/log/supervisor \
    && ln -s /etc/supervisor/supervisord.conf /etc/supervisord.conf

ENV INCRON_VERSION=0.5.10-1
RUN apt-get install -y incron=${INCRON_VERSION}

ADD supervisor /etc/supervisor
ADD incron.d /etc/incron.d

CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]