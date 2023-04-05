#!/bin/bash
mkdir ps
ps aux > ps/procesy.txt
pstree > ps/strom.txt
tar -czvf archiv.tar.gz ps

