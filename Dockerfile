FROM centos:latest

LABEL version="0.1.1"

RUN yum install -y yum-utils && yum groupinstall -y development
RUN yum install -y vim
RUN yum install -y git-all.noarch wget
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum install -y python36u python36u-pip python36u-devel python36u-wheel python36u-setuptools

RUN pip3.6 install awscli
RUN pip3.6 install boto3

RUN cd /tmp \
    && wget https://releases.hashicorp.com/terraform/0.12.0/terraform_0.12.0_linux_amd64.zip \
    && unzip terraform_0.12.0_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && rm -rf terraform_0.12.0_linux_amd64.zip

RUN yum install -y epel-release
RUN yum install -y ansible
RUN yum install -y nodejs

RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
RUN sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'
RUN yum -y install azure-cli

RUN echo $'[google-cloud-sdk] \n\
name=Google Cloud SDK \n\
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64 \n\
enabled=1 \n\
gpgcheck=1 \n\
repo_gpgcheck=1 \n\
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg \n\
\t     https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg' > /etc/yum.repos.d/google-cloud-sdk.repo

RUN yum install google-cloud-sdk -y

RUN cd /tmp \
    && wget https://packages.chef.io/files/stable/chefdk/3.5.13/el/7/chefdk-3.5.13-1.el7.x86_64.rpm \
    && rpm -ivh chefdk-3.5.13-1.el7.x86_64.rpm
