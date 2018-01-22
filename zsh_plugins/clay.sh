export PATH=$PATH:~/bin:~/Dropbox/googleSearchScraper/bin
export PATH=$PATH:/usr/local/Cellar/mysql/5.7.19/bin
export PATH=$PATH:/opt/local/bin
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH
export GOPATH=$HOME/work

alias gradle="$HOME/airlab/repos/treehouse/gradlew"  # or your customized path alias gradlew="$HOME/airlab/repos/treehouse/gradlew"


alias gogr="echo GRADLE_OPTS=\"-Xmx256m\" gradle -q run && GRADLE_OPTS=\"-Xmx256m\" gradle -q run"
alias gr="echo gradle -q run && gradle -q run"

alias gl="git log" # overrides the colored 'gl' command

alias fsn="python3 ~/find_strings_not_by_string/find_strings.py"
alias fna="python3 ~/find_strings_not_by_string/find_strings.py"

source ~/.airlab/shellhelper.sh

export ROOKERY_CLIENT_TIMEOUT=60

mergeBaseMaster() {
  echo "The commit before your branch started was: $(git merge-base HEAD origin/master)"
}

# Revert last commit
grl() {
  git revert $(git show head~0 --pretty=format:"%H" --no-patch)
}

grf() {
  git checkout $(git merge-base HEAD origin/master) $1
   # && git rese t HEAD $1
}

gda() {
  git diff $(git merge-base HEAD origin/master)
}

# clone of gdf
gmf() {
  git diff --name-only $(git merge-base HEAD origin/master)
}

gdf() {
  git diff --name-only $(git merge-base HEAD origin/master)
}

gcp() {
# cherry pick
  git cherry-pick $1
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

gitrepo() {
  git remote -v | egrep "^origin.+\(push\)$" | cut -f 2 | cut -d ":" -f 2 | cut -d "." -f 1
}

git() {
  if [ $1 = "push" ] ||[ $1 = "pull" ]; then
      airlab rekey;
      command git "$@";
  else
      command git "$@";
  fi
}

# opens a link to the git branch in GHE
bo() { # stands for branchopen. also stands for body odor.
  open "http://git.musta.ch/$(gitrepo)/compare/$(gitbranch)?expand=1"
}

alias a2='cd ~/airbnb2'
alias a='cd ~/airlab/repos/airbnb'
alias air2='cd ~/airbnb2'
alias air='cd ~/airlab/repos/airbnb'
alias data='cd ~/airlab/repos/data'
alias erf='cd ~/airlab/repos/erf'
alias rookery='cd ~/airlab/repos/rookery'
alias rook='cd ~/airlab/repos/rookery'
alias mario='cd ~/sitar-portal'
alias mochi='cd ~/airlab/repos/mochi'
alias dls='cd ~/airlab/repos/dls-web'

alias apr='airlab proj run'
alias apb='airlab proj build'

alias d='cd ~/airlab/repos/treehouse/projects/dora/service'
alias dora='cd ~/airlab/repos/treehouse/projects/dora/service'
alias bank='cd ~/airlab/repos/treehouse/projects/trips/bankai/service'
alias b='cd ~/airlab/repos/treehouse/projects/trips/bankai/service'
alias bankai='cd ~/airlab/repos/treehouse/projects/trips/bankai/service'
alias treehouse='cd ~/airlab/repos/treehouse'
alias t='cd ~/airlab/repos/treehouse'
alias tree='cd ~/airlab/repos/treehouse'
alias deku='cd ~/airlab/repos/treehouse/projects/deku/service'

alias nrc='npm run --silent sanity-check'
alias nrt='npm run --silent sanity-check'

alias lend='cd ~/lending_club'
alias lc='cd ~/lending_club'
alias lc2='cd ~/lending_club_copier'

# alias git=hub
alias gd='git diff | diff-so-fancy | less'
alias glf='git cherry -v master'
alias ga='git add '
alias gp='airlab rekey && git push'
alias gpf='airlab rekey && git push -f'
alias gpl='airlab rekey && git pull'
alias gplr='airlab rekey && git pull --rebase'
alias gm='git commit'
alias gst='git status'
alias gss='git stash show -p'
alias gps="git rev-parse --abbrev-ref HEAD | awk '{print \"git push origin \"$1\":\"$1}' | sh"
alias gpsf="git rev-parse --abbrev-ref HEAD | awk '{print \"git push origin \"$1\":\"$1\" -f\"}' | sh"


alias gsm="git status -s | egrep '((UU)|([M|A][M|A])|( [M|A])|([M|A] ))|(\s?[M|A|U])\s?' | cut  -c 12-"
alias gam="gsm | xargs -n1 git add"
alias gma="gam && git commit --amend --no-edit"
alias glint="gsm | grep .js | xargs -n1 node_modules/.bin/eslint"

alias tm="gsm | xargs -n1 touch"
alias gcm="git checkout master"

alias grm="airlab rekey && git fetch origin master && git rebase origin/master"
alias c="clay"
alias gcl="git checkout -"

alias vh="air && vagrant halt"
alias grv="~/git-reviewers/git-reviewers"

alias grhom="airlab rekey && git reset --hard origin/master"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
