#!/bin/sh
if [ "(wc -c overload.log > 50000)" ] ; then rm overload.log; echo $(date) >> cleanup.log; fi
