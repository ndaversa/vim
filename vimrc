set shell=/bin/bash
set nocompatible
syntax enable
set encoding=utf-8
set t_BE=

set regexpengine=1
set relativenumber
set number
let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
set nocursorcolumn      " Don't paint cursor column
set lazyredraw          " Wait to redraw
set scrolljump=8        " Scroll 8 lines at a time at bottom/top
let html_no_rendering=1 " Don't render italic, bold, links in HTML


filetype off
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
" let g:solarized_termcolors=256
let g:solarized_visibility =  "high"
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
set undofile   " Maintain undo history between sessions
set undodir=~/.vim/undodir

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
" set list                          " Show invisible characters
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
  au BufNewFile,BufRead *.js set ft=javascript
  au BufNewFile,BufRead *.jst set ft=html
  au BufNewFile,BufRead *.template set ft=html
  au BufNewFile,BufRead *.recipe set ft=coffee
  au BufNewFile,BufRead *.phps set ft=php

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  au FileType php set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" provide some context when editing
set scrolloff=3


"" Mappings
let mapleader=";"

"Use hh,jj, or kk to <ESC>
inoremap hh <ESC>
inoremap jj <ESC>
inoremap kk <ESC>

"Disable <Esc> to undo muscle memory
inoremap <Esc> <CR>

"Enable repeat operation in visual mode
vnoremap . :norm.<CR>

" clear the search buffer when hitting ;return
map <silent> <leader><cr> :noh<cr>

" Remove all trailing whitespace before saving
autocmd FileType c,cpp,java,php,js,less,css,twig autocmd BufWritePre <buffer> :%s/\s\+$//e

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
nnoremap <leader>a :Ack<space>

" Ack for the last search.
nnoremap <silent> <leader>qa/ :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" toggle last buffer
nnoremap <leader><leader> <c-^>

" Paste last yanked item, even after deleting.
noremap <Leader>p "0p
noremap <Leader>P "0P

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
nnoremap <Bar> <c-w><Bar>
nnoremap = <c-w>=

" Format with JsBeautify
map <leader>j :call JsBeautify()<cr>
vnoremap <buffer>  <leader>j :call RangeJsBeautify()<cr>

"" Plugin config

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" Open the current buffer in the nerd tree
nnoremap <leader>s :NERDTreeFind<CR>
nnoremap <leader>r :NERDTreeFind<CR>

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
  \ 'ctagsargs' : '',
  \}

nnoremap <leader>l :TagbarToggle<CR>
nnoremap <leader>i :silent!coffeetags -R \| sed '/\.\/build\//d' > tags<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

"coffee compile
vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>
map <leader>c :CoffeeCompile<CR>

" Tern
nnoremap <leader>d :TernDef<CR>
nnoremap <leader>r :TernRefs<CR>

" c:number to jump coffee/js
command -nargs=1 C CoffeeCompile | :<args>
command W :w
command Vs :vs
command Wq :wq

" CtrlP
let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_dotfiles = 1 "so ctrlp won't search dotfiles/dotdirs
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_map = '<leader>f'
let g:ctrlp_regexp = 0
let g:ctrlp_user_command =
    \ ['.git', 'cd %s && git ls-files . -co --exclude-standard | grep -v "node_modules"']

" Fugitive
autocmd QuickFixCmdPost *grep* cwindow

" Ack
nnoremap <leader>g :Ggrep 

" Colorizer
let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='less'
let g:colorizer_skip_comments = 1
let g:colorizer_x11_names = 1

" JSX
let g:jsx_ext_required = 0 "allow JSX parsing in JS files

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 1

" Copy current relative file path to system clipboard
nnoremap <leader>cf :let @*=expand("%")<CR>

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
