#!/bin/bash

# Creates a folder in $HOME as a bare git repository.
git init --bare $HOME/.dotfile-git-backups/

# Adds the 'dotfiles' alias to the shell configuration file so it can be used in place of the 'git' command.
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfile-git-backups/ --work-tree=$HOME'" >> $HOME/.bashrc

# Sets the new repository to hide any files in $HOME that we are not backing up.
/usr/bin/git --git-dir=$HOME/.dotfile-git-backups/ --work-tree=$HOME config --local status.showUntrackedFiles no

