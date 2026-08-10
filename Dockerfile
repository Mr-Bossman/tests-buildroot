FROM debian:13

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates patch git \
	make binutils gcc file wget cpio unzip rsync bc bzip2 && \
	rm -rf /var/lib/apt/lists/* && \
	apt-get clean

ARG BRANCH="master"
RUN git clone --recurse-submodules --single-branch --depth 1 -b ${BRANCH} \
	https://github.com/Mr-Bossman/tests-buildroot

WORKDIR tests-buildroot

ARG THREADS=1
ARG DEFCONFIG="qemu_riscv64_virt_selftests_defconfig"
RUN make -C buildroot BR2_EXTERNAL=$PWD/ ${DEFCONFIG} && \
	make -C buildroot -j${THREADS}

