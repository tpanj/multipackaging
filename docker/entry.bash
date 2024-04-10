#!/bin/bash
#file: entry.bash
shopt -s expand_aliases
source ~/.bashrc

# example 1
# Example extended from fpm package documentation.
# Demonstration includes:
# - one long arguments list for fpm with little changes for packaging system with help of variables
# - in fpm-env.sh are specifics (${PKG}, ${EXT} or ${DEPENDS})
# - use this example when packaging simple scripts, datafiles
#
# . /package/${BASED,,}/fpm-env.sh # get package type environment variables

fpm \
  -s dir -t ${PKG} \
  -p /out/hello-world-0.1.0-1.$(lsb_release -si)_$(lsb_release -sr).noarch.${EXT} \
  --name hello-world \
  --license agpl3 \
  --version 0.1.0 \
  --architecture all \
  --depends bash ${DEPENDS} \
  --description "Say hi!" \
  --url "https://example.com/hello-world" \
  --maintainer "You The Amazing Person <you are an amazing person at example dot com>" \
  /src/hello-world=/usr/bin/hello-world /src/hello-world.1=/usr/share/man/man1/hello-world.1


# example 2
# Example extended from fpm package documentation.
# Demonstration includes:
# - one long arguments list for fpm with little changes for packaging system with help of variables
# - in common.sh defined hooks for all package types ${HOOKS}
# - in fpm-env.sh are specifics (${PKG}, ${EXT} or ${DEPENDS})
# - use this example when packaging simple scripts, datafiles
#

# . /package/common.sh
# . /package/${BASED,,}/fpm-env.sh # get package type environment variables, overwrite common
#
# fpm \
#   -s dir -t ${PKG} \
#   -p /out/hello-world-0.1.0-2.$(lsb_release -si)_$(lsb_release -sr).noarch.${EXT} \
#   --name hello-world \
#   --license agpl3 \
#   --version 0.1.0 \
#   ${HOOKS} \
#   --architecture all \
#   --depends bash ${DEPENDS} \
#   --description "Say hi!" \
#   --url "https://example.com/hello-world" \
#   --maintainer "You The Amazing Person <you are an amazing person at example dot com>" \
#   /src/hello-world=/usr/bin/hello-world /src/hello-world.1=/usr/share/man/man1/hello-world.1


# example 3
# Example to use fpm to package native package.
# Demonstration includes:
# - one long arguments list for fpm with little changes for packaging system with help of variables
# - in fpm-env.sh are specifics (${PKG}, ${EXT})
# - no architecture definition - use container's architecture
# - make package only if successfully built and tested
# - use this example when packaging native compiled app along with datafiles

# . /package/${BASED,,}/fpm-env.sh # get package type environment variables

# mkdir /build
# cd /build
# cmake ../src &&
# make &&
# ctest &&
# fpm \
#   -s dir -t ${PKG} \
#   -p /out/math_calc-0.1.0-1.$(lsb_release -si)_$(lsb_release -sr).x86_64.${EXT} \
#   --name math_calc \
#   --license agpl3 \
#   --version 0.1.0 \
#   --description "Say hi!" \
#   --url "https://example.com/hello-world" \
#   --maintainer "You The Amazing Person <you are an amazing person at example dot com>" \
#   /build/math_calc=/usr/bin/math_calc
