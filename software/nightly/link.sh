#!/bin/sh
ln -s /home/x/software/nightly/firefox/firefox /usr/bin/nightly

cp /home/x/dotfiles/software/nightly/nightly.desktop /usr/share/applications/


cp installs.ini ~/.mozilla/firefox
cp profiles.ini ~/.mozilla/firefox
