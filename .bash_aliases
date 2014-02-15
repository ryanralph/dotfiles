function btcusd() {
      echo `curl -s https://api.bitcoinaverage.com/ticker/USD/last`
}

function myip() {
      curl -s http://checkip.dyndns.org/ | grep -Eo '\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>'
}

function pw() {
      echo `cat /dev/urandom | base64 | head -c $1`
}

function wpw() {
      shuf --random-source=/dev/urandom -n$1 /usr/share/dict/cracklib-small
}

function newWifi() {
	 sudo sh -c "wpa_passphrase $1 $2 >> /etc/wpa_supplicant.conf"
}

#C is for clear
alias c='clear'

#Quick CD
alias ..='cd ..'
alias ...='cd ../../../'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
		    alias ls='ls --color=auto'
		    alias dir='dir --color=auto'
		    alias vdir='vdir --color=auto'

		    alias grep='grep --color=auto'
		    alias fgrep='fgrep --color=auto'
		    alias egrep='egrep --color=auto'
fi
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#Create parent directories on command
alias mkdir='mkdir -pv'

#Show open ports
alias ports='netstat -tulanp'

#SAFETY NETS
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# reboot / halt / poweroff
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias halt='sudo halt'
alias shutdown='sudo shutdown 0'

alias gpgc="gpg -c"
alias gpgd="gpg -d"
