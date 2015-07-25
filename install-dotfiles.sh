#!/bin/bash
############################
# install-dotfiles.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dotfilesdir=~/dotfiles                   	                          # dotfiles directory

vimcoldir=~/.vim/colors                                                   # vim color schemes directory
cheatsheetdir=~/.cheat                                                    # cheat sheet storage directory
                                 					  
dotfiles="bashrc bash_profile inputrc functions alias env vimrc"          # list of files to symlink to home directory
vimfiles="desertink.vim molokai_dark.vim molokai.vim"                     # list of vim configuration files to symlink to home directory
cheatsheets="ping"

##########

# create .vim configuration folder in home directory
echo -n "Creating vim colors configuration folder in ~/.vim ..."
mkdir -p $vimcoldir
echo "done"

# install Pathogen Vim addon manager
echo -n "Downloading & installing Pathogen in ~/.vim ..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo "done"

# install Vim plugins
echo -n "Downloading & installing Vim plugins in ~/.vim ..."
git clone https://github.com/plasticboy/vim-markdown.git ~/.vim/bundle/vim-markdown	# installing vim-markdown plugin. 
git clone https://github.com/ervandew/supertab.git ~/.vim/bundle/supertab               # installing SuperTab autocomplete plugin
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree  		# installing NERD Tree plugin. 
git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic           # installing Syntastic plugin.
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive          # installing fugitive-vim plugin. 
git clone https://github.com/vim-latex/vim-latex ~/.vim/bundle/vim-latex                # installing vim-latex plugin. 
git clone https://github.com/junegunn/limelight.vim.git ~/.vim/bundle/limelight.vim     # installing limelight.vim plugin.
git clone https://github.com/junegunn/goyo.vim.git ~/.vim/bundle/goyo.vim               # installing goyo.vim plugin. 
git clone https://github.com/mhinz/vim-startify.git ~/.vim/bundle/vim-startify          # installing vim-startify plugin.
git clone https://github.com/tpope/vim-eunuch.git ~/.vim/bundle/vim-eunuch              # installing vim-eunuch plugin.
git clone https://github.com/reedes/vim-wordy.git ~/.vim/bundle/vim-wordy               # installing vim-wordy plugin.
git clone https://github.com/mattn/gist-vim.git ~/.vim/bundle/gist-vim.git              # installing gist-vim.git.
echo "done"

# create .cheat storage folder in home directory
echo -n "Creating cheat storage folder in ~ ..."
mkdir -p $cheatsheetdir
echo "done"

# create symlinks from ~ to any files in the ~/dotfiles directory specified from the $dotfiles variable
for dotfile in $dotfiles; do
    echo "Creating symlink to $dotfile in home directory."
    ln -s -f $dotfilesdir/$dotfile ~/.$dotfile
done

# create symlinks from ~/.vim/colors directory to files in the dotfiles/.vim/colors directory, specified from $vimfiles variable
for vimfile in $vimfiles; do
    echo "Creating symlink to $vimfile in ~/.vim/colors directory"
    ln -s -f $dotfilesdir/.vim/colors/$vimfile $vimcoldir
done

# create symlinks from ~/.vim/colors directory to files in the dotfiles/.vim/colors directory, specified from $vimfiles variable
for cheatsheet in $cheatsheets; do
    echo "Creating symlink to $cheatsheet in ~/.cheat directory"
    ln -s -f $dotfilesdir/.cheat/$cheatsheet $cheatsheetdir
done

