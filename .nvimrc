" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
    
" VIM plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'joshdick/onedark.vim'
Plugin 'wellle/targets.vim'
Plugin 'tpope/vim-characterize'

" Writing plugins
"Plugin 'hysd/vim-grammarous'

" Git plugins
Plugin 'airblade/vim-gitgutter'

" Programming plugins
Plugin 'sheerun/vim-polyglot'
Plugin 'lifepillar/vim-mucomplete'
Plugin 'ternjs/tern_for_vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'joonty/vdebug'
Plugin 'w0rp/ale'

call vundle#end()

filetype plugin indent on

" Leader
let mapleader=","

" Neovim specific settings
set termguicolors
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Opening terminal in a new tab
nmap <Leader>t :tabnew<ENTER>:terminal<ENTER>

" ALE
let g:ale_sign_error = '|'
let g:ale_sign_warning = '|'
let g:ale_echo_msg_format = '[%linter%] %s'

" Gitgutter
let g:gitgutter_sign_removed_first_line = "^_"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Nerdtree setup
map <F2> :NERDTreeToggle<CR>

" Python-mode setup
let g:pymode_rope = 0

" colourscheme
syntax on
colorscheme onedark
set nofoldenable
set t_Co=256

" set working directory to current file's directory
set autochdir

" tab settings
set tabstop=4
set shiftwidth=4
set expandtab

autocmd FileType ruby set tabstop=2
autocmd FileType ruby set shiftwidth=2

autocmd FileType javascript set tabstop=2
autocmd FileType javascript set shiftwidth=2

autocmd FileType css set tabstop=2
autocmd FileType css set shiftwidth=2

" line numbers
set number
set relativenumber

" bracket autocompletion
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>]"

" autoindent inside of bracket
set autoindent
set cindent

" highlight characters past column 90
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%90v.*/
    autocmd FileType python set nowrap
augroup END

" rendering with <leader>l
autocmd FileType markdown nmap <Leader>l :! rm<c-R>%<BS><BS>pdf<ENTER>:w<ENTER>:! pandoc -o <c-R>%<BS><BS>pdf --template assignment <c-R>%<ENTER><ENTER>:! evince <c-R>%<BS><BS>pdf<ENTER>
autocmd FileType python nmap <Leader>l :w<ENTER> :! python3 <c-R>%<ENTER>
autocmd FileType tex nmap <Leader>l :w<ENTER> :! rm <c-R>%<BS><BS><BS>pdf<ENTER> :! pdflatex <c-R>%<ENTER> :! evince <c-R>%<BS><BS><BS>pdf<ENTER>
autocmd FileType ruby nmap <Leader>l :w<ENTER> :! ruby <c-R>%<ENTER>

" Switch to style file with <leader>c
autocmd FileType javascript nmap <Leader>c :w<ENTER> :e <c-R>%<BS><BS>css<ENTER>
autocmd FileType css nmap <Leader>c :w<ENTER> :e <c-R>%<BS><BS><BS>js<ENTER>

" Automatic Surrounding in visual mode
xmap " S"
xmap ' S'
xmap ( S)
xmap [ S]
xmap { S}

" Prefrences
set noswapfile
set nohlsearch

" Norwegian characters
nmap <Leader>d i<right>ø
nmap <Leader>a i<right>æ
nmap <leader>g i<right>å

" Opening file at same location as i closed it
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <=line("$")
        \| exe "normal! g'\"" | endif
endif
