export PATH=$PATH:~/bin:~/Dropbox/googleSearchScraper/bin
export PATH=$PATH:/opt/local/bin

export ROOKERY_CLIENT_TIMEOUT=60

gcob () {
	    git checkout $(git for-each-ref --sort=-committerdate refs/heads/ | awk '{print $3}' | cut -c $(echo " refs/head/" | wc -c)- | fzf-tmux)
}

export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
	    find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
			      sed s/^..//) 2> /dev/null'

export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND='ag -l -g ""'

# gets the current branch name
gitbranch() {
  git branch | egrep "^\*" | cut -d ' ' -f 2
}

gitrepo() {
  git remote -v | egrep "^origin.+\(push\)$" | cut -f 2 | cut -d ":" -f 2 | cut -d "." -f 1
}

# opens a link to the git branch in GHE
bo() { # stands for branchopen. also stands for body odor.
  open "http://git.musta.ch/$(gitrepo)/compare/$(gitbranch)?expand=1"
}

alias air='cd ~/airlab/repos/airbnb'
alias data='cd ~/airlab/repos/data'
alias erf='cd ~/airlab/repos/erf'
alias rookery='cd ~/airlab/repos/rookery'
alias rook='cd ~/airlab/repos/rookery'
alias mario='cd ~/sitar-portal'
alias mochi='cd ~/airlab/repos/mochi'

alias nrc='npm run --silent sanity-check'
alias nrt='npm run --silent sanity-check'

alias lend='cd ~/lending_club'
alias lc='cd ~/lending_club'
alias lc2='cd ~/lending_club_copier'

alias git=hub
alias gd='git diff | diff-so-fancy'
alias glf='git cherry -v master'
alias gp='git push'
alias gpf='git push -f'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gm='git commit'
alias gst='git status'
alias gss='git stash show -p'
alias gps="git rev-parse --abbrev-ref HEAD | awk '{print \"git push origin \"$1\":\"$1}' | sh"
alias gpsf="git rev-parse --abbrev-ref HEAD | awk '{print \"git push origin \"$1\":\"$1\" -f\"}' | sh"

alias gsm="git status -s | egrep '((UU)|([M|A][M|A])|( [M|A])|([M|A] ))|(\s?[M|A|U])\s?' | cut  -c 12-"
alias gam="gsm | xargs -n1 git add"
alias gma="gam && git commit --amend --no-edit"
alias tm="gsm | xargs -n1 touch"
alias gcm="git checkout master"

alias grm="git fetch && git fetch origin && git rebase origin/master"
alias gfrm="git fetch && git fetch origin && git rebase origin/master"
alias c="clay"
alias gcl="git checkout -"

alias vh="air && vagrant halt"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
