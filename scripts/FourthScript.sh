#!/bin/sh
if [ "(wc -c overload.log > 0)" ] ; then  echo $(date) >> CurrentStatus.log; else echo $(date) >> CurrentStatus.log; fi
