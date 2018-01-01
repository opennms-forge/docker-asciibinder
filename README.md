# AsciiBinder

Container based service to build and compile documentation using the [AsciiBinder](http://www.asciibinder.org) framework.

# Usage

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
