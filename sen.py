from socket import *
import time

host  = '172.31.52.142'
port = 13141
bufsize = 1024

addr = (host,port)
udpClient = socket(AF_INET,SOCK_DGRAM)

i = 0
while i<10:
    data = "ping"
    data = data.encode(encoding="utf-8") 
    udpClient.sendto(data,addr)
    print(data.decode(encoding="utf-8"))
    time.sleep(1)
    i += 1



udpClient.close()
