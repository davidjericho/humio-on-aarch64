all:
	docker build -t humio:arm64 .

# Nasty workaround for the need for root inside rootless containers
nerdctl:
	sudo nerdctl build -t humio:arm64 .

.PHONY: clean

clean:
	docker rmi -f humio/humio:latest humio:arm64
