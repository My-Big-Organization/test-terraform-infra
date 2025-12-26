FROM hashicorp/terraform:1.6 AS terraform
FROM amazon/aws-cli:2.15.0 AS awscli
FROM bitnami/kubectl:1.28 AS kubectl

FROM ubuntu:22.04
COPY --from=terraform /bin/terraform /usr/local/bin/
COPY --from=awscli /usr/local/aws-cli /usr/local/aws-cli
COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/

RUN apt-get update && apt-get install -y curl jq
