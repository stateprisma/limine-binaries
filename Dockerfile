FROM docker.io/library/ubuntu:noble

LABEL maintainer="Matheus Xavier <soft.song@fastmail.net"

RUN apt-get update && apt-get upgrade -yy

RUN apt-get install -yy \
	coreutils \
	make \
	sed \
	grep \
	gzip \
	nasm \
	mtools \
	gcc \
	gcc-aarch64-linux-gnu \
	curl \
	tar \
	git \
	jq \
	automake

RUN mkdir limine-build
COPY build.sh /limine-build

VOLUME [ "/out" ]

CMD [ "/limine-build/build.sh" ]
