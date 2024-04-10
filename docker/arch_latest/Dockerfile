FROM archlinux:latest

RUN pacman -Syu --noconfirm lsb-release git base-devel cmake ruby
RUN gem install fpm
RUN echo 'export PATH=/root/.local/share/gem/ruby/3.0.0/bin:$PATH' > ~/.bashrc

RUN echo 'shopt -s expand_aliases' >> ~/.bashrc
# bash4all
ENV NON_INTERACTIVE=Y
RUN bash -c "$(curl -fsSL git.io/bash4all)"

# not to exit too early in not interacitve shell - define aliases
