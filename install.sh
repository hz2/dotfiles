
#!/bin/sh

echo 'make link '

./文档/software/make_link.sh 



echo 'make path'
echo export PATH=$PATH:$(pwd)/path >> ~/.profile
echo export PATH=$PATH:$(pwd)/path >> /root/.profile
