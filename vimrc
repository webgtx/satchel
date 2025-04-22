" Copyright 2024 Alex Zolotarov, all right reserved.
" https://alex.zolotarov.me
" alex@zolotarov.email

colorscheme one
set background=dark
" hi Normal ctermbg=NONE

set autoindent
set expandtab shiftwidth=4 tabstop=4
set number numberwidth=2
set rnu
" set list
" set listchars=tab:··,trail:-,extends:>,precedes:<,nbsp:+
set noswapfile

iabbrev @@ alex@zolotarov.email
iabbrev pweb https://alex.zolotarov.me
iabbrev ccopy Copyright 2024 Alex Zolotarov, all right reserved.

" |----------|
" | MAPPINGS |
" |----------|
"      ||
"      VV
"

let mapleader = " "

inoremap <esc> <nop>
inoremap jk <esc>l

" [ Buffer Actions ]
nnoremap <leader>b :Buffers<cr>

" [ NerdTree ]"
" nnoremap <leader><tab> :Explore<cr><C-w>40<<cr>
nnoremap <leader><tab>  :NERDTreeToggle<cr>
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

" [ Tab Completion ]
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
noremap <silent> <leader>d :call completor#do('doc')<CR>

let g:completor_filetype_map = {'go':   {'ft': 'lsp', 'cmd': 'gopls'}} 

" [ Closing brackets ]
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" [ Impoved Motions ]
nnoremap H 0
nnoremap L A<esc>

" [ Move Lines ]
nnoremap _ ddkkp
noremap - ddp
inoremap <c-d> <esc>ddi

" [ Copy Selected Area ]
vnoremap <leader>c :!wl-copy<cr>u

" [ Vim Manipulations ]
nnoremap <leader>sv :source $MYVIMRC<cr>
noremap <leader>ev :vsplit $MYVIMRC<cr>

" [ Quick Uppercase ]
inoremap <c-u> <esc>lviwUi
nnoremap <c-u> <esc>viwUi

" [ Wrap in quotes ]
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>el
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>el
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>

" [ Operator-Pending mapping ] 
onoremap p i(
onoremap b /return<cr>

" [ Block Possible Non-Breaking Space ]
imap <M-Space> <Space>

" |-------------|
" | AUTOCOMMAND |
" |-------------|
"       |||
"       VVV
"        V

augroup filetype_html
    autocmd!
    autocmd FileType html setlocal nowrap
    autocmd FileType html normal gg=G
augroup END

augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <buffer> <leader>c I# <esc>h
    autocmd FileType python iabbrev <buffer> sswitchcase match value:<cr><tab>case pattern:
    autocmd FileType python iabbrev <buffer> oopen with open(filename, "r") as f:<cr><tab>
augroup END

augroup filetype_go
    autocmd!
    autocmd FileType go nnoremap <buffer> <leader>l :GoLint<cr>
    autocmd FileType go nnoremap <buffer> <leader>r :GoRun<cr>
augroup END

let g:completor_complete_options = 'menuone,noselect'
