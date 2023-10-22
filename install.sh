
#!/bin/sh

echo 'make link '

rm -rf ~/.bash_aliases  ~/.zshrc  ~/.vim  ~/.vimrc 

# ./文档/software/make_link.sh 
# sudo ln -s $(pwd)/path/* /usr/local/bin/

ln -s $(pwd)/.bash_aliases  ~/.bash_aliases
ln -s $(pwd)/.zshrc  ~/.zshrc
ln -s $(pwd)/.vim  ~/.vim
ln -s $(pwd)/.vimrc  ~/.vimrc

echo 'make path'
echo export PATH=$PATH:$(pwd)/path >> ~/.profile
sudo echo export PATH=$PATH:$(pwd)/path >> /root/.profile


ln -s ~/dotfiles/.config/fish/config.fish  ~/.config/fish/config.sh

# rm -rf  '/usr/local/bin/aptkey'
# rm -rf  '/usr/local/bin/codium'
# rm -rf  '/usr/local/bin/idea'
# rm -rf  '/usr/local/bin/nightly'
# rm -rf  '/usr/local/bin/proxyoff'
# rm -rf  '/usr/local/bin/proxyon'
# rm -rf  '/usr/local/bin/pycharm'
# rm -rf  '/usr/local/bin/sysclean'
# rm -rf  '/usr/local/bin/telegram'