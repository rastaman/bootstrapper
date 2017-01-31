FROM python

RUN mkdir /srv/bootstrapper
COPY . /srv/bootstrapper
RUN chmod +x /srv/bootstrapper/entrypoint.sh

#RUN apk update && apk add ansible \
#    py-redis \
#    py-flask \
#    py-gunicorn \
#    py-setuptools

WORKDIR /srv/bootstrapper
RUN pip install -r requirements.txt

ENV BOOTSTRAPPER_SERVER=yes
ENV REDISTOGO_URL=127.0.0.1:6379

EXPOSE 8000
EXPOSE 6379

CMD ["/srv/bootstrapper/entrypoint.sh"]

