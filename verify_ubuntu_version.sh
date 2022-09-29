#!/bin/sh
rel=`lsb_release -r -s`
if [ $rel = "20.04" ]
then
    exit 0
else
    echo "This is not Ubuntu 20.04"
    exit 1
fi