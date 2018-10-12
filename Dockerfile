# doesn't work for Ubuntu 18.04 (yet?)
# https://cloud.google.com/monitoring/agent/#supported_operating_systems
from ubuntu:16.04

RUN apt-get update && apt-get -y install --no-install-recommends \
    vim-tiny \
    iproute2 \
    curl \
    ca-certificates \
    lsb-release \
    gnupg2 \
  && update-alternatives --install /usr/bin/vim vim /usr/bin/vim.tiny 1 

RUN curl -sSO https://dl.google.com/cloudagents/install-monitoring-agent.sh && \
    bash install-monitoring-agent.sh && \
    apt-get autoclean && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
