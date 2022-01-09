set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

augroup gruvbox-theme-overrides
	autocmd!
	
	autocmd ColorScheme gruvbox highlight CocErrorSign ctermbg=235 guibg=#282828 ctermfg=167 guifg=#fb4934
	autocmd ColorScheme gruvbox highlight CocInfoSign ctermbg=235 guibg=#282828 ctermfg=214 guifg=#fabd2f
	autocmd ColorScheme gruvbox highlight CocWarningSign ctermbg=235 guibg=#282828 ctermfg=208 guifg=#fe8019
	autocmd ColorScheme gruvbox highlight SignColumn guibg=#282828
	autocmd ColorScheme gruvbox highlight ExtraWhitespace ctermbg=235 guibg=#282828 ctermfg=167 guifg=#fb4934

augroup END

"Gruvbox
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark="medium"

colorscheme nord     

"Cursor line no underline on line number
hi CursorLineNr term=bold cterm=bold ctermfg=012 gui=bold

set list
set listchars=tab:\┊\ ,

if !exists('g:airline_symbols')
 let g:airline_symbols = {}
endif

let g:airline_section_z = airline#section#create(['linenr', ' : %c'])

"Airline symbols, hardcoded
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.space = "\ua0"
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ''

"Tabline, airline keeps tabs.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
