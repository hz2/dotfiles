#!/bin/sh
dir=$(readlink $0)
cd $(dirname $dir)

cd $HOME/software/pycharm/

./bin/pycharm.sh