FROM fedora:40
WORKDIR /root
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
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY ./zshrc .zshrc
LABEL org.opencontainers.image.source=https://github.com/webgtx/satchel
ENTRYPOINT ["/bin/zsh"]
