FROM debian:trixie-slim

RUN apt-get update
RUN apt-get install ca-certificates rclone -y

CMD rclone serve webdav $RCLONE_REMOTE:$RCLONE_PATH --addr $RCLONE_ADDR:$RCLONE_PORT --htpasswd $RCLONE_HTPASSWD
