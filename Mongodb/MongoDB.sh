#!/bin/bash
case $# in
  1)
    output=$(/bin/echo "db.serverStatus().$1" |/usr/bin/mongo 127.0.0.1:27017 -u root -p 12345 --authenticationDatabase admin |sed -n '4p')
    ;;
  2)
    output=$(/bin/echo "db.serverStatus().$1.$2" |/usr/bin/mongo 127.0.0.1:27017 -u root -p 12345 --authenticationDatabase admin|sed -n '4p')
    ;;
  3)
    output=$(/bin/echo "db.serverStatus().$1.$2.$3" |/usr/bin/mongo 127.0.0.1:27017 -u root -p qn7XrrXRDtR6QBv82xqMi --authenticationDatabase admin|sed -n '4p')
    ;;
esac

#check if the output contains "NumberLong"
if [[ "$output" =~ "NumberLong"   ]];then
  echo $output|sed -n 's/NumberLong(//p'|sed -n 's/)//p'
else
  echo $output
fi
