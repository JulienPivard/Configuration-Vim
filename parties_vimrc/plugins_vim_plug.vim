" Dernière modification : jeudi 28 septembre[09] 2017

call plug#begin( '~/.vim/bundle/' )

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do' : function( 'BuildYCM' ) }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'gorodinskiy/vim-coloresque'
Plug 'gregsexton/gitv'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-arpeggio'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree', { 'on' : 'UndotreeToggle' }
Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'phongnh/vim-antlr', { 'for' : 'antlr' }
Plug 'rdnetto/YCM-Generator', { 'branch' : 'stable' }
Plug 'reedes/vim-pencil', { 'for' : 'markdown' }
Plug 'scrooloose/nerdtree', { 'on' :  'NERDTreeToggle'  }
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim', { 'on' : 'GundoToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/FSwitch', { 'for' : ['ada', 'cpp', 'hpp'] }
Plug 'vim-scripts/FuzzyFinder'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/SpellCheck'
Plug 'vim-scripts/ingo-library'
Plug 'vim-scripts/matchit.zip'
Plug 'chr4/nginx.vim'

" Plugin pour gvim.
Plug 'vim-scripts/hexHighlight.vim'

" Charger un plugin depuis l'extérieur
"Plug '~/Programmation/VimScript/potion'

call plug#end()
filetype plugin indent on

" vim:foldlevel=0:foldmethod=marker
