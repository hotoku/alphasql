.PHONY: create-instance
create-instance:
	$(eval IMAGE_NAME := $(shell read -p "image name? " name && echo $$name))
	./create-instance $(IMAGE_NAME)

.PHONY:
image:
	@if [[ $$(git st -s | wc -l) -ge 1 ]]; then echo "Error: local tree is dirty."; false; fi
	$(eval SUFFIX := $(shell git rev-parse HEAD))
	@echo SUFFIX=$(SUFFIX)
	@echo packer build --var image-suffix=$(SUFFIX) .
