#! /bin/bash
# Vundle
if [ ! -d "${HOME}/.vim/bundle/Vundle.vim" ]
then
  git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall 'craigemery/vim-autotag'
else
  echo "skip Vundle"
fi
if [ -f "${HOME}/.vimrc.bak" ]
then
  rm ${HOME}/.vimrc.bak
fi
mv ${HOME}/.vimrc ${HOME}/.vimrc.bak
cp vimrc ${HOME}/.vimrc
# git
# apt-get install git
if grep -q "glocal" ${HOME}/.bashrc
then
  echo "skip modifying bashrc"
else
  echo "
# git
alias glocal='git co master && git pull && git co local && git rebase master'
alias gilocal='git co master && git pull && git co local && git rebase -i master'
alias gpush='git push origin local:master'
# other
alias lt='ls -lrt'
" >> ${HOME}/.bashrc
  # export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[01;32m\]`git branch 2>/dev/null | grep "^*" | colrm 1 2`\[\033[00m\] \$ '
  source ${HOME}/.bashrc
fi
git config --global alias.co checkout
git config --global alias.st status
git config --global user.name "Yanglu Piao"
git config --global user.email yp2419@columbia.edu
git config --global core.editor vim
ssh-keygen -t rsa -b 4096 -C "yp2419@columbia.edu"
ssh-add ${HOME}/.ssh/id_rsa
cat ${HOME}/.ssh/id_rsa.pub
