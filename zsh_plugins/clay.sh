export TEST_INST=$(cat ~/zsh_plugins/test_instance.txt)

export PATH="$HOME/.serverless/bin:$PATH"
export PATH="$HOME/.serverless/bin:$PATH"

# export PATH=$PATH:~/bin:~/Dropbox/googleSearchScraper/bin
# export PATH=$PATH:/usr/local/Cellar/mysql/5.7.19/bin
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:/usr/local/opt/python@3.8/bin
export PATH=$PATH:/usr/local/opt/postgresql@12/bin
# export JAVA_HOME=$(/usr/libexec/java_home)
# export PATH=$JAVA_HOME/bin:$PATH

export GOPATH=$HOME/work
export PATH=$PATH:/usr/local/opt/go/libexec/bin

#export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh

# https://cloud.google.com/ml-engine/docs/tensorflow/getting-started-training-prediction
export GOOGLE_APPLICATION_CREDENTIALS="~/Dropbox/Other/stock-ml-99794e6060b6.json"

export GIT_EDITOR=vim
export EDITOR='subl'

export WORKON_HOME=~/Envs
# source ~/.pyenv/versions/3.6.8/bin/virtualenvwrapper.sh

# alias conda='~/anaconda3/bin/conda'
# export PATH="~/anaconda3/bin:$PATH"

# case $(hostname -s | cat) in
#   clayschinersmbp)
#     echo On Clay\'s usb-C laptop...
#   ;;
#   clay-schubiners-MacBook-Pro)
#     echo On Clay\'s usb-C laptop...
#   ;;
#   Clays-MBP)
#     echo On Clay\'s usb-C laptop...
#   ;;
#   Claytons-MacBook-Pro)
#     echo On Clay\'s usb-C laptop...
#   ;;
#   *)
#     echo ERROR - Don\'t know which cons! You are on this cons:
#     hostname -s | cat
#   ;;
# esac

function killport() { lsof -i TCP:$1 | grep LISTEN | awk '{print $2}' | xargs kill -9 }

# SCMPUFF STUFF
# export SCMPUFF_GIT_CMD='/usr/local/bin/git'
# eval "$(scmpuff init -s)"
# git () {
#   case $1 in
#     (commit | blame | log | rebase | merge | diff) eval "$(scmpuff expand -- "$SCMPUFF_GIT_CMD" "$@")" ;;
#     (checkout | rm | reset) eval "$(scmpuff expand --relative -- "$SCMPUFF_GIT_CMD" "$@")" ;;
#     (add) eval "$(scmpuff expand -- "$SCMPUFF_GIT_CMD" "$@")"
#       scmpuff_status ;;
#     (*) "$SCMPUFF_GIT_CMD" "$@" ;;
#   esac
# }
# export SCMPUFF_GIT_CMD='/usr/local/bin/git'
# alias gst="scmpuff status"
alias gst="git status"

alias gs="git stash"
alias gsa="git stash apply"

alias szsh="source ~/zsh_plugins/clay.sh"
alias sublzsh="subl ~/zsh_plugins/clay.sh"

alias python2="python"

alias gogr="echo GRADLE_OPTS=\"-Xmx256m\" gradle -q run && GRADLE_OPTS=\"-Xmx256m\" gradle -q run"
alias gr="echo gradle -q run && gradle -q run"

# alias gl="git log --pretty=format:'%Cred[%h]%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset' --date=short"
# alias gl="git log --oneline"
alias gl="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(yellow)%h%C(reset) %C(bold blue)(%ar)%C(reset)%C(bold red)%d%C(reset) %C(white)%s%C(reset) %C(green)[%an]%C(reset)' --all"
alias gitpruneoldbranches="git remote prune origin && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -D"


alias fsn="python3 ~/find_strings_not_by_string/find_strings.py"
alias fna="python3 ~/find_strings_not_by_string/find_strings.py"

mergeBaseMaster() {
  echo "The commit before your branch started was: $(git merge-base HEAD origin/master)"
}

# Revert last commit
grl() {
  git revert $(git show head~0 --pretty=format:"%H" --no-patch)
}

grf() {
  git checkout $(git merge-base HEAD origin/master) $1
   # && git reset HEAD $1
}

gda() {
  git diff $(git merge-base HEAD origin/master)
}

gdf() {
  git diff --name-only $(git merge-base HEAD origin/master) | cat
}

gdfsa() {
  echo "git diff files spotless apply"
  jsExists=false
  gdf | while read line ; do
    echo "Reformatting:" $line
    if [[ $line = *".js"* ]]; then
      jsExists=true
    else
      if [[ $line = *".java"* ]]; then
        echo "google-java-format..."
        java -jar ~/Downloads/google-java-format-1.6-all-deps.jar -r $line
      fi
    fi
  done
  if $jsExists; then
    bash ~/clay_schubiner_dotfiles/jsprettier_js_files.sh
  fi
}

gcob() {
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
  printf "$(git branch | egrep "^\*" | cut -d ' ' -f 2)" | perl -pe 's/\e\[?.*?[\@-~]//g'
}

# gbr() {
#   gitbranch
# }

gitrepo() {
  git remote -v | egrep "^origin.+\(push\)$" | cut -f 2 | cut -d ":" -f 2 | cut -d "." -f 1
}

# opens a link to the git branch in GHE
bo() { # stands for branchopen. also stands for body odor.
  open "http://github.com/$(gitrepo)/compare/$(gitbranch)?expand=1"
}

glzy() {
   git add .
   git commit -a -m “$1”
   git push
}

alias jf='cd ~/jumpstart-frontend'
alias jb='cd ~/jumpstart-backend && source ./venv/bin/activate'

alias cl='cd ~/canal && source ./canal-venv/bin/activate'
alias cf='cd ~/frontend-canal'

alias f8='flake8'

alias gd='git diff'
alias glf='git cherry -v master'
alias ga='git add '
alias gp='git push'
alias gpf='git push -f'
alias gpl='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias gplr='git pull --rebase'
alias gm='git commit'
alias gss='git stash show -p'
alias gst='git status'
alias gps="git rev-parse --abbrev-ref HEAD | awk '{print \"git push origin \"$1\":\"$1}' | sh"
alias gpsf="git rev-parse --abbrev-ref HEAD | awk '{print \"git push origin \"$1\":\"$1\" -f\"}' | sh"


alias gsm="git status -s | egrep '((UU)|([M|A][M|A])|( [M|A])|([M|A] ))|(\s?[M|A|U])\s?' | cut  -c 4-"
alias gam="gsm | xargs -n1 git add"
alias gma="gam && git commit --amend --no-edit"
alias glint="gsm | grep .js | xargs -n1 node_modules/.bin/eslint"

alias tm="gsm | xargs -n1 touch"
alias gcm="git checkout master"
alias gcd="git checkout develop"

alias grm="git fetch origin master && git rebase origin/master"
alias grmi="git fetch origin master && git rebase -i origin/master"
alias grqi="git fetch origin qa && git rebase -i origin/qa"
alias grdi="git fetch origin develop && git rebase -i origin/develop"
alias grd="git fetch origin develop && git rebase origin/develop"
alias grq="git fetch origin qa && git rebase origin/qa"
alias c="~/commit-helper/bin/clay"
alias gcl="git checkout -"
alias grc="git rebase --continue && git status"

alias vh="air && vagrant halt"
alias grv="~/git-reviewers/git-reviewers"

alias grhom="git reset --hard origin/master"
alias gamm="git add . && git commit -m \"more\""

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

eval "$(ssh-agent -s)";
# ssh-add -K ~/.ssh/backend-dev-server.pem
# ssh-add -K ~/.ssh/id_rsa

# ssh-add -K ~/.ssh/clay-webhooks-dev.pem
# ssh-add -K ~/.ssh/aws-chess.pem

# https://github.com/nvbn/thefuck
# eval $(thefuck --alias)


bindkey '^R' history-incremental-pattern-search-backward
bindkey "^P" vi-up-line-or-history
bindkey "^N" vi-down-line-or-history
