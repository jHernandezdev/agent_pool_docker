FROM ubuntu:20.04
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    curl \
    wget \
    git \
    iputils-ping \
    jq \
    lsb-release \
    software-properties-common 

RUN DEBIAN_FRONTEND=noninteractive curl -fsSL https://get.docker.com -o get-docker.sh && \
        sh get-docker.sh

RUN DEBIAN_FRONTEND=noninteractive mkdir /opt/dotnet && \
        cd /opt/dotnet && \
        wget https://download.visualstudio.microsoft.com/download/pr/17b6759f-1af0-41bc-ab12-209ba0377779/e8d02195dbf1434b940e0f05ae086453/dotnet-sdk-6.0.100-linux-x64.tar.gz && \
        tar -xf dotnet-sdk-6.0.100-linux-x64.tar.gz && \        
        rm -rf dotnet-sdk-6.0.100-linux-x64.tar.gz
ENV PATH="$PATH:/opt/dotnet"

RUN DEBIAN_FRONTEND=noninteractive curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
        chmod +x /usr/local/bin/docker-compose

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Can be 'linux-x64', 'linux-arm64', 'linux-arm', 'rhel.6-x64'.
ENV TARGETARCH=linux-x64

WORKDIR /azp

COPY ./start.sh .
RUN chmod +x start.sh

ENTRYPOINT [ "./start.sh" ]