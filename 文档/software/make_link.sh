#!/bin/sh

cd $(dirname $0)

# Telegram
ln -s $(pwd)/tgdesktop/Telegram /usr/bin/telegram
ln -s $(pwd)/tgdesktop/telegram.desktop  /usr/share/applications

# vs codium
ln -s $(pwd)/codium/bin/codium /usr/bin/codium
ln -s $(pwd)/codium/codium.desktop  /usr/share/applications

# idea
ln -s $(pwd)/idea-IC/start_idea.sh /usr/bin/idea
ln -s $(pwd)/idea-IC/idea.desktop  /usr/share/applications

# pycharm
ln -s $(pwd)/pycharm/start_pycharm.sh /usr/bin/pycharm
ln -s $(pwd)/pycharm/pycharm.desktop  /usr/share/applications