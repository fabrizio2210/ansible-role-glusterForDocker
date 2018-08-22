#!/bin/bash

/bin/echo "Questo script prova a montare il disco piu' volte"
i=0
while [ $i -lt 20 ] ; do
        /bin/echo "Tento di montare la cartella"
        /bin/mount -t glusterfs localhost:/main-cluster /mnt/cluster
        if [ $? -eq  0 ] ; then
                /bin/echo "Cartella montata"
                /bin/ls -l /mnt/cluster
                /bin/systemd-notify --ready
                exit 0
        fi
        sleep 5
        let i=$i+1
done

exit 1

