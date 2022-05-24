CMAKE_ARTIFACT = cmake.linux.x86_64.tar.bz2
CROSS_TOOLCHAIN_ARTIFACT = arm-zephyr-eabi.linux.x86_64.tar.bz2
HOSTTOOLS_ARTIFACT = zephyr-sdk-x86_64-hosttools*.sh

.phony: all build copy_artifacts pack

all: pack

build:
	git submodule update --init --force --depth=1 --recursive
	patch -N -p 1 < hosttools.patch
	./go.sh arm-zephyr-eabi
	./go.sh tools
	./go.sh cmake

copy_artifacts: build
	mkdir -p ./scripts/toolchains
	cp $(CMAKE_ARTIFACT) ./scripts/toolchains
	cp $(CROSS_TOOLCHAIN_ARTIFACT) ./scripts/toolchains
	cp $(HOSTTOOLS_ARTIFACT) ./scripts/toolchains

pack: copy_artifacts
	cd ./scripts && ./make_zephyr_sdk.sh linux x86_64
	@echo "<<< Finished OK >>>"

clean:
	rm -fr build
	rm -fr crosstool-ng
	rm -fr bin
