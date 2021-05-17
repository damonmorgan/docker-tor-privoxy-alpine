FROM alpine

EXPOSE 8118 9050

RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add \
    privoxy \
    tor \
    runit \
    tini

COPY service /etc/service/

ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/service"]
