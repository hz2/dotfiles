#!/bin/sh

cd $(dirname $0)

# nightly
ln -s /home/z/software/nightly/firefox/firefox /usr/bin/nightly
ln -s $(pwd)/nightly/nightly.desktop ~/.local/share/applications

# Telegram
ln -s /home/z/software/tgdesktop/Telegram ../path/telegram
ln -s $(pwd)/tgdesktop/telegram.desktop  ~/.local/share/applications

# vs codium
ln -s /home/z/software/codium/bin/codium ../path/codium
ln -s $(pwd)/codium/codium.desktop  ~/.local/share/applications

# idea
ln -s $(pwd)/idea-IC/start_idea.sh ../path/idea
ln -s $(pwd)/idea-IC/idea.desktop  ~/.local/share/applications

# pycharm
ln -s $(pwd)/pycharm/start_pycharm.sh ../path/pycharm
ln -s $(pwd)/pycharm/pycharm.desktop  ~/.local/share/applications
