#!/bin/bash

for obj in $@; do
    service ${obj} start
done

# sleep
while :; do
    sleep 1
done
