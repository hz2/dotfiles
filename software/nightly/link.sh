#!/bin/sh
ln -s /home/x/software/nightly/firefox/firefox /usr/bin/nightly

cp ~/dotfiles/software/nightly/nightly.desktop ~/.local/share/applications/


cp installs.ini ~/.mozilla/firefox
cp profiles.ini ~/.mozilla/firefox
