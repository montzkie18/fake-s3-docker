FROM alpine:3.6

RUN apk add --no-cache ruby ruby-bundler

ARG VERSION=1.2.0
ARG VOLUME=/data
ARG PORT=4569
ARG HOST=s3.amazonaws.com

ENV version $VERSION
ENV volume $VOLUME
ENV port $PORT
ENV host $HOST

RUN gem install --no-ri --no-rdoc fakes3 -v $version
RUN mkdir -p $volume

EXPOSE $port
RUN echo "Lib version: $version, path to volume: $volume, Port: $port"
CMD /usr/bin/fakes3 -r $volume -p $port -H $host
