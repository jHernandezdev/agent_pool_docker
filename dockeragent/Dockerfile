FROM ubuntu:latest

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
    sudo \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    curl \
    wget \
    git \
    iputils-ping \
    jq \
    lsb-release \
    software-properties-common \ 
    ca-certificates \
    curl \
    gnupg

RUN DEBIAN_FRONTEND=noninteractive sudo mkdir -m 0755 -p /etc/apt/keyrings
RUN DEBIAN_FRONTEND=noninteractive curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN DEBIAN_FRONTEND=noninteractive echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
          "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
          sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN DEBIAN_FRONTEND=noninteractive sudo apt-get update
RUN DEBIAN_FRONTEND=noninteractive sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

RUN DEBIAN_FRONTEND=noninteractive mkdir /opt/dotnet && \
        cd /opt/dotnet && \
        wget https://download.visualstudio.microsoft.com/download/pr/17b6759f-1af0-41bc-ab12-209ba0377779/e8d02195dbf1434b940e0f05ae086453/dotnet-sdk-6.0.100-linux-x64.tar.gz && \
        tar -xf dotnet-sdk-6.0.100-linux-x64.tar.gz && \        
        rm -rf dotnet-sdk-6.0.100-linux-x64.tar.gz
ENV PATH="$PATH:/opt/dotnet"

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Can be 'linux-x64', 'linux-arm64', 'linux-arm', 'rhel.6-x64'.
ENV TARGETARCH=linux-x64

WORKDIR /azp

COPY ./start.sh .
RUN chmod +x start.sh

ENTRYPOINT [ "./start.sh" ]