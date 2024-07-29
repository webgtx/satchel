FROM fedora:40
RUN dnf config-manager --add-repo https://gist.githubusercontent.com/webgtx/c1f68f5a063c3c10e9539b9f4645c890/raw/aa9d68399817a95d4755cfd5e224427028b9d7fe/kubernetes.repo
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
  netcat 
WORKDIR /root
COPY ./tmux.conf .tmux.conf
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY ./zshrc .zshrc
ENTRYPOINT ["/bin/zsh"]
