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
set smartindent
set makeprg=msbuild\ /property:GenerateFullPaths=true\ /nologo\ /v:q\ c:\dev\svn\$*
set tags=./tags,tags
set errorformat=\ %#%f(%l\\\,%c):\ %m
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
set dir=c:\\temp
set hidden
let g:fuf_ignoreCase = 0

" functions


function! SmartTag(searchstring)
   let search = "\\C\\."
   for c in split(a:searchstring, '\zs')
       let search = search . c . "[a-z]*"
   endfor
   let search = search . "$"
   let results = taglist(search)
   for result in results
       if result["kind"] == "c"
           execute "tag " .result['name']
           return
       endif
   endfor
endfunction

function! CreateTagSyntax()
   let output = []
   let results = taglist(".*")
   for result in results
       if result["kind"] == "c" || result["kind"] == "i" || result["kind"] == "g"
           call add(output, "syntax keyword Class " . result["name"])
       elseif result["kind"] == "m"
           call add(output, "syntax keyword Function " . result["name"])
       elseif result["kind"] == "p"
          call add(output, "syntax keyword Identifier " . result["name"])
       endif
   endfor
   echo output[0]
   call writefile (output, "/Users/Admin/.vim_keywords", "b")
endfunction

" commands
command! -nargs=1 ExtractVariable call ExtractVariable("<args>")
command! ExtractFile call ExtractFile()
command! -nargs=1 SmartTag call SmartTag("<args>")
command! Retag !ctags -R --c++-kinds=+px .

" mappings
map <F4> :execute "Ack \"" . expand("<cword>") . "\"" <CR>
nmap <F8> :wa \| make <Up>
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|swp|class)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'

" syntax mappings
"motion mappings
inoremap <C-space> <Right>
inoremap <C-L> <Right><Backspace>

" Copy + PASte
map <C-c> "+y<CR>
imap <C-v> <C-r><C-o>+

" tags
:map <F11> :call CreateTagSyntax()<CR><F12>
:map <F12>  :so /Users/Admin/.vim_keywords<CR>
:nnoremap <F3> :FufTag<CR>
set completeopt=menu,longest
set complete=.,w,b,u
let mapleader=" "
set autowrite

map <F2> :NERDTreeToggle<CR>

nnoremap <silent> <F9> :TlistToggle<CR>

map <right> :bn<cr>
map <left> :bp<cr>
map <C-E> <Leader>be

" Move on Command jk
nmap <down> mz:m+<cr>`z
nmap <up> mz:m-2<cr>`z
vmap <down> :m'>+<cr>`<my`>mzgv`yo`z
vmap <up> :m'<-2<cr>`>my`<mzgv`yo`z
nmap <F7> :execute "Ack " . expand("<cword>") <cr>
vmap <F7> :execute "Ack " . expand("<cword>") <cr>



" Supertab settings
" supertab + eclim == java win
" let g:SuperTabDefaultCompletionTypeDiscovery = [
" \ "&completefunc:<c-x><c-u>",
" \ ]
"&omnifunc:<c-x><c-o>",
" let g:SuperTabLongestHighlight = 1
" let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
" call SuperTabSetDefaultCompletionType("<c-x><c-u>")


" Eclim settings
" ,i imports whatever is needed for current line
nnoremap <silent> <leader>i :JavaImport<cr>
" ,d opens javadoc for statement in browser
nnoremap <silent> <leader>d :JavaDocSearch -x declarations<cr>
" ,<enter> searches context for statement
nnoremap <silent> <leader><cr> :JavaSearchContext<cr>
" ,jv validates current java file
nnoremap <silent> <leader>jv :Validate<cr>
" ,jc shows corrections for the current line of java
nnoremap <silent> <leader>jc :JavaCorrect<cr>
" ,s saves
nnoremap <silent> <leader>s :w<cr>
" 'open' on OSX will open the url in the default browser without issue
let g:EclimBrowser='open'

nnoremap <silent> <leader>pd :pc<CR>

map <Leader>f :FufFile **/<CR>
map <Leader>t :FufTag <CR>
map <leader>tn :tabnew<cr>
map <Leader>lp :lprev <CR>
map <Leader>ln :lnext <CR>
map <Leader>cp :cp <CR>
map <Leader>cn :cn <CR>
map <Leader>yf :let @*=expand("%") <CR>

map <leader>ss :setlocal spell!<cr>
map <Leader>qd : <CR>
au BufNewFile,BufRead *.java vmap <leader>c :normal 0i//<cr>
au BufNewFile,BufRead *.java vmap <leader>uc :normal 0xx<cr>
nnoremap <silent> <leader>p :YRShow<CR>

imap <C-H> <C-X><C-U>
vmap <C-W> i}

" diff opts
set diffopt+=iwhite
nnoremap ; :
" Quickly edit/reload the vimrc file
"
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
