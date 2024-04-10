FROM fedora:latest

RUN dnf install -y lsb-release make automake gcc gcc-c++ ninja-build cmake git rpm-build ruby
RUN gem install fpm

# RUN apt-get update \
#     && apt-get install -y lsb-release dpkg-dev debhelper build-essential cmake git

#  on line 2 perform substitute
RUN sed -i '2s/.*/shopt -s expand_aliases/' /root/.bashrc

ENV NON_INTERACTIVE=Y
RUN bash -c "$(curl -fsSL git.io/bash4all)"

# not to exit too early in not interacitve shell - define aliases
# RUN sed -i 's/\[ -z "$PS1" \] && return/shopt -s expand_aliases/' /root/.bashrc
