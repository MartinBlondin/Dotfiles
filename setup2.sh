bashrc=$(<~/.bashrc)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
{
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
} &> /dev/null

echo Updating vim
echo ____________

rm -f ~/.vimrc
rm -f ~/.nvimrc
echo Deleted old files..

ln .vimrc ~/.vimrc
ln .nvimrc ~/.nvimrc
echo Linked new files..

echo Installing plugins..
vim +PluginClean +qall
vim +PluginUpdate +qall
vim +PluginInstall +qall

if [[ ! $bashrc =~ :q ]]
then
    echo alias :q=\"exit\" >> ~/.bashrc
fi

if [[ ! $bashrc =~ vimupdate ]]
then
    echo alias vimupdate=\"bash $PWD/setup.sh\" >> ~/.bashrc
fi

if [[ ! $bashrc =~ work-tmux ]]
then
    echo alias work-tmux=\"bash $PWD/work-tmux.sh\" >> ~/.bashrc
fi

if [[ ! $bashrc =~ nvim ]]
then
    echo alias vim=\"nvim -u ~/.nvimrc\" >> ~/.bashrc
fi

echo Done! You can now use Vim. use vimupdate to run this script again
