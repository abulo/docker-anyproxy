FROM alpine

RUN apk update 
RUN apk add yarn --no-cache

COPY rootCA.* /root/.anyproxy/certificates/

RUN yarn global add anyproxy &&\
    yarn cache clean

EXPOSE 8001 8002

ENTRYPOINT anyproxy --intercept --ws-intercept