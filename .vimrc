execute pathogen#infect()
colorscheme desert
set number
set incsearch
set nolazyredraw
set number
syntax on
set incsearch
set tabstop=4
set expandtab
set shiftwidth=4
set autoread
set wildmenu
filetype plugin on
set autoindent
set tags=./tags,tags,~/.vimtags
set wildmode=list:longest
set diffopt=filler,context:9999
set gdefault
set backspace=eol,start,indent
set nobackup
set noswapfile
set nowb
set clipboard=unnamed
set listchars=tab:>-,trail:- " show tabs and trailing
set scrolloff=10
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set laststatus=2
set switchbuf=useopen
set showfulltag
set cursorline
set nofoldenable
set hidden
set nowrap
let NERDTreeIgnore = ['\.pyc$']

" functions


" mappings
map <F4> :execute "Ack \"" . expand("<cword>") . "\"" <CR>

" syntax mappings
"motion mappings
inoremap <C-space> <Right>
inoremap <C-L> <Right><Backspace>

" Copy + PASte
map <C-c> "+y<CR>
imap <C-v> <C-r><C-o>+

" tags
:nnoremap <F3> :FufTag<CR>
set completeopt=menu,longest
set complete=.,w,b,u
let mapleader=" "
set autowrite

map <F2> :NERDTreeToggle<CR>
map <F3> :%s/<C-R><C-W>//c<Left><Left>
map <F3> :%s/\<<C-R><C-W>\>//c<Left><Left>
vmap <F3> y:%s/\<<C-R>"\>//c<Left><Left>
vmap <S-F3> y:argadd **/*.py<CR> :argdo %s/\<<C-R>"\>//c<Left><Left>
map <S-F3> :argadd **/*.py<CR> :silent argdo %s/\<<C-R><C-W>\>//cge<Left><Left><Left><Left>
vmap <S-F3> y:argadd **/*.py<CR> :silent argdo %s/\<<C-R>"\>//cge<Left><Left><Left><Left>


map <right> :bn<cr>
map <left> :bp<cr>
map <silent> <C-E> <Leader>be

" Move on Command jk
nmap <F7> :execute "Ack " . expand("<cword>") <cr>
vmap <F7> :execute "Ack " . expand("<cword>") <cr>

map <C-S> :wa<CR>
map <Leader>o <Leader>t expand("<cword>")
map <Leader>lp :lprev <CR>
map <Leader>ln :lnext <CR>
map <Leader>cp :cp <CR>
map <Leader>cn :cn <CR>
map <Leader>yf :let @*=expand("%") <CR>
map <leader>ss :setlocal spell!<cr>
map <Leader>qd : <CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
map <Leader>f :NERDTreeFind<CR>

" imap <C-H> <C-X><C-U>
vmap <C-W> i}

" diff opts
set diffopt+=iwhite
nnoremap ; :

" autocmd BufWritePost *.py
      " \ if filereadable('tags') |
      " \   call system('ctags -a '.expand('%')) |
      " \ endif
set wildignore+=*.o,*.obj,.git,*.pyc

map <F1> <Esc>


nnoremap j gj
nnoremap k gk

" always stop words on -
set iskeyword-=-

au FileType ruby set sw=2 sts=2 
