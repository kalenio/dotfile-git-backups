git init --bare $HOME/.dotfile-git-backups/
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfile-git-backups/ --work-tree=$HOME'
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfile-git-backups/ --work-tree=$HOME'" >> $HOME/.bashrc
(cd $HOME/.dotfile-git-backups; dotfiles config --local status.showUntrackedFiles no)