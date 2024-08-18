FROM fedora:rawhide 
ARG NAME=satchel
ARG VERSION=1
LABEL com.github.containers.toolbox="true" \
      name="$NAME" \
      version="$VERSION"
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
COPY ./tmux.conf .tmux.conf
COPY ./kubernetes.repo /etc/yum.repos.d/
COPY ./zshrc .zshrc
LABEL org.opencontainers.image.source=https://github.com/webgtx/satchel
