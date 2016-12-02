colourscheme='molokai'
vimversion='vim80'
bashrc=$(<~/.bashrc)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
git pull

bash setup2.sh
