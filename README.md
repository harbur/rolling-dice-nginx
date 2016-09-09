# Rolling Dice Nginx

Rolling Dice Nginx - An example of health check use

The rules are the following:

- Every time the application starts it rolls a 20-sided dice.
- If the number is 8 or above, the application wins the goblin and starts the nginx.
- If the number is 7 or below, the application misses the hit, the goblin counter-attacks and nginx is never launched.

# Why?

The RDN is used in order to help better understand how health checks works. It simulates an application that may or may-not fail during startup.
In order to avoid having the container exit-on-failure, the startup is _wrongly_ designed to launch nginx on the background and tail the access logs.
If the nginx is launched correctly it is exposed on port `80` and outputs the `hostname` on a request.

# Versions

- The version `v1` is released without health-check.
- The version `v2` is the new and improved version that contains health-check metadata.
