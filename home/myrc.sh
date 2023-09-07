alias gs='git status -uno'
alias gpush='git push origin main'
alias gpull='git pull --rebase origin main'
# git config --global credential.helper 'cache --timeout=999999999'


alias rc='vi ~/myrc.sh && source ~/.bashrc'
alias lt='ls -lrt'
mkcd() {
    mkdir -p "$1" && cd "$1"
}
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1 /p'
}
# Custom prompt
PS1="\[\033[32m\]\A\[\033[0m\] \[\033[34m\]\w\[\033[0m\] \[\033[31m\]\$(parse_git_branch)\[\033[0m\]$ "

alias cc='cd ../ && rm -rf build && mkcd build && cmake ..'
alias cm='make -j'
# xmodmap ~/.xmodmaprc
# scale text to 200%
gsettings set org.gnome.desktop.interface text-scaling-factor 2
