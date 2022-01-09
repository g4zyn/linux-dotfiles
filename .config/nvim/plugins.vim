filetype plugin on
filetype indent on

call plug#begin('~/.vim/plugged')

"Airline -> Light status line
Plug 'vim-airline/vim-airline'

"Theme plugins
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

"Icons for airline
Plug 'ryanoasis/vim-devicons'

Plug 'dense-analysis/ale'

"Autocomplete megatool -> language servers, autocomplete, snippets, plugins
"for the plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Auto pairs -> Pressing ( types ()
Plug 'jiangmiao/auto-pairs'

"Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

"Swagger preview
Plug 'xavierchow/vim-swagger-preview'

" Go Plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Coornail/vim-go-conceal', {'for': 'go'}

"Fuzzy finder, ctrl-p replacement
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"More text targets
Plug 'wellle/targets.vim'

"Better commenting
Plug 'preservim/nerdcommenter'

"Action menu
if has('nvim')
  Plug 'kizza/actionmenu.nvim'
endif

Plug 'airblade/vim-gitgutter'

"Register view
Plug 'junegunn/vim-peekaboo'

Plug 'liuchengxu/vista.vim'


call plug#end()
