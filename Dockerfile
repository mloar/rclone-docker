FROM debian:trixie-slim

RUN apt-get update
RUN apt-get install ca-certificates jq rclone sudo -y

COPY auth_proxy.sh /

ENV PORT 8080
ENV BASEURL /

CMD rclone serve webdav --addr 0.0.0.0:$PORT --auth-proxy /auth_proxy.sh --baseurl $BASEURL
