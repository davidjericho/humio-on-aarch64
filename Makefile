all:
	docker build -t humio:arm64 .

.PHONY: clean

clean:
	docker rmi -f humio/humio:latest humio:arm64
