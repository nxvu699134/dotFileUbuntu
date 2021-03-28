# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${xdg_cache_home:-$home/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${xdg_cache_home:-$home/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH=$PATH:/usr/local/go/bin
# export GOPATH=$HOME/Workspace/Golang
#
#
export TERM="xterm-256color"
# export TERM="screen-256color"
# export TERM="tmux-256color"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# =========================== POWERLEVEL 9K CONFIG====================================
ZSH_THEME="powerlevel10k/powerlevel10k"
# POWERLEVEL9K_MODE='nerdfont-complete'
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon prompt_char root_indicator dir_writable dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
#
# POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
# POWERLEVEL9K_ALWAYS_SHOW_USER=false
# POWERLEVEL9K_CONTEXT_TEMPLATE="\uF109 %m "
#
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{cyan}\u256D\u2500%f"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{cyan}\u2570❱%F{073}❱%F{109}❱%f "
#
# POWERLEVEL9K_HOME_SUB_ICON="$(print $'\uF015')"
# # POWERLEVEL9K_DIR_PATH_SEPARATOR=" $(print $'⟫') "
# POWERLEVEL9K_DIR_PATH_SEPARATOR=" $(print $'') "
# POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true
#
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
#
# zsh tmux settings
ZSH_TMUX_AUTOSTART='true'

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  pip
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  vi-mode
  # zsh-vi-mode
  tmux
  git
)

autoload -U compinit && compinit

# Use this flag for surroot alias
ZSH_DISABLE_COMPFIX=true

# 10ms for key sequences
KEYTIMEOUT=1

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
#   ZSH_THEME="robbyrussell"
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias vim="nvim"
export EDITOR='nvim'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOPATH=/home/joey/.go-bin/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

 export BAT_THEME="OneHalfDark"

alias svpndev='sudo openvpn --config ~/Workspace/vunx_dev.ovpn'
alias svpn='sudo openvpn --config ~/Workspace/vnx.ovpn'


alias suroot='sudo -E -s'
alias lgit='lazygit'
alias pps='cd ~/Workspace/gdt/pps-frontend'
alias m='cd ~/Workspace/miniprojs/stocks/frontend-core'
alias s='bash ~/.config/nvim/bundle/fzf/bin/fzf-tmux'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
