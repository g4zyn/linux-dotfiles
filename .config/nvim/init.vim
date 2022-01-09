let $VIMHOME = $HOME."/.config/nvim"

set nocompatible
syntax on
set encoding=UTF-8
set backspace=indent,eol,start
set cursorline
set noshowmode
set background=dark
set rnu
set hid
set autoread
set ignorecase
set hlsearch
set smartcase
set gcr=a:blinkon0
set incsearch
set signcolumn=number
set ttyfast
set undodir=~/.vim/undo-dir
set undofile
set nuw=3
set scrolloff=7
set showmatch
set diffopt+=context:2,iwhite
set wildmenu
set wildmode=full
set guicursor=
set mouse=a
set clipboard=unnamedplus
set ve+=onemore

if has('nvim')
    set wildoptions+=pum
endif

"set shellcmdflag=-ic

"Faster escape sequence
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END
set ttimeoutlen=0

"Faster updatetime
set updatetime=100

"Leader key remap
let mapleader=","

autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:> foldmethod=indent nofoldenable

"" Tab, tabstop, shiftwidth configuration. Expands tab into space, or not.
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

let g:ale_disable_lsp = 1
let g:ale_sign_warning = '⚠'
let g:ale_echo_cursor = 0
let g:ale_set_highlights = 1
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warn'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_floating_preview = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_cursor_detail = 1
let g:ale_hover_cursor = 1
let g:ale_close_preview_on_insert = 1
let g:ale_floating_window_border = []
let g:ale_linters = {
\   'go': ['revive'],
\   'proto': ['protolint'],
\}
let g:ale_go_revive_options = '-formatter unix -config revive.toml'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_fixers = {
\   'proto': ['ale#fixers#protolint#Fix'],
\}
let g:ale_fix_on_save = 1


source $VIMHOME/plugins.vim
source $VIMHOME/theme.vim
source $VIMHOME/keybindings.vim
source $VIMHOME/helper.vim

"netrw configuration
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle = 3

"Vista configuration
let g:vista_sidebar_width=60
let g:vista_fzf_preview = ['up:25%']
let g:vista_keep_fzf_colors = 1
let g:vista#renderer#enable_icon = 1
let g:vista_cursor_delay = 50
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_close_on_jump = 1
let g:vista_default_executive ='coc'
let g:vista_blink = [0,0]
let g:vista_top_level_blink = [0,0]
let g:vista_sidebar_width=60
let g:vista_executive_for = {
            \ 'javascript': 'coc',
            \ 'typescript' : 'coc',
            \ 'vue': 'coc',
            \ 'python': 'coc',
            \ 'go': 'coc',
            \ }



""" Fzf configuration
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)
