FROM debian:trixie-slim

RUN apt-get update
RUN apt-get install ca-certificates jq rclone sudo -y

COPY auth_proxy.sh /

CMD rclone serve webdav --addr 0.0.0.0:${PORT:-8080} --auth-proxy /auth_proxy.sh --baseurl ${BASEURL:-/} --exclude ${EXCLUDE:-'.**'}
