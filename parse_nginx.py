from collections import namedtuple

a = []
lines = []

with open("logs/nginx/access.log.1", "r") as f:
    for x in f.readlines():
        current_line = {}
        splitline = x.split(" ")
        current_line["ip"] = splitline[0]
        lines.append(current_line)
        a.append(splitline)

print(a[1])
