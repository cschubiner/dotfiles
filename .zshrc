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

# Customize to your needs...

bindkey '^r' history-incremental-search-backward

export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:~/bin

mkdir -p ~/zsh_plugins
touch ~/zsh_plugins/.empty
rm -f ~/zsh_plugins/.DS_Store
for f in ~/zsh_plugins/*; do
  source $f;
done
for f in ~/zsh_plugins/.*; do
  source $f;
done

