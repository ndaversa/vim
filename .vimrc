set nocompatible
syntax enable
set encoding=utf-8

runtime bundle/pathogen.vim/autoload/pathogen.vim
call pathogen#infect()
filetype plugin indent on

call togglebg#map("<F5>")

" Some view/ux related stuff
set background=dark
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 3
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=lightgreen   ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightcyan ctermbg=10
colorscheme solarized
set ruler                       " show the cursor position all the time
set number                      " show line numbers
set cursorline                  " draw a line on the same as the cursor position
set mouse=a                     " enable mouse support
set showcmd                     " display incomplete commands
set title                       " set the screen title to the currently opened file
set gcr=n:blinkon0              " stop blinking cursors
set laststatus=2                " for powerline visiblity

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden
set undofile                    " Save undo's after file closes
set undodir=~/.vim/undo         " where to save undo histories

" This sends all yanks to the system clipboard (requires building vim with
" +clipboard support)
set clipboard=unnamed

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the first column when wrap is
                                  " off and the line continues beyond the left of the screen
"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set cc=80                       " set colorcolumn 80 to visualize 80th column

set wildmenu
set wildmode=list:longest,full

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make set noexpandtab

  " Make sure all markdown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  au BufRead,BufNewFile coffee setf coffee
  au BufRead,BufNewFile Jakefile setf javascript
  au BufNewFile,BufRead *.jst set ft=html

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" provide some context when editing
set scrolloff=3


"" Mappings
let mapleader=";"

" clear the search buffer when hitting ;return
map <silent> <leader><cr> :noh<cr>

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?

" Quickfix open
nnoremap <leader>qo :copen<CR>

" Quickfix close
nnoremap <leader>qc :ccl<CR>

" Ack
nnoremap <leader>a :Ack 

" Ack for the last search.
nnoremap <silent> <leader>qa/ :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" toggle last buffer
nnoremap <leader><leader> <c-^>

" Paste last yanked item, even after deleting.
noremap <Leader>p "0p
noremap <Leader>P "0P

" goto previous buffer, then delete previous buffer (close buffer, keep split)
nmap <leader>d :b#<bar>bd#<CR>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" resize windows quickly using arrow keys
nnoremap <Right> :vertical resize +3<cr>
nnoremap <Left> :vertical resize -3<cr>
nnoremap <Up> :resize +3<cr>
nnoremap <Down> :resize -3<cr>

"" Plugin config

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" quit NERDTree after opening a file
let g:NERDTreeQuitOnOpen = 1

" CoffeeTags 
 let g:tagbar_type_coffee = {
  \ 'kinds' : [
  \   'f:functions',
  \   'o:object'
  \ ],
  \ 'kind2scope' : {
  \  'f' : 'object',
  \   'o' : 'object'
  \},
  \ 'sro' : ".",
  \ 'ctagsbin' : 'coffeetags',
  \ 'ctagsargs' : ' ',
  \}

"coffee compile
vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>
map <leader>c :CoffeeCompile<CR>

" c:number to jump coffee/js
command -nargs=1 C CoffeeCompile | :<args>

" CtrlP
let g:ctrlp_extensions = ['tag']
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_dotfiles = 0 "so ctrlp won't search dotfiles/dotdirs
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_map = '<leader>f'

" Supertab
let g:SuperTabDefaultCompletionType = "context"
