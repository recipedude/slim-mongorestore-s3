FROM recipedude/slim-mongodump-s3:latest
LABEL maintainer "Sean Wenzel <sean@infinitenetworks.com>"

ADD files/run.sh /scripts/run.sh
RUN chmod -R 755 /scripts

ENV AWS_ACCESS_KEY_ID ""
ENV AWS_SECRET_ACCESS_KEY ""

VOLUME /data
VOLUME /root/.aws

CMD ["/scripts/run.sh"]
