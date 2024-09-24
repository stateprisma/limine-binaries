build:
	podman build . -t ghcr.io/stateprisma/limine-builder:latest

push:
	podman push ghcr.io/stateprisma/limine-builder:latest

run:
	podman run --rm -it -v ./out:/out ghcr.io/stateprisma/limine-builder:latest
