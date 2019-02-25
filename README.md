# PBL
Project to run UDP and hot migiration in parallel to test the impaction<br>
Click `all.sh` to run automatically, and then read the `logs.txt` to check the migration time cost, and read the UDP time file in `rec`, the result is also shown in shell, time unit is `ms`<br>
<br>
`all.sh`: run `runpy.sh` and `build.py` in parallel, CRIU starts 2 seconds after `runpy.sh` running


## File description
Two part: UDP python files and Linux shell script for hot migration files
### UDP
`runpy.sh`: ssh to the receiver and execute `py.sh` in `rec`<br>
`py.sh`: execute `rec.py` and ssh to host1 to execute `sen.py`<br>
`sen.py`: send string "PING" by UDP from host1 to recevier each seconds<br>
`rec.py`: receive the string and record the time<br>

### CRIU
`build.py`: transmit `build1.py` to host1, and `build2.py` to host2, run these two bash in each host and get the timestamp and record in `logs.txt`<br>
`build1.py`: build alpine container, set checkpoint and transmit to host2<br>
`build2.py`: build empty container, restore from the checkpoint file of host1<br>

### Others in Delete
`delete1.sh`: delete the containers and files in host1<br>
`delete2.sh`: delete the containers and files in host2<br>




