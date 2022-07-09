" Auto install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	" autocmd VimEnter * PlugInstall
	" autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

	" Better Syntax Support
	Plug 'sheerun/vim-polyglot'
	" File Explorer
	" Plug 'scrooloose/NERDTree'
	" Auto pairs for '(' '[' '{'
	Plug 'jiangmiao/auto-pairs'
	" Themes
	Plug 'joshdick/onedark.vim'
	" Intellisense
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" Airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" Ranger
	Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}	
	" Which Key, never forget the keybindings
	Plug 'liuchengxu/vim-which-key'
	" FZF & vim-rooter
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'airblade/vim-rooter'



call plug#end()

" Automatically install missing plugins on startup
