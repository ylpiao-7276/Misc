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
if grep -q "glocal" ${HOME}/.zshrc
then
  echo "skip modifying zshrc"
else
  echo "
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}\${vcs_info_msg_0_}%f$ '
# git
alias glocal='git co master && git pull && git co local && git rebase master'
alias gilocal='git co master && git pull && git co local && git rebase -i master'
alias gpush='git push origin local:master'
alias gs='git status -u .'
# other
alias lt='ls -lrt'
alias zrc='vi ~/.zshrc && source ~/.zshrc'
" >> ${HOME}/.zshrc
  source ${HOME}/.zshrc
fi
git config --global alias.co checkout
git config --global alias.st status
git config --global user.name "Yanglu Piao"
git config --global user.email yp2419@columbia.edu
git config --global core.editor vim
ssh-keygen -t rsa -b 4096 -C "yp2419@columbia.edu"
ssh-add ${HOME}/.ssh/id_rsa
cat ${HOME}/.ssh/id_rsa.pub
