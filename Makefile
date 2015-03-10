DNRD_VERSION=2.20.3

all: dnrd
	docker build -t dnrd .

build:
	mkdir -p build

dnrd: build/dnrd-$(DNRD_VERSION).tar.gz
	tar xzf build/dnrd-$(DNRD_VERSION).tar.gz -C build
	docker run -ti --rm \
		-v `pwd`/build/:/build/ \
		-w /build/dnrd-$(DNRD_VERSION) \
		--user `id -u` \
		gcc:4.9 /bin/bash -c './configure CFLAGS="-static" && make'
	cp build/dnrd-$(DNRD_VERSION)/src/dnrd ./dnrd

build/dnrd-$(DNRD_VERSION).tar.gz:
	wget -P build http://downloads.sourceforge.net/project/dnrd/dnrd/$(DNRD_VERSION)/dnrd-$(DNRD_VERSION).tar.gz

clean:
	rm -rf build

clean-all: clean
	rm -f dnrd
