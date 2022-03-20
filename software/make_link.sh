#!/bin/sh

cd $(dirname $0)

# Telegram
ln -s /home/x/software/tgdesktop/Telegram /usr/bin/telegram
ln -s $(pwd)/tgdesktop/telegram.desktop  ~/.local/share/applications

# vs codium
ln -s $(pwd)/codium/bin/codium /usr/bin/codium
ln -s $(pwd)/codium/codium.desktop  ~/.local/share/applications

# idea
ln -s $(pwd)/idea-IC/start_idea.sh /usr/bin/idea
ln -s $(pwd)/idea-IC/idea.desktop  ~/.local/share/applications

# pycharm
ln -s $(pwd)/pycharm/start_pycharm.sh /usr/bin/pycharm
ln -s $(pwd)/pycharm/pycharm.desktop  ~/.local/share/applications