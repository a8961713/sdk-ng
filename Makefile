CMAKE_ARTIFACT = cmake.linux.x86_64.tar.bz2
CROSS_TOOLCHAIN_ARTIFACT = *zephyr-*.linux.x86_64.tar.bz2
HOSTTOOLS_ARTIFACT = zephyr-sdk-x86_64-hosttools*.sh

.phony: all build.done copy_artifacts pack

all: pack

build.done: toolchain.built hosttools.built cmake.built
	touch $@


.phony: verify_ubuntu_version
verify_ubuntu_version:
	./verify_ubuntu_version.sh
	
packages_installed: required_packages.txt | verify_ubuntu_version
	sudo apt-get install --no-install-recommends `cat required_packages.txt`
	touch $@

toolchain.built: packages_installed
	git submodule update --init --force --depth=1 --recursive
	./go.sh xtensa-espressif_esp32s3_zephyr-elf arm-zephyr-eabi riscv64-zephyr-elf
	touch $@

hosttools.built: toolchain.built
	./add_safe_directories.sh
	./go.sh tools
	touch $@

cmake.built: hosttools.built
	./go.sh cmake
	touch $@

copy_artifacts: build.done
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
	rm -f build.done
