# ohmyzsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"
plugins=(git)

# brew
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
rm -f ~/.zcompdump; compinit
chmod -R go-w "$(brew --prefix)/share"
source $ZSH/oh-my-zsh.sh

# spaceship zsh theme
SPACESHIP_DIR_TRUNC=0
SPACESHIP_TIME_SHOW=true
SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW="always"

# pywal
export PATH="${PATH}:$HOME/Library/Python/3.9/bin:$HOME/.config/scripts"
(cat ~/.cache/wal/sequences &)
$HOME/.config/scripts/alacritty-color-export > /dev/null 2>&1
pywalfox update

# kubectl
SPACESHIP_KUBECTL_SHOW=true
source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl k

# helm
source <(helm completion zsh)

# fluxcd
source <(flux completion zsh)
complete -C $(which flux) flux-old

# kubeswitch
INSTALLATION_PATH=$(brew --prefix switch) && source $INSTALLATION_PATH/switch.sh

# Vault
export VAULT_ADDR=https://vault.bealv.lan

# Terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# terragrunt
complete -C $(which terraform) terragrunt
