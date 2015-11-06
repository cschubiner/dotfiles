export PATH=$PATH:~/bin:~/Dropbox/googleSearchScraper/bin
export PATH=$PATH:/opt/local/bin


export SSH_AUTH_SOCK=$TMPDIR/ssh-agent-$USER.sock

function goldkey2 {
	 killall ssh-agent
	 ssh-add -s /usr/local/lib/opensc-pkcs11.so -t 8640000
}

alias air='cd ~/airlab/repos/airbnb'
alias data='cd ~/airlab/repos/data'
alias rookery='cd ~/airlab/repos/rookery'

alias lend='cd ~/lending_club'

alias git=hub
alias gst='git status'
alias tm="git status -s | egrep '(([M|A][M|A])|( [M|A])|([M|A] )) ' | cut  -c 4- | xargs -n1 touch"
alias gps="git rev-parse --abbrev-ref HEAD | awk '{print \" push origin \"$1\":\"$1}' | xargs git"
alias gpsf="git rev-parse --abbrev-ref HEAD | awk '{print \" push origin \"$1\":\"$1\" -f\"}' | xargs git"
