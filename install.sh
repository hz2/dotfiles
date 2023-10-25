
#!/bin/sh

echo 'make link '

mkdir -p ~/.dotfiles_backup/ 
cp  ~/.* ~/.dotfiles_backup/ 

# ./software/make_link.sh 

ln -sfn $(pwd)/.bash_aliases  ~/.bash_aliases
ln -sfn $(pwd)/.bashrc  ~/.bashrc
ln -sfn $(pwd)/.zshrc  ~/.zshrc
ln -sfn $(pwd)/.vim  ~/.vim
ln -sfn $(pwd)/.vimrc  ~/.vimrc


echo 'make path'
echo export PATH=$PATH:$(pwd)/path >> ~/.profile
sudo echo export PATH=$PATH:$(pwd)/path >> /root/.profile


ln -s ~/dotfiles/.config/fish/config.fish  ~/.config/fish/config.sh