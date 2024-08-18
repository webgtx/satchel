FROM registry.fedoraproject.org/fedora-toolbox:40
LABEL com.github.containers.toolbox="true"
COPY ./tmux.conf .tmux.conf
COPY ./kubernetes.repo /etc/yum.repos.d/
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
COPY ./zshrc .zshrc
LABEL org.opencontainers.image.source=https://github.com/webgtx/satchel
ENTRYPOINT ["/bin/zsh"]
