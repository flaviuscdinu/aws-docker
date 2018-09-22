FROM centos:latest

LABEL version="0.1.1"

RUN yum install -y yum-utils && yum groupinstall -y development
RUN yum install -y vim
RUN yum install -y git-all.noarch wget
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum install -y python36u python36u-pip python36u-devel python36u-wheel python36u-setuptools

RUN pip3.6 install awscli
RUN pip3.6 install boto3
RUN pip3.6 install azure-cli

RUN cd /tmp \
    && wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip \
    && unzip terraform_0.11.8_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && rm -rf terraform_0.11.8_linux_amd64.zip

RUN yum install -y epel-release
RUN yum install -y ansible
RUN yum install -y nodejs
