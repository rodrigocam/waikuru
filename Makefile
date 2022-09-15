DOCKER_NAME ?= dinghao188/rcore-tutorial
.PHONY: docker build_docker

qemu:
	qemu-system-riscv64 -machine virt -nographic -bios bootloader/rustsbi-qemu.bin \
	-device loader,file=target/riscv64gc-unknown-none-elf/release/waikuru.bin,addr=0x80200000 \
	-s -S

bin:
	rust-objcopy --strip-all target/riscv64gc-unknown-none-elf/release/waikuru -O binary target/riscv64gc-unknown-none-elf/release/waikuru.bin
