FROM quay.io/fedora/fedora-toolbox:41
LABEL com.github.containers.toolbox="true"
WORKDIR /root
RUN dnf install -y \
  vim \
  tmux \
  zsh \
  kubectl \
  helm \
  ranger \
  bat \
  gh \
  glab \
  wget \ 
  netcat \
  fzf \
  python3-pip \
  ansible \
  make
ENV SHELL="/usr/bin/zsh"
LABEL org.opencontainers.image.source=https://github.com/webgtx/satchel
