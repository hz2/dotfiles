#!/bin/sh

bin=~/.local/bin
pic=~/.local/share/icons
app=~/.local/share/applications
mkdir -p $bin

cd $(dirname $0)

# nightly

ln -sfn ${HOME}/software/nightly/firefox/firefox ${bin}/nightly
ln -sfn $(pwd)/nightly/nightly.desktop ${app}
ln -sfn $(pwd)/nightly/firefox_nightly2.svg ${pic}/nightly.svg

# Telegram
ln -sfn ${HOME}/software/tgdesktop/Telegram ${bin}/telegram
ln -sfn $(pwd)/tgdesktop/telegram.desktop  ${app}

# vs codium
ln -sfn ${HOME}/software/codium/bin/codium ${bin}/codium
ln -sfn $(pwd)/codium/codium.desktop  ${app}
ln -sfn $(pwd)/codium/codium-url-handler.desktop  ${app}

# idea
ln -sfn $(pwd)/idea-IC/start_idea.sh ${bin}/idea
ln -sfn $(pwd)/idea-IC/idea.desktop  ${app}

# pycharm
ln -sfn $(pwd)/pycharm/start_pycharm.sh ${bin}/pycharm
ln -sfn $(pwd)/pycharm/pycharm.desktop  ${app}
