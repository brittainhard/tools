netcat
======

To start a process as a server::

   nc -l -p 1234 -e /bin/sh

Then, connect to that same server using::Then, connect to that same server
using::

   nc <ip address> 1234

However many netcat distributions do not have the `-e` available, since it
causes massive security holes. However, you can still get this to work if your
netcat version doesn't have the flag ::

   nc -l -p 1234 | /bin/sh

This should get you what you need, but it's very useless, since no stdout is
returned to you on the client side. There are probably some more options for
getting this to work.
