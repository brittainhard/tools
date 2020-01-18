"""
This is not my code, from my Black Hat Python book.

Interestingly enough, if you connect to the server with requests, the connection
stays open even when you have killed the process.

Actually, scratch that. Ipython keeps the connection open. Cool.
"""

import socket
import threading

bind_ip = "127.0.0.1"
bind_port = 9999

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

server.bind((bind_ip, bind_port))

server.listen(5)

print("[*] listening on %s:%d" % (bind_ip, bind_port))

def handle_client(client_socket):
    request = client_socket.recv(1024)
    print("[*] recieved: %s" % request)
    client_socket.send(b"Ack!")
    client_socket.close()

while True:
    client, addr = server.accept()
    print("[*] Accepted connection from %s:%d" % (addr[0], addr[1]))

    client_handler = threading.Thread(target=handle_client, args=(client,))
    client_handler.start()
