#!/bin/bash

i=1
while [ "$i" -ne 0 ]
do
  curl localhost:8080/management/housekeeping?expired=36
  sleep 300
  curl localhost:8080/management/housekeeping?info=36
  sleep 300
done

