HOSTNAME=$(hostname)
RELEASE=$(lsb_release -ds)
IP=$(hostname -I | xargs)
DATE=$(date +"%A, %d %B %Y")
GREETING="$HOSTNAME $RELEASE ($IP)\n$DATE"
[ -x /usr/games/lolcat ] && echo -e $GREETING | lolcat || echo -e $GREETING
