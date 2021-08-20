" New key bindings """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Move faster
nnoremap <C-k> 5k
nnoremap <C-j> 5j
vnoremap <C-k> 5k
vnoremap <C-j> 5j

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
map Y y$

" Copy and paste between vim and other applications
vnoremap <C-y> "*y :let @+=@*<CR>
map <C-p> "*P

nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>

" Enable/disable relative line numbers
nnoremap <C-e> :set relativenumber!<CR>

" Bubble single lines
nmap <C-Up> :m .-2<CR>
nmap <C-Down> :m  .+1<CR>

" Bubble multiple lines
vnoremap <silent> <C-Up> @='"zxk"zP`[V`]'<CR>
vnoremap <silent> <C-Down> @='"zx"zp`[V`]'<CR>

" Repeat macro q until the end of file
nnoremap <C-@> VG:norm@q<CR>

" New commands """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing spaces
command! TrimWhitespace call TrimWhitespace()

" Plugins """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install vim-plug
if ! filereadable(expand('~/.vim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.vim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.vim/autoload/plug.vim
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
call plug#end()

" Plugin configurations """""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","

" easymotion
let g:EasyMotion_do_mapping = 0 " disable default mappings
let g:EasyMotion_smartcase = 1 " turn on case-insensitive feature
nmap <leader>s <Plug>(easymotion-overwin-f)
" Note: s corresponds to cl
" nmap ss <Plug>(easymotion-overwin-f)
" nmap sj <Plug>(easymotion-j)
" nmap sk <Plug>(easymotion-k)
" nmap sl <Plug>(easymotion-lineforward)
" nmap sh <Plug>(easymotion-linebackward)

" General """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Lines of history to remember
set history=500

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Set to auto read when a file is changed from the outside
set autoread

" Toggle between 'paste' and 'nopaste'
set pastetoggle=<F3>
" Shows paste mode in insert mode
set showmode

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Don't write backup files
set nobackup
set nowritebackup
set noswapfile

" Indentation settings for using 4 spaces instead of tabs
set shiftwidth=4
set softtabstop=4
set expandtab

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Enable syntax highlighting
syntax on

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Increase speed of macro replay
set lazyredraw

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

set hidden

" Save only latest 20 files in .viminfo
set viminfo='20

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" User interface """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colors molokai
hi Visual cterm=none ctermbg=33

" Vertical line
set colorcolumn=101

" Highlight current line
set cursorline
hi CursorLine cterm=none ctermbg=238

" Always show n lines before or after the cursor when moving with j/k
set so=5

" Show file options above the command line
set wildmenu
set wildmode=longest,list,full

" Show ruler on the right side of the status bar
set ruler

" Set the command window height to 2 lines, to avoid many cases of having to
" 'press <Enter> to continue'
set cmdheight=2

" Display extra whitespace at the end of the line
set list listchars=tab:»·,trail:·,nbsp:·

" Display line numbers on the left
set number
set relativenumber

" Splits open at the bottom and right
set splitbelow splitright

" Always display the status line, even if only one window is displayed
set laststatus=2

" Enable use of the mouse for all modes
set mouse=a

" Show partial commands in the last line of the screen
set showcmd

" Current line always at the middle of the screen
" https://vim.fandom.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen
set scrolloff=1000

" Search settings """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Highlight searches
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" Disable highlighting
nnoremap <space> :nohlsearch<CR>

" Center match on screen
noremap n nzz
nnoremap N Nzz

" Don't continue at top/bottom on end/beginning of file
" set nowrapscan

" Visual mode related """""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" No line wrapping
set nowrap
set textwidth=0 wrapmargin=0

" Status line """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" source: https://stackoverflow.com/questions/5547943/display-number-of-current-buffer
set laststatus=2                             " always show statusbar
set statusline=
set statusline+=[%-.3n]\                     " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

" Change color of status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=6 ctermbg=0
  au InsertLeave * hi StatusLine ctermfg=237 ctermbg=15
endif

" Default color
hi statusline ctermfg=237 ctermbg=15

" Functions """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

function! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap k
    silent! nunmap j
    silent! nunmap 0
    silent! nunmap $
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap <silent> k gk
    noremap <silent> j gj
    noremap <silent> 0 g0
    noremap <silent> $ g$
  endif
endfunction

function! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfunction
