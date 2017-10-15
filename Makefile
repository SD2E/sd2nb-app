VERSION=$(shell cat VERSION)

.PHONY: all
all: 
	echo "Making sd2nb v$(VERSION)"
	mkdir -p bin
	cp src/sd2nb bin/
	cp src/bashids bin/
	chmod a+x bin/*

.PHONY: clean
clean:
	rm -rf bin

.PHONY: install
install:
	install bin/sd2nb /usr/local/bin && \
	install bin/bashids /usr/local/bin
