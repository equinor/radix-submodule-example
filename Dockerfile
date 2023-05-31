FROM alpine:3
RUN apk add redis && mkdir /redis && chown 1000:1000 -R /redis
RUN echo hei
USER 1000
CMD redis-server --port $(printenv | grep REDIS | grep PORT | grep SERVICE | awk -F= '{print $2}' | head -1) --requirepass "${REDIS_PASSWORD}" --dir "/redis"
