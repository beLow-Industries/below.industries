[![.github/workflows/ci.yml](https://github.com/beLow-Industries/below.industries/actions/workflows/ci.yml/badge.svg)](https://github.com/beLow-Industries/below.industries/actions/workflows/ci.yml)

# [below.industries](https://below.industries)

## Makefile targets

```txt
Usage: make [target]

Targets:
help                 show this message
lint                 lint project
clean                delete any build
build                build project
open                 open project on your browser

Env:
DOCKER = docker
BROWSER = firefox
```

Sample usage

```shell
make clean build open
```