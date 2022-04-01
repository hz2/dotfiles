
#!/bin/sh

echo 'make link '

# ./文档/software/make_link.sh 

ln -s $(pwd)/.bash_aliases  ~/.bash_aliases

echo 'make path'
echo export PATH=$PATH:$(pwd)/path >> ~/.profile
sudo echo export PATH=$PATH:$(pwd)/path >> /root/.profile
