
# MultiPackaging on Linux

## Motivation

There are (too)many ways for creating [packages for Linux](Doc/packaging.md) and
 this repository is meant to help solving this problem, and at the same time
 not having the headache of the people who tackle it.

Just as easy as running `docker-compose up` and packages will be ready.
```
..., :message=>"Created", :path=>"/out/hello-world-0.1.0-1-any_Fedora_39.rpm"}
..., :message=>"Created", :path=>"/out/hello-world-0.1.0-1-any_Debian_12.deb"}
..., :message=>"Created", :path=>"/out/hello-world-0.1.0-1-any_Ubuntu_22.04.deb"}
..., :message=>"Created", :path=>"/out/hello-world-0.1.0-1-any_Arch_rolling.pkg.tar.zst"}
```

## Start

Structure of folder and contents description.
```sh
build                           # where native source code is build
docker                          # Container definitions for package at distro
docker/debian_12/               # Container folder for debian_12 example
docker/debian_12/Dockerfile     # Separated container definition for debian_12
docker/entry.bash               # Script for creating package in every container
docker-compose.yml              # Glued containters together
generate-src-contents.sh        # Creates src contents for simple demo1
package                         # Fragments and common configs for packages
produced                        # Packages goes here
*.md                            # Documentation
src                             # Where source code should be created or cloned
```

You can at least edit [docker-compose.yml](docker-compose.yml) and add/remove
containers. As many different containers, as many packages will be produced.
There are few examples strategies for configuration described here and
 configured as template in [docker/entry.bash](docker/entry.bash)

### Example 1

Preparation:

```sh
git clone https://github.com/tpanj/multipackaging 
cd multipackaging
mkdir src
cd src
bash ../generate-src-contents.sh
cd ..
docker-compose up
```

### Example 2

Preparation:

Use source code from Example 1 and just edit [docker/entry.bash](docker/entry.bash)
 to enable only Example 2 before running `docker-compose up`.

### Example 3

Preparation:

```sh
git clone https://github.com/tpanj/multipackaging 
cd multipackaging
git clone https://github.com/tpanj/multipackaging-src.git src # define source code that we will build and pack
# edit docker/entry.bash to enable only Example 3
docker-compose up
```

## Cleaning

Command `docker-compose down` will clean up working containers but not generated packets.


# Thanks

This repository will not exist without software:

* https://github.com/jordansissel/fpm - Build packages for platforms (deb, rpm, etc) with great ease
* https://docker.com - containers sw and registry
* https://github.com/tpanj/bash4all - normalized scripts aliases to work across distros

This document is work in progress. You can clone this repository, apply changes and create merge request.
