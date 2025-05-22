FROM debian:trixie-slim

RUN apt-get update
RUN apt-get install ca-certificates rclone -y

CMD rclone serve webdav loarstore:tasks --addr $RCLONE_ADDR:$RCLONE_PORT --user $RCLONE_USER --pass $RCLONE_PASS
