import socket

target_host = "www.google.com"
target_port = 80

# AF_INET = use standard IPv4
# SOCK_STREAM = use a tcp client
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

client.connect((target_host, target_port))

client.send(b"GET / HTTP/1.1\r\nHost: www.google.com\r\n\r\n")

response = client.recv(4096)

print(response)
