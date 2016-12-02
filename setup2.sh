colourscheme='molokai'
vimversion='vim80'
bashrc=$(<~/.bashrc)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
{
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    wget https://raw.githubusercontent.com/connermcd/gtd/master/gtd
} &> /dev/null

echo Updating vim
echo ____________

rm -f ~/.vimrc
rm -f /usr/share/vim/$vimversion/colors/$colourscheme.vim
echo Deleted old files..

ln .vimrc ~/.vimrc
cp $colourscheme.vim /usr/share/vim/$vimversion/colors/$colourscheme.vim
sudo mv gtd /usr/bin/gtd
sudo chmod 777 /usr/bin/gtd
echo Linked new files..

echo Installing plugins..
vim +PluginClean +qall
vim +PluginInstall +qall
vim +PluginUpdate +qall

if [[ ! $bashrc =~ :q ]]
then
    echo alias :q=\"exit\" >> ~/.bashrc
fi

if [[ ! $bashrc =~ vimupdate ]]
then
    echo alias vimupdate=\"bash $PWD/setup.sh\" >> ~/.bashrc
fi

if [[ ! $bashrc =~ uploadvimrc ]]
then
    echo alias uploadvimrc=\"bash $PWD/editrc\" >> ~/.bashrc
fi
    
if [[ ! $bashrc =~ work-tmux ]]
then
    echo alias work-tmux=\"bash $PWD/work-tmux.sh\" >> ~/.bashrc
fi

bash setup_autocomplete.sh

echo Done! You can now use Vim. use vimupdate to run this script again
