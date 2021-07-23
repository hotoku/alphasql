.PHONY:
create-instance:
	./create-instance $(IMAGE_NAME)

.PHONY:
image:
	packer build --var image-suffix=$$(date "+%Y-%m-%d-%H-%M-%S") .
