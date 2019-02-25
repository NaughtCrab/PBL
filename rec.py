from socket import *
import time

host = '' 
port = 13141
bufsize = 1024
addr = (host,port) 

udpServer = socket(AF_INET,SOCK_DGRAM)
udpServer.bind(addr)

lst = []
i = 0
f = open("./rectime.txt",'w+')
interval = 0
while True:
    print('Waiting for connection...')
    data,addr = udpServer.recvfrom(bufsize)
    data  = data.decode(encoding='utf-8').upper()
    t = time.strftime('%H:%M:%S.%f')[:-3];
    t1 = int((time.time())*1000)
    lst.append(t1)
#    print(t1)
# save receiving time of signal to txt file
    print("{0}".format(t1),file=f)
    if len(lst)>2:
        interval = lst[-1] - lst[-2]    
        print('interval:',interval)
#        print("{0},{1},{2}".format(lst[-2],lst[-1],interval),file=f) 
#    print('from:',addr)
#    print(t,data)
    i += 1
    if (i == 10):
        break

#udpServer.close()

print(lst)

