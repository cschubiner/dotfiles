#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#---- vim mode start
bindkey -v
function zle-line-init zle-keymap-select {
	    VIM_PROMPT="%{$fg_bold[yellow]%} [% VIM]%  %{$reset_color%}"
				    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
						    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
# ---- vim mode end

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/bin

mkdir -p ~/zsh_plugins
touch ~/zsh_plugins/.empty
rm -f ~/zsh_plugins/.DS_Store
for f in ~/zsh_plugins/*.sh; do
  source $f;
done


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
