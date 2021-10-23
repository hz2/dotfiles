#!/bin/sh
dir=$(readlink $0)
cd $(dirname $dir)
sed -Ei 's+(# idea.(\w*).path=.*)+\1\n  idea.\2.path=~/.jetBrains/pycharm/\2+g' ./bin/idea.properties

./bin/pycharm.sh