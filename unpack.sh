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
function link(){
    echo "Linking $1 to location $PWD/$2"
    ln -f -s -T $1 $2
}
cd ~

# Move vim folder to home directory
link $DIR/vim .vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

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
link $DIR/sbclrc .sbclrc
link $DIR/fish .config/fish
link $DIR/termite .config/termite

git clone https://github.com/syl20bnr/spacemacs.git .emacs.d/
cd .emacs.d
git checkout develop
cd ~
link $DIR/spacemacs .spacemacs
link $DIR/spacemacs-user .spacemacs-user


cd ~
mkdir -p ~/.config/i3; cd ~/.config/i3
link $DIR/i3/i3config config
cd ~/.config
link $DIR/i3/i3blocks i3blocks
