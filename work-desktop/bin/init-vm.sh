# run this IN the vm
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' .bashrc
echo "alias ll='ls -alFh'" >> ~/.bash_aliases
echo "alias la='ls -A'" >> ~/.bash_aliases
echo "alias l='ls -CF'" >> ~/.bash_aliases
echo "alias lold='ls -tlh'" >> ~/.bash_aliases
echo "alias lnew='ls -tlhr'" >> ~/.bash_aliases
echo "alias lsmall='ls -lSh'" >> ~/.bash_aliases
echo "alias lbig='ls -lShr'" >> ~/.bash_aliases
cd /
sudo ln -s /opt/code/ c
cd
echo "ps aux | grep -v \"grep\" | grep --color=auto \"\$1\"" > ~/bin/p
chmod u+x ~/bin/p
git config --global user.name "Bill Piel"
git config --global user.email bill@billpiel.com
git config --global color.ui auto
