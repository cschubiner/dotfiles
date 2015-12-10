export PATH=$PATH:~/bin:~/Dropbox/googleSearchScraper/bin
export PATH=$PATH:/opt/local/bin

export SSH_AUTH_SOCK=$TMPDIR/ssh-agent-$USER.sock

alias air='cd ~/airlab/repos/airbnb'
alias data='cd ~/airlab/repos/data'
alias rookery='cd ~/airlab/repos/rookery'

alias lend='cd ~/lending_club'

alias git=hub
alias gp='git push'
alias gpf='git push -f'
alias gm='git commit'
alias gst='git status'
alias gps="git rev-parse --abbrev-ref HEAD | awk '{print \"git push origin \"$1\":\"$1}' | sh"
alias gpsf="git rev-parse --abbrev-ref HEAD | awk '{print \"git push origin \"$1\":\"$1\" -f\"}' | sh"

alias gsm="git status -s | egrep '(([M|A][M|A])|( [M|A])|([M|A] )) ' | cut  -c 4-"
alias gam="gsm | xargs -n1 git add"
alias tm="gsm | xargs -n1 touch"
