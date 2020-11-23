FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y vagrant virtualbox

COPY entrypoint.sh /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
