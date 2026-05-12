FROM quay.io/fedora/fedora-toolbox:44
LABEL com.github.containers.toolbox="true"
COPY *.repo /etc/yum.repos.d/
RUN dnf install -y \
  # Terminal Core Tools
  vim \
  tmux \
  zsh \
  ranger \
  bat \
  fzf \

  # Version Control
  gh \
  glab \
  # Cloud
  doctl \
  azure-cli \

  # Infrastructure & Automation
  helm \
  kubectl \
  ansible \
  terraform \
  opentofu \
  make \

  # Promgramming
  python3-pip \
  clang \
  rust \
  nodejs \
  golang \
  gopls \

  # Networking & Utilities
  wget \
  netcat
  
LABEL org.opencontainers.image.source=https://github.com/webgtx/satchel
