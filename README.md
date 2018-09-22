# aws-docker
Docker image for an aws development environment using centos7

## Components
* Python3
* Pip
* Aws-cli
* Azure-cli
* Terraform
* Boto3
* Ansible
* Nodejs

## Running the containter
docker run -ti --name aws --hostname aws -v host_path_to_mount:docker_path_to_mount kolxd/aws-env
