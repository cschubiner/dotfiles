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

bindkey '^r' history-incremental-search-backward

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
for f in ~/zsh_plugins/*; do
  source $f;
done
for f in ~/zsh_plugins/.*; do
  source $f;
done

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

