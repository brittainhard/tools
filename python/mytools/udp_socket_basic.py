"""
This isn't working, as I'm not sure you can connect through http using udp.
"""

import socket

target_host = "www.google.com"
target_port = 80

# AF_INET = use standard IPv4
# SOCK_DGRAM = use a udp client
client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

client.sendto(b"Hello!", (target_host, target_port))

data, addr = client.recvfrom(4096)

print(data)
