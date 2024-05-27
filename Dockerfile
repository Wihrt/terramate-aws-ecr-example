FROM renovate/renovate:full

ARG TERRAMATE_VERSION=v0.8.4

USER root

RUN curl -sL "https://github.com/terramate-io/terramate/releases/download/${TERRAMATE_VERSION}/terramate_$(echo $TERRAMATE_VERSION | tr -d 'v')_linux_x86_64.tar.gz" -o terramate.tar.gz && \
    tar xvf terramate.tar.gz && \
    mv terramate terramate-ls /usr/bin/ && \
    rm -rf terramate.tar.gz CHANGELOG.md LICENSE README.md

USER ubuntu