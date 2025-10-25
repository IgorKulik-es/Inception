#!/bin/sh

while nc -z 127.0.0.1 3306 &>/dev/null; do sleep 1 ; done ;
exec mariadbd-safe