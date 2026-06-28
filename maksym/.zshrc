# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
fastfetch
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export DOTNET_ROOT=/usr/share/dotnet/
export PATH=$PATH:$DOTNET_ROOT
export PATH="$PATH:/home/maksym/.dotnet/tools:/home/maksym/.cargo/bin"

setopt nobeep # No beep setopt appendhistory # Immediately append history instead of overwriting 
setopt histignorealldups # If a new command is a duplicate, remove the older one 
setopt autocd # if only directory path is entered, cd there. 
alias discord='MOZ_ENABLE_WAYLAND=1 discord'

alias la='eza -a --group-directories-first --icons'
lt() {
  local depth=${1:-3}
  eza -aTL "$depth" --group-directories-first --icons --ignore-glob '.git'
}
alias l.='eza -ald --group-directories-first --icons .*'

alias conf='cd ~/dotfiles'
alias big='expac -H M "%m\t%n" | sort -h | nl'

alias vpn='~/scripts/wireguard_connection.sh'

space() {
  df -h --output=source,size,used,avail / | tail -n1 | awk '{printf "Free: %s Total: %s Used: %s Drive: %s\n",$4,$2,$3,$1}'
}
# Automatically list directory contents on cd
chpwd() {
    la
}
# Lazy load nvm for faster startup
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}