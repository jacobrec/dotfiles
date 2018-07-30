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
cd ~

# Move vim folder to home directory
ln -s $DIR/vim .vim

# Move bash files to home directory
cd $DIR/bash
for file in *; do
    cd ~
    ln -s $DIR/bash/$file .$file
done
cd ~


ln -s $DIR/tmux.conf .tmux.conf
