.PHONY: build

build:
	sam build

start:
	if [ -e ".aws-sam" ];then rm -rf ".aws-sam" ; fi
	make build
	sam local start-api --env-vars env.json

deploy:
	make build
	sam package --template-file template.yaml --output-template-file output.yaml
	sam deploy --template-file output.yaml