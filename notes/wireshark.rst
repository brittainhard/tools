Wireshark
=========

Notes for wireshark

On Capturing All Traffic
------------------------

Your network interface must be put into monitor mode.

The documentation says to run "ifconfig <interface> monitor" but this is not
working on kali. This is because it's not a wlan interface, bro.

Decided to use the Kali laptop. Ran these commands: ::

    sudo airmon-ng start wlan0
    sudo airmon-ng stop wlan0mon

This will start and stop monitor mode for the wireless adapter. airmon-ng
changes the name of the inferface to wlan0mon for some reason.

Still had to turn on and off the wireless to get it to work, and had to put the
password for the network in again, which was weird.
