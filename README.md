## AsciiBinder Version Tags

Container based service to build and compile documentation using the [AsciiBinder](http://www.asciibinder.org) framework.

* `0.1.14`, `latest`
* `0.1.13`

## General Project Information

* CI/CD Status: [![CircleCI](https://circleci.com/gh/opennms-forge/docker-asciibinder.svg?style=svg)](https://circleci.com/gh/opennms-forge/docker-asciibinder)
* Container Image Info: [![](https://images.microbadger.com/badges/version/opennms/asciibinder.svg)](https://microbadger.com/images/opennms/asciibinder "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/opennms/asciibinder.svg)](https://microbadger.com/images/opennms/asciibinder "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/license/opennms/asciibinder.svg)](https://microbadger.com/images/opennms/asciibinder "Get your own license badge on microbadger.com")
* CI/CD System: [CircleCI]
* Docker Container Image Repository: [DockerHub]
* Issue- and Bug-Tracking: [GitHub issue]
* Source code: [GitHub]
* Chat: [IRC]
* Maintainer: ronny@opennms.org

## Usage

Run the asciibinder binary as container executable and show help and usage.

```
docker run --rm -v $(pwd):/docs opennms/asciibinder --help
```

The following commands can be used:

```
Commands:
  build (default action)
    Builds the HTML docs in the indicated repo dir
  create
    Generates a new AsciiBinder repo at the indicated dir
  clone
    Clones an existing AsciiBinder repo to the local filesystem
  watch
    Starts Guard, which automatically regenerates changed HTML
    files on the working branch in the repo dir
  package
    Builds and packages the static HTML for all of the sites
    defined in the _distro_config.yml file
  clean
    Remove _preview, _publish and _package dirs created by
    other AsciiBinder operations.

Options:
  -v, --version    Print version and exit
  -h, --help       Show this message
```

[GitHub]: https://github.com/opennms-forge/docker-asciibinder.git
[DockerHub]: https://hub.docker.com/r/opennms/asciibinder
[GitHub issue]: https://github.com/opennms-forge/docker-asciibinder
[CircleCI]: https://circleci.com/gh/opennms-forge/docker-asciibinder
[IRC]: irc://freenode.org/#asciibinder
