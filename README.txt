We added a Makefile that does all we need to build the ARM toolchain with stdc++-nano WITH exceptions:

type: make

result is: ./scripts/zephyr-*.linux-x86_64-setup.run

there are sparate runners for each architecture and one that includes all.

Debugging errors:

Errors in the "Building Zephyr host tools..." stage (bitbake)
-------------------------------------------------------------
To run only this stage, use:
	./go.sh tools

