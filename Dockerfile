FROM node:8.4.0-alpine

RUN apk --no-cache add \
    tini \
    procps 
#    coreutils \
#    bash

COPY . /usr/src/app
WORKDIR /usr/src/app

# RUN apk --no-cache add --virtual deps git 
RUN npm install -g 
# RUN apk del deps 
RUN ln -s /usr/src/app/run.sh /usr/local/bin/run-sematext-agent

EXPOSE 9000

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["run-sematext-agent"]
