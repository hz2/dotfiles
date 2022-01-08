#!/bin/sh
dir=$(readlink $0)
cd $(dirname $dir)
if ! grep -q '~/.jetBrains' ./bin/idea.properties; then
    sed -Ei 's+(# idea.(\w*).path=.*)+\1\n  idea.\2.path=~/.jetBrains/pycharm/\2+g' ./bin/idea.properties
fi

./bin/pycharm.sh