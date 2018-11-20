# export PATH=$PATH:~/bin:~/Dropbox/googleSearchScraper/bin
# export PATH=$PATH:/usr/local/Cellar/mysql/5.7.19/bin
export PATH=$PATH:/opt/local/bin
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

export GOPATH=$HOME/work
export PATH=$PATH:/usr/local/opt/go/libexec/bin

#export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh

# https://cloud.google.com/ml-engine/docs/tensorflow/getting-started-training-prediction
export GOOGLE_APPLICATION_CREDENTIALS="~/Dropbox/Other/stock-ml-99794e6060b6.json"

export EDITOR='subl'

alias conda='~/anaconda3/bin/conda'
# export PATH="~/anaconda3/bin:$PATH"

# Creates all those go errors (or actually it's the git "hub" command)
source ~/.airlab/shellhelper.sh

# dora/bankai test-1:
# export DORA_TEST='i-024e7149d2522e8dd'
# export BANKAI_TEST='i-021708d27b9d75ded'
# dora/bankai test-2:
# export DORA_TEST='i-032a3ed53bcb4ba5f'
# export BANKAI_TEST='i-041a440fa23bc1707'
# dora/bankai test-3:
# export DORA_TEST='i-08f4786dec4ae8da7'
# export BANKAI_TEST='i-0e82824244c3c6342'
# dora/bankai test-4:
# export DORA_TEST='i-0b4ff6ae0f938bd7d'
# export BANKAI_TEST='i-076bef480b0a127af'
# dora/bankai test-5:
# export DORA_TEST='i-02f82be345eb00ceb'
# export BANKAI_TEST='i-05a00a7832c7211a3'
# dora/bankai test-6:
# export DORA_TEST='i-0525ce360504ab316'
# export BANKAI_TEST='i-084047c8e8f5c0afd'
# dora/bankai test-7:
# export DORA_TEST='i-058ec4228f9f980d5'
# export BANKAI_TEST='i-0af8f589c0193ebee'
# export DORA_TEST='i-0525ce360504ab316'
# export BANKAI_TEST='i-0a1983698beae94ca'
#dora/bankai test-7:
# export DORA_TEST='i-058ec4228f9f980d5'
#export BANKAI_TEST='i-0af8f589c0193ebee'
# dora/bankai test-8:
 export DORA_TEST='i-0306af9609f92bd5e'
 export BANKAI_TEST='i-0c932320a5a9852d9'
# dora/bankai test-9:
# export DORA_TEST='i-0c1a8a999c7319457'
# export BANKAI_TEST='i-0698534ef5e2bba63'
# dora/bankai test-10:
# export DORA_TEST='i-074b588d7fa7ee996'
# export BANKAI_TEST='i-056428779666f8edf'

#export SATURN5='i-0854a0addee201f61.inst.aws.us-east-1.prod.musta.ch'
# export SATURN5='i-0e29373d3279ad9ef.inst.aws.us-east-1.prod.musta.ch'
# export SATURN5='i-0909807147c572b6d.inst.aws.us-east-1.prod.musta.ch'
# export SATURN5='i-09ec2e9c0c4112c40.inst.aws.us-east-1.prod.musta.ch'
# export SATURN5='i-0e07860e5273c857a.inst.aws.us-east-1.prod.musta.ch'
# export SATURN5='i-05acd495851a0e41e.inst.aws.us-east-1.prod.musta.ch'
# export SATURN5='i-00da6cf10f9214dba.inst.aws.us-east-1.prod.musta.ch'
# export SATURN5='i-0dc22790947f0581f.inst.aws.us-east-1.prod.musta.ch'
# export SATURN5='i-0f23047e093e71ff8.inst.aws.us-east-1.prod.musta.ch'

export DATA_DIR=~/airlab/repos/data #PATH WHERE YOU CLONED THE DATA REPO
export AFDEV_HOST="i-0e275f14954a6a75e.inst.aws.airbnb.com"
export AFDEV_PORT=49826

export TEST_INST=1

export SATURN5='i-0fd89f9d3527705ec.inst.aws.us-east-1.prod.musta.ch'

case $(hostname -s | cat) in
  clay-schubiners-iMac)
    echo On Clay\'s 5k iMac...
    export SATURN5='i-0fd89f9d3527705ec.inst.aws.us-east-1.prod.musta.ch'
  ;;
  clay-schubiner-2)
    echo On Clay\'s 15in. laptop...
    export SATURN5='i-0936a2d23f3fb2a01.inst.aws.us-east-1.prod.musta.ch'
  ;;
  *)
    echo ERROR - Don\'t know which cons!
  ;;
esac

# SCMPUFF STUFF
export SCMPUFF_GIT_CMD='/usr/local/bin/git'
eval "$(scmpuff init -s)"
git () {
  case $1 in
    (commit | blame | log | rebase | merge | diff) eval "$(scmpuff expand -- "$SCMPUFF_GIT_CMD" "$@")" ;;
    (checkout | rm | reset) eval "$(scmpuff expand --relative -- "$SCMPUFF_GIT_CMD" "$@")" ;;
    (add) eval "$(scmpuff expand -- "$SCMPUFF_GIT_CMD" "$@")"
      scmpuff_status ;;
    (*) "$SCMPUFF_GIT_CMD" "$@" ;;
  esac
}
export SCMPUFF_GIT_CMD='/usr/local/bin/git'

alias gs="git stash"
alias gsa="git stash apply"
alias gst="scmpuff status"

alias gradle="$HOME/airlab/repos/treehouse/gradlew"  # or your customized path alias gradlew="$HOME/airlab/repos/treehouse/gradlew"

alias szsh="source ~/zsh_plugins/clay.sh"
alias sublzsh="subl ~/zsh_plugins/clay.sh"

alias python2="python"

alias gogr="echo GRADLE_OPTS=\"-Xmx256m\" gradle -q run && GRADLE_OPTS=\"-Xmx256m\" gradle -q run"
alias gr="echo gradle -q run && gradle -q run"

alias gl="git log --pretty=format:'%Cred[%h]%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset' --date=short"

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

gitrepo() {
  git remote -v | egrep "^origin.+\(push\)$" | cut -f 2 | cut -d ":" -f 2 | cut -d "." -f 1
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

alias gd='git diff'
alias glf='git cherry -v master'
alias ga='git add '
alias gp='airlab rekey && git push'
alias gpf='airlab rekey && git push -f'
alias gpl='airlab rekey && git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias gplr='airlab rekey && git pull --rebase'
alias gm='git commit'
alias gss='git stash show -p'
alias gps="git rev-parse --abbrev-ref HEAD | awk '{print \"git push origin \"$1\":\"$1}' | sh"
alias gpsf="git rev-parse --abbrev-ref HEAD | awk '{print \"git push origin \"$1\":\"$1\" -f\"}' | sh"


alias gsm="git status -s | egrep '((UU)|([M|A][M|A])|( [M|A])|([M|A] ))|(\s?[M|A|U])\s?' | cut  -c 4-"
alias gam="gsm | xargs -n1 git add"
alias gma="gam && git commit --amend --no-edit"
alias glint="gsm | grep .js | xargs -n1 node_modules/.bin/eslint"

alias tm="gsm | xargs -n1 touch"
alias gcm="git checkout master"

alias grm="airlab rekey && git fetch origin master && git rebase origin/master"
alias c="clay"
alias gcl="git checkout -"
alias grc="git rebase --continue && git status"

alias vh="air && vagrant halt"
alias grv="~/git-reviewers/git-reviewers"

alias grhom="airlab rekey && git reset --hard origin/master"

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
. /Users/clay_schubiner/anaconda3/etc/profile.d/conda.sh
