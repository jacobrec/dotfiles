#!/bin/bash
# Get directory unpack.sh is in
# https://stackoverflow.com/a/246128/1762507
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"

#########################################################
##########         Jacob's Dot files           ##########
##########    Unpack all my configs script     ##########
#########################################################
function link () {
    echo "Linking $1 to location $PWD/$2"
    ln -f -s -T "$1" "$2"
}
cd ~

# Move vim folder to home directory
link $DIR/vim .vim

# Move bash files to home directory
cd $DIR/bash
for file in *; do
    cd ~
    link $DIR/bash/$file .$file
done

# Move x files to home directory
cd $DIR/x
for file in *; do
    cd ~
    link $DIR/x/$file .$file
done
cd ~



link $DIR/tmux.conf .tmux.conf
link $DIR/guile .guile
link $DIR/sbclrc .sbclrc
link $DIR/termite .config/termite
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vim/vimrc ~/.vim/init.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


cd ~
mkdir -p ~/.config/i3; cd ~/.config/i3
link $DIR/i3/i3config config
cd ~/.config
link $DIR/i3/i3blocks i3blocks

# Git stuff
link $DIR/git/gitignore ~/.gitignore
git config --global user.name "Jacob Reckhard"
git config --global user.email "jacobreckhard@gmail.com"
git config --global core.excludesfile ~/.gitignore

# Install NVM
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.bashrc
npm i -g eslint standard eslint-standard babel-eslint eslint-plugin-react eslint-config-standard eslint-plugin-import eslint-plugin-standard eslint-plugin-promise eslint-plugin-node eslint-config-standard-jsx


