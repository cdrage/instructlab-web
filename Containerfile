FROM quay.io/rh-aiservices-bu/instructlab-workbench-code-server-cuda:0.21.0

USER root

RUN dnf install go -y

ARG VERSION=v4.2.0
RUN wget https://github.com/mikefarah/yq/releases/download/v4.2.0/yq_linux_amd64.tar.gz -O - |\
tar xz && mv yq_linux_amd64 /usr/bin/yq

COPY web/ .

RUN go get
RUN go build

#! Entrypoint
ENTRYPOINT ["./main"]