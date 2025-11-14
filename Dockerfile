FROM alpine:latest

RUN apk update
RUN apk add bash ca-certificates jq rclone sudo

COPY auth_proxy.sh /

CMD rclone serve webdav --addr 0.0.0.0:${PORT:-8080} --auth-proxy /auth_proxy.sh --baseurl ${BASEURL:-/} --exclude ${EXCLUDE:-'.**'}
