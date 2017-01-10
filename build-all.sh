#!/bin/sh
version=$(/bin/sh -c 'git describe --always --tags')
rm -rf ./dist

env CGO_ENABLED=0 GOOS=linux GOARCH=arm go build -ldflags "-X main.version=$version" -a -installsuffix cgo -o dist/overmind .
gzip -9 -S "-$version-linux-arm.gz" dist/overmind

env CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -ldflags "-X main.version=$version" -a -installsuffix cgo -o dist/overmind .
gzip -9 -S "-$version-linux-arm64.gz" dist/overmind

env CGO_ENABLED=0 GOOS=linux GOARCH=386 go build -ldflags "-X main.version=$version" -a -installsuffix cgo -o dist/overmind .
gzip -9 -S "-$version-linux-386.gz" dist/overmind

env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-X main.version=$version" -a -installsuffix cgo -o dist/overmind .
gzip -9 -S "-$version-linux-amd64.gz" dist/overmind

env CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -ldflags "-X main.version=$version" -a -installsuffix cgo -o dist/overmind .
gzip -9 -S "-$version-macos-amd64.gz" dist/overmind

env CGO_ENABLED=0 GOOS=freebsd GOARCH=arm go build -ldflags "-X main.version=$version" -a -installsuffix cgo -o dist/overmind .
gzip -9 -S "-$version-freebsd-arm.gz" dist/overmind

env CGO_ENABLED=0 GOOS=freebsd GOARCH=386 go build -ldflags "-X main.version=$version" -a -installsuffix cgo -o dist/overmind .
gzip -9 -S "-$version-freebsd-386.gz" dist/overmind

env CGO_ENABLED=0 GOOS=freebsd GOARCH=amd64 go build -ldflags "-X main.version=$version" -a -installsuffix cgo -o dist/overmind .
gzip -9 -S "-$version-freebsd-amd64.gz" dist/overmind
