#!/bin/bash

FILE=$1
shift
CMD=$*

while true
do
   ATIME=`stat -c %Z $FILE`

   if [[ "$ATIME" != "$LTIME" ]]
   then
       eval $CMD
       echo
       echo `date`
       echo
       LTIME=$ATIME
   fi
   sleep 1
done
