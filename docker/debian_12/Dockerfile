FROM debian:12

RUN apt-get update \
    && apt-get install -y sudo lsb-release dpkg-dev debhelper build-essential cmake git ruby
RUN gem install fpm

# bash4all
#RUN apt-get install -y sudo
ENV NON_INTERACTIVE=Y
RUN bash -c "$(curl -fsSL git.io/bash4all)"

# not to exit too early in not interacitve shell - define aliases
RUN sed -i '2s/.*/shopt -s expand_aliases/' ~/.bashrc
