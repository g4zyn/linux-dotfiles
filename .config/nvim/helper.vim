"Auto selection of snippets
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let s:code_actions = []

func! ActionMenuCodeActions() abort
  if coc#util#has_float()
    call coc#util#float_hide()
  endif

  let s:code_actions = CocAction('codeActions')
  let l:menu_items = map(copy(s:code_actions), { index, item -> item['title'] })
  call actionmenu#open(l:menu_items, 'ActionMenuCodeActionsCallback')
endfunc

func! ActionMenuCodeActionsCallback(index, item) abort
  if a:index >= 0
    let l:selected_code_action = s:code_actions[a:index]
    let l:response = CocAction('doCodeAction', l:selected_code_action)
  endif
endfunc

nnoremap <silent> <Leader>1 :call ActionMenuCodeActions()<CR>

let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_space_tab_error = 0

let g:go_fillstruct_mode = 'gopls'
let g:go_rename_command = "gopls"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_gopls_use_placeholders= 1
let g:go_gopls_temp_modfile = 0
let g:go_fmt_command = "golines"
let g:go_template_use_pkg = 1
let g:go_fmt_options = {
    \ 'golines': '-m 100',
    \ }

let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1

let g:go_decls_mode="fzf"

autocmd Filetype go setlocal colorcolumn=100 textwidth=100

"autocmd BufWritePre *.go :call CocActionAsync("format")
autocmd BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl
autocmd BufRead,BufNewFile *.gotext set filetype=gotexttmpl

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :GoDebugBreakpoint<CR>

autocmd Filetype go nmap <leader>r <Plug>(go-run)

autocmd Filetype go nmap <leader>o <Plug>(go-imports)

autocmd Filetype go nmap <leader>a :GoAlternate<CR>

autocmd Filetype go nmap <leader>c :GoCoverageToggle<CR>

autocmd Filetype go nmap <C-g> :Vista finder<CR>

autocmd Filetype go nmap <leader>t :GoTest<CR>

autocmd Filetype go imap <C-f> <ESC>:GoFillStruct<CR>
