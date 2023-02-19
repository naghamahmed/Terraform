FROM jenkins/jenkins:lts
USER root
RUN apt-get update -y

#docker installation
RUN apt-get install apt-transport-https curl gnupg-agent ca-certificates software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y
RUN apt-get update -y
RUN apt-get install docker-ce docker-ce-cli containerd.io -y
RUN usermod -aG docker jenkins

#install terraform
RUN apt-get install -y \
    wget \
    unzip \
  && rm -rf /var/lib/apt/lists/*
RUN wget --quiet https://releases.hashicorp.com/terraform/1.4.0-alpha20221207/terraform_1.4.0-alpha20221207_linux_amd64.zip \
  && unzip terraform_1.4.0-alpha20221207_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_1.4.0-alpha20221207_linux_amd64.zip
