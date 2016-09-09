#!/bin/sh

echo $(hostname) > /usr/share/nginx/html/index.html

# Our Application takes 10secs to start
number=$RANDOM
let number%=20

# This should be the correct way to launch nginx
#exec nginx -g 'daemon off;'

# Faulty way:
# - This starts nginx on the background and launches a tail process on foreground.
# - If nginx process is killed, docker will not handle it since it monitors the 'tail' process (the foreground process)
echo "Rolling the dice... $number"
if [ $number -le 7 ]; then
  echo "Argh... we missed, the goblin counter-attacked and killed our application."
else
  echo "Looks good, the goblin is dead and we start the application."
  nginx
fi
exec tail -f /var/log/nginx/access.log
