#!/bin/sh

bin=~/.local/bin
pic=~/.local/share/icons
app=~/.local/share/applications
software=${HOME}/software
mkdir -p $bin

cd $(dirname $0)

# nightly

ln -sfn ${software}/nightly/firefox/firefox ${bin}/nightly
ln -sfn $(pwd)/nightly.desktop ${app}
ln -sfn $(dirname $(pwd))/icons/firefox_nightly.svg ${pic}/nightly.svg

# Telegram
ln -sfn ${software}/tgdesktop/Telegram ${bin}/telegram
ln -sfn $(pwd)/telegram.desktop  ${app}

# # vs codium
# ln -sfn ${software}/codium/bin/codium ${bin}/codium
# ln -sfn $(pwd)/codium.desktop  ${app}
# ln -sfn $(pwd)/codium-url-handler.desktop  ${app}

# # idea
# ln -sfn ${software}/idea-IC/bin/idea.sh ${bin}/idea
# ln -sfn $(pwd)/idea.desktop  ${app}

# # pycharm
# ln -sfn ${software}/pycharm/bin/pycharm.sh ${bin}/pycharm
# ln -sfn $(pwd)/pycharm.desktop  ${app}
