nmap and zenmap
===============

Saving this so hopefully I wont have to do it again.

It looks like if you ping any address on the subnet it will find the others. You
have to include the CIDR notation though, or it will fail. So pinging something
like 192.168.50.127/24 will get the address of the Monolith, but it will also find
all the other devices. Simple enough.

To get all devices, run::
   
   nmap -sP <default gateway in CIDR>


I'm not sure what happens if you try to do /16 when the subnet is /24, though.

To see the results, use :ref:`arp`

If you are doing this while looking at wireshark, you will see a massive flood of ARP requests. You should try this with your Kali box do you can see what its like from another computer.

Also, zenmap kinda sucks. It's just a GUI way of doing that nmap is doing.

see :ref:`On Capturing All Traffic`
