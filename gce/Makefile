.PHONY: create-instance
create-instance:
	./create-instance $(IMAGE_NAME)

.PHONY:
image:
	$(eval SUFFIX := $(shell date "+%Y-%m-%d--%H-%M-%S"))
	@echo SUFFIX=$(SUFFIX)
	packer build --var image-suffix=$(SUFFIX) .
