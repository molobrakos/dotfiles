# List directory contents
alias ls='ls -G -h --color=auto'
alias sl=ls
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'

alias _="sudo"

if [ $(uname) = "Linux" ]
then
  alias ls="ls --color=auto"
fi

alias c='clear'
alias cls='clear'

alias edit="$EDITOR"
alias pager="$PAGER"

alias q='exit'

# Language aliases
alias rb='ruby'
alias py='python'
alias ipy='ipython'

alias ~='cd ~'
alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias -- -='cd -'        # Go back

alias ?='man'
alias +='pager'
alias trash='mv -t $HOME/.local/share/Trash/files'

# prompt
alias rm='rm -I'
alias du='du -h'
alias df='df -h'
alias mkdir='mkdir -p'

# Shell History
alias h='history'

# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# Grep
alias grep='grep --color=auto'

# Directory
alias md='mkdir -p'
alias rd='rmdir'

# Display whatever file is regular file or folder
catt() {
  for i in "$@"; do
    if [ -d "$i" ]; then
      ls "$i"
    else
      cat "$i"
    fi
  done
}

alias glances="glances --disable-history"
alias realias=". $HOME/.dotfiles/bash/aliases.bash"

alias bat="upower -i \$(upower -e | grep -i bat) | grep -E 'state|to\ full|percentage' && upower -i \$(upower -e | grep -i line) | grep online"

alias rmtmp="rm *~"

alias netstat="netstat -vatpW"

alias btdownload="transmission-cli --blocklist --encryption-required --download-dir ~/Download"
#    btdownloadcurses --crypto_only 1 --crypto_stealth 1

# from http://stackoverflow.com/questions/3154460/python-human-readable-large-numbers
humanize () {
    python2.7 -c "print('{:,}').format($1)"
}

alias sshguard-show-bans='sudo iptables -L sshguard --line-numbers'
alias sshguard-unban='sudo iptables -D sshguard '
alias ssh-host-key="ssh-keygen -l -f /etc/ssh/ssh_host_rsa_key"

alias glances="glances --disable-history"/

# view http traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

alias pubkey="cat ~/.ssh/id_rsa.pub"

# Extract compressed file
extract () {
  if [ -f $1 ] && [ -r $1 ] ; then
    case $1 in
      (*.tar.bz2|*.tbz2)  tar xjf $1;;
      (*.tar.gz|*.tgz)    tar xzf $1;;
      (*.bz2)             bunzip2 $1;;
      (*.rar)             rar x $1;;
      (*.gz)              gunzip $1;;
      (*.tar)             tar xf $1;;
      (*.zip)             unzip $1;;
      (*.Z)               uncompress $1;;
      (*.7z)              7z x $1;;
      (*.deb)             sudo dpkg -i $1;;
      (*.rpm)             sudo alien -dik $1;;
      (*)                 echo "extract: unsupported format $1" ;;
    esac
  else
    echo "extract: file not found or unreadable: $1"
  fi
}

# Add an "alert" alias for long running commands.  Use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# ----------------------------------
# apt
# ----------------------------------

alias au='sudo aptitude update'
alias ai='sudo aptitude install'
alias apts='aptitude search'
alias ase='aptitude search'
alias aptshow='aptitude show'
alias uninstall="sudo aptitude remove"
alias upgrade='sudo aptitude -y update && sudo aptitude -y safe-upgrade && sudo aptitude autoclean && sudo apt -y autoremove && sudo purge-old-kernels'

# ----------------------------------
# curl
# ----------------------------------

# follow redirects
alias cl='curl -L'

# follow redirects, download as original name
alias clo='curl -L -O'

# follow redirects, download as original name, continue
alias cloc='curl -L -C - -O'

# follow redirects, download as original name, continue, retry 5 times
alias clocr='curl -L -C - -O --retry 5'

# follow redirects, fetch banner
alias clb='curl -L -I'

# see only response headers from a get request
alias clhead='curl -D - -so /dev/null'

# ----------------------------------
# docker
# ----------------------------------

alias dklc='docker ps -l'  # List last Docker container
alias dklcid='docker ps -l -q'  # List last Docker container ID
alias dklcip='docker inspect -f "{{.NetworkSettings.IPAddress}}" $(docker ps -l -q)'  # Get IP of last Docker container
alias dkps='docker ps'  # List running Docker containers
alias dkpsa='docker ps -a'  # List all Docker containers
alias dki='docker images'  # List Docker images
alias dkrmac='docker rm $(docker ps -a -q)'  # Delete all Docker containers
alias dkrmlc='docker-remove-most-recent-container'  # Delete most recent (i.e., last) Docker container
alias dkrmui='docker images -q -f dangling=true |xargs -r docker rmi'  # Delete all untagged Docker images
alias dkrmli='docker-remove-most-recent-image'  # Delete most recent (i.e., last) Docker image
alias dkrmi='docker-remove-images'  # Delete images for supplied IDs or all if no IDs are passed as arguments
alias dkideps='docker-image-dependencies'  # Output a graph of image dependencies using Graphiz
alias dkre='docker-runtime-environment'  # List environmental variables of the supplied image ID
alias dkelc='docker exec -it `dklcid` /bin/bash' # Enter last container (works with Docker 1.3 and above)

# ----------------------------------
# git
# ----------------------------------

alias g='git'

alias gcl='git clone'
alias ga='git add'
alias gall='git add .'
alias gus='git reset HEAD'
alias gm="git merge"
alias g='git'
alias get='git'
alias gst='git status'
alias gs='git status'
alias gss='git status -s'
alias gl='git pull'
alias gpr='git pull --rebase'
alias gpp='git pull && git push'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gpo='git push origin'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcm='git commit -v -m'
alias gci='git commit --interactive'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gexport='git archive --format zip --output'
alias gdel='git branch -D'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"
alias gsl="git shortlog -sn"
alias gw="git whatchanged"
alias gt="git tag"
alias gta="git tag -a"
alias gtd="git tag -d"
alias gtl="git tag -l"
alias gtls='git tag -l | sort -V'

if [ -z "$EDITOR" ]; then
    alias gd='git diff'
else
    alias gd="git diff | $EDITOR"
fi
