# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh/
export PATH=$HOME/.local/bin:$PATH
# Add .NET Core SDK tools
export DOTNET_ROOT=/usr/share/dotnet/
export PATH=$PATH:$DOTNET_ROOT
export PATH="$PATH:/home/maksym/.dotnet/tools"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="archcraft"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
# zsh parameter completion for the dotnet CLI

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=/usr/share/zsh/

# Generate and export LS_COLORS for colored output
eval "$(dircolors -b)"

zstyle ':completion:*' rehash true

## Options
setopt correct # Auto correct mistakes 
setopt extendedglob # Extended globbing. Allows using regular expressions with * 
setopt nocaseglob # Case insensitive globbing 
setopt rcexpandparam # Array expension with parameters 
setopt nocheckjobs # Don't warn about running processes when exiting 
setopt numericglobsort # Sort filenames numerically when it makes sense 
setopt nobeep # No beep setopt appendhistory # Immediately append history instead of overwriting 
setopt histignorealldups # If a new command is a duplicate, remove the older one 
setopt autocd # if only directory path is entered, cd there. 
setopt auto_pushd 
setopt pushd_ignore_dups 
setopt pushdminus
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git fast-syntax-highlighting zsh-autosuggestions sudo)

ZVM_SYSTEM_CLIPBOARD_ENABLED=true
source $ZSH/oh-my-zsh.sh

# Source custom completion configuration
source ~/.config/zsh/completion.zsh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Variables overrides
export BROWSER="/usr/bin/zen-browser"

# Cache dotnet completions for faster startup
if [[ ! -f ~/.cache/dotnet_completion.zsh ]] || [[ ~/.zshrc -nt ~/.cache/dotnet_completion.zsh ]]; then
  mkdir -p ~/.cache
  dotnet completions script zsh > ~/.cache/dotnet_completion.zsh
fi
source ~/.cache/dotnet_completion.zsh

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

eval "$(oh-my-posh init zsh --config ~/catppuccin.omp.json)"
add-zsh-hook -Uz precmd rehash_precmd

alias discord='MOZ_ENABLE_WAYLAND=1 discord'

# omz
alias zshconfig="geany ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"

# ls
#alias l='ls -lh'
#alias ll='ls -lah'
#alias la='ls -A'
#alias lm='ls -m'
#alias lr='ls -R'
#alias lg='ls -l --group-directories-first'
alias la='eza -a --group-directories-first --icons'
lt() {
  local depth=${1:-3}
  eza -aTL "$depth" --group-directories-first --icons --ignore-glob '.git'
}
alias l.='eza -ald --group-directories-first --icons .*'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'

# cli
alias conf='cd ~/.config'
alias big='expac -H M "%m\t%n" | sort -h | nl'
alias tasks='task ls project:'

# Scripts
alias dev='~/scripts/tmux_dev.sh'
alias vpn='~/scripts/wireguard_connection.sh'

# Get free space instantly
space() {
  df -h --output=source,size,used,avail / | tail -n1 | awk '{printf "Free: %s Total: %s Used: %s Drive: %s\n",$4,$2,$3,$1}'
}
neofetch

# Lazy load nvm for faster startup
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}
