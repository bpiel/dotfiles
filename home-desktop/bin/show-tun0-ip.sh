ip addr | grep -A 2 tun0: | grep -o -P "inet\s+\d+\.\d+\.\d+\.\d+" | grep -o -P "[\d.]+"
