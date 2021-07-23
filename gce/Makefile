.PHONY: create-instance
create-instance:
	$(eval IMAGE_NAME := $(shell read -p "image name? " name && echo $$name))
	./create-instance $(IMAGE_NAME)

.PHONY:
image:
	$(eval SUFFIX := $(shell date "+%Y-%m-%d--%H-%M-%S"))
	@echo SUFFIX=$(SUFFIX)
	packer build --var image-suffix=$(SUFFIX) .
