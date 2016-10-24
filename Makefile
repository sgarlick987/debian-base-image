ASSOCIATE_PUBLIC_IP?=true
SUBNET_TYPE?=public
BUILD_AZ?=us-east-1a

packer:
	packer build \
	    -var 'vpc_id=$(shell aws ec2 describe-vpcs --filter Name=tag:Name,Values=$(ENVIRONMENT) --query 'Vpcs[0].VpcId' --output text)' \
	    -var 'subnet_id=$(shell aws ec2 describe-subnets --filter Name=tag:Name,Values=$(ENVIRONMENT)-subnet-$(SUBNET_TYPE)-$(BUILD_AZ) --query 'Subnets[0].SubnetId' --output text)' \
	    -var 'associate_public_ip=$(ASSOCIATE_PUBLIC_IP)' \
	    image.json