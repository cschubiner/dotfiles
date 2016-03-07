export PATH=$PATH:~/bin:~/Dropbox/googleSearchScraper/bin
export PATH=$PATH:/opt/local/bin

export SSH_AUTH_SOCK=$TMPDIR/ssh-agent-$USER.sock

alias air='cd ~/airlab/repos/airbnb'
alias data='cd ~/airlab/repos/data'
alias datainf='cd ~/airlab/repos/data-infra'
alias rookery='cd ~/airlab/repos/rookery'

alias lend='cd ~/lending_club'
alias lc='cd ~/lending_club'
alias lc2='cd ~/lending_club_copier'

alias git=hub
alias gd='git diff'
alias gp='git push'
alias gpf='git push -f'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gm='git commit'
alias gst='git status'
alias gss='git stash show -p'
alias gps="git rev-parse --abbrev-ref HEAD | awk '{print \"git push origin \"$1\":\"$1}' | sh"
alias gpsf="git rev-parse --abbrev-ref HEAD | awk '{print \"git push origin \"$1\":\"$1\" -f\"}' | sh"

alias gsm="git status -s | egrep '(([M|A][M|A])|( [M|A])|([M|A] )) ' | cut  -c 4-"
alias gam="gsm | xargs -n1 git add"
alias gma="gam && git commit --amend --no-edit"
alias tm="gsm | xargs -n1 touch"
alias gcm="git checkout master"

alias grm="git fetch && git fetch origin && git rebase origin/master"
alias gfrm="git fetch && git fetch origin && git rebase origin/master"
alias c="clay"
