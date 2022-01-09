noremap <Tab> :bnext<CR>
noremap <S-Tab> :bprevious<CR>
noremap <Leader><Tab> :bdelete!<CR>
noremap <Leader><S-Tab> :bunload<CR>

nmap <silent><C-l> :call Switch_window_right()<CR>
nmap <silent><C-h> :call Switch_window_left()<CR>
nmap <C-j> <C-w>j<C-w>_
nmap <C-k> <C-k>k<C-w>_


function Switch_window_right()
    :exe "normal \<C-w>l\<C-w>"
    if winwidth(0) < 83
        :exe "normal \:vertical resize 83\<CR>"
    endif
endfunction

function Switch_window_left()
    :exe "normal \<C-w>h\<C-w>_"
    if winwidth(0) < 83
        :exe "normal \:vertical resize 83\<CR>"
    endif
endfunction

"Coc keymaps
"Tab for shifting in autocompletion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

"Self explanitory
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nn <silent> K :call CocActionAsync('doHover')<cr>

autocmd CursorHold * silent call CocActionAsync('highlight')
let g:coc_snippet_next = '<tab>'

nmap <silent> <C-p> :Files<CR>

"Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"Vista keymap
nmap <Leader>v :Vista!!<CR>
nmap <Leader>f :Lex<CR>

"Toggle lopen keymap
nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
