FROM ubuntu:latest

RUN apt update -y && apt install curl systemd -y

ENV PATH="${PATH}:/nix/var/nix/profiles/default/bin"
ENV EDITOR=nvim
RUN echo 'eval "$(direnv hook bash)" || true' >> /root/.bashrc

WORKDIR /app

COPY home/tim/sandbox/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
