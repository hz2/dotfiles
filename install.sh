
#!/bin/sh

echo 'make link '

# ./文档/software/make_link.sh 

ln -s $(pwd)/.bash_aliases  ~/.bash_aliases
ln -s $(pwd)/.vim  ~/.vim
ln -s $(pwd)/.vimrc  ~/.vimrc

echo 'make path'
echo export PATH=$PATH:$(pwd)/path >> ~/.profile
sudo echo export PATH=$PATH:$(pwd)/path >> /root/.profile


ln -s ~/dotfiles/.config/fish/config.fish  ~/.config/fish/config.sh

sudo echo export PATH=$PATH:$(pwd)/path >> /root/.profile
