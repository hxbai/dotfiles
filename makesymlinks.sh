#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
#files="bashrc vimrc spacemacs emacs.d zshrc oh-my-zsh"    # list of files/folders to symlink in homedir
files="bashrc"
vimfiles="vimrc vim_runtime"
zshfiles="zshrc oh-my-zsh"
spacemacsfiles="spacemacs emacs.d"
##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install zsh
            install_zsh
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt-get install zsh
            install_zsh
        fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

install_vim () {
if [[ ! -d $dir/vim_runtime/ ]]; then
    git clone https://github.com/amix/vimrc.git $dir/vim_runtime
fi
}

install_spacemacs () {
if [[ ! -d $dir/emacs.d/ ]]; then
    git clone --recursive https://github.com/syl20bnr/spacemacs $dir/emacs.d
fi
}

read -p "Zsh? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    for file in $zshfiles; do
        echo "Moving any existing dotfiles from ~ to $olddir"
        mv ~/.$file $olddir/
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    done
    install_zsh;
fi;

read -p "Vim? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    for file in $vimfiles; do
        echo "Moving any existing dotfiles from ~ to $olddir"
        mv ~/.$file $olddir/
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    done
    install_vim
fi;

read -p "Spacemacs? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    for file in $spacemacsfiles; do
        echo "Moving any existing dotfiles from ~ to $olddir"
        mv ~/.$file $olddir/
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    done
    install_spacemacs;
fi;



unset dir;
unset olddir;
unset files;
unset install_zsh;
unset install_vim;
unset install_spacemacs;
