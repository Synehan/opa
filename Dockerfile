FROM ubuntu:18.04

ARG OPA_VERSION=v0.16.2

RUN apt update && apt install curl -y && \
    curl -L -o opa https://openpolicyagent.org/downloads/${OPA_VERSION}/opa_linux_amd64 && \
    mv opa /usr/local/bin/opa && \
    chmod +x /usr/local/bin/opa && \
    adduser opa --home /home/opa --disabled-password

USER opa

WORKDIR /home/opa

ENTRYPOINT [ "/usr/local/bin/opa" ]