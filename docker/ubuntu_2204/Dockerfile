FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y lsb-release dpkg-dev debhelper build-essential cmake git ruby
RUN gem install fpm

# bash4all
RUN apt-get install -y sudo
ENV NON_INTERACTIVE=Y
RUN bash -c "$(curl -fsSL git.io/bash4all)"

# not to exit too early in not interacitve shell - define aliases
RUN sed -i 's/\[ -z "$PS1" \] && return/shopt -s expand_aliases/' /root/.bashrc
