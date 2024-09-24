#!/usr/bin/env bash

# check if a version override was passed in via env
if [ -n "$LIMINE_VERSION" ]; then
	tarball_url=$(curl -sL "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" "https://api.github.com/repos/limine-bootloader/limine/releases/$tarball_url" | jq -r '.tarball_url')
else
	tarball_url=$(curl -sL "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" "https://api.github.com/repos/limine-bootloader/limine/releases/latest" | jq -r '.tarball_url')
fi

echo "Using tarball: $tarball_url"
# download the tarball

curl -SL -o limine.tar.gz "$tarball_url" || exit 255
# decompress the tarball
mkdir sources
tar -xzf limine.tar.gz -C sources --strip-components 1

(
	cd sources || exit 255

	# Generate the configure script
	./bootstrap || exit 255
	mkdir build
	cd build || exit 255
	../configure --enable-uefi-x86-64 --enable-uefi-aarch64 || exit 254
	make -j "$(nproc)"
	# Copy the built files to /out directory
	tar -cvzf /out/limine.tar.gz .
	chmod 777 /out/limine.tar.gz
)
