" New key bindings """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable some keys in order to force work in vim-style
" :inoremap <Del> <Nop>
" :inoremap <BS> <Nop>

" Use backspace in normal mode to delete words (including character under cursor)
:nnoremap <BS> dvb

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
" nnoremap <C-e> :set relativenumber!<CR>

" nnoremap <C-#> :Vgc<CR>

" Bubble single lines
nmap <C-Up> :m .-2<CR>
nmap <C-Down> :m  .+1<CR>

" Bubble multiple lines
vnoremap <silent> <C-Up> @='"zxk"zP`[V`]'<CR>
vnoremap <silent> <C-Down> @='"zx"zp`[V`]'<CR>

" Repeat macro q until the end of file
" nnoremap <C-@> VG:norm@q<CR>

" Leader commands """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader =","

nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>q :bdelete<CR>

nnoremap <leader>cc :Commands<CR>
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr> " switch CWD to the directory of the open buffer

" nnoremap <leader>ee :edit $MYVIMRC<CR>
nnoremap <leader>ee :edit $DOTDIR/vim/.vimrc<CR>

" Insert empty lines
nnoremap <leader>j o<Esc>
nnoremap <leader>k O<Esc>j
" nnoremap <CR> O<Esc>

" Files
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fr :History<CR>

" nnoremap <leader>ll :BLines<CR>
nnoremap <leader>ll :cd %:p:h<CR>:RgCurrentFile<CR>

nnoremap <leader>o :EditVifm<CR>
" nnoremap <leader>o :Lf<CR>
" nnoremap <leader>p :wa! \| !process_file.sh "<c-r>%"<CR><CR>
nnoremap <leader>p :wa! \| :call VimuxRunCommand('process_file.sh "' . expand("%:p") . '"')<CR>

" Spell checking
" nnoremap <leader>ss :setlocal spell!<cr> " toggle and untoggle spell checking
" nnoremap <leader>sn ]s " next error
" nnoremap <leader>sp [s " previous error
" nnoremap <leader>sa zg " add word to dictionary
" nnoremap <leader>s? z= " show corrections

" Tabs
nnoremap <leader>t<leader> :tabnext<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/ " opens a new tab with the current buffer's path
nnoremap <leader>tm :tabmove<CR>

" Todo
nnoremap <leader>a dd:keeppatterns /Completed:<CR>:nohlsearch<CR>o<Esc>:r !date +\%Y-\%m-\%d-\%a-\%H:\%M\%p<CR>kJA \| <Esc>pkJ

nnoremap <leader>w :w<CR>
nnoremap <leader>r :call ToggleWrap()<CR>
nnoremap <leader>u :execute "set colorcolumn=" . (&colorcolumn == "" ? "101" : "")<CR>
nnoremap <leader>v :!open_processed_file.sh "<c-r>%"<CR><CR>

map <leader>* :execute 'BLines ' . expand("<cword>")<CR>

" Vidir
" nnoremap <leader>vi $T/i
" nnoremap <leader>vc $T/C
" nnoremap <leader>va $F.i

" Matlab """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Reset all
map <leader>ms :call VimuxRunCommand("clc; clear; close;")<CR>
map <leader>ml :call VimuxRunCommand("clc")<CR>

" Whos
map <leader>mw :call VimuxRunCommand("whos")<CR>

" Check variable under cursor
map <leader>mv :call VimuxRunCommand(expand("<cword>"))<CR>

" Call help for word under cursor
map <leader>mh :call VimuxRunCommand("help " . expand("<cword>"))<CR>

" Save all(!) files, set current file as file to run, run file
map <leader>mr :wa! \| :call VimuxSetFileToRun() \| :call VimuxSetBreakpoints() \| :call VimuxRunFile()<CR>

" Save all(!) files and run file
map <leader>mm :wa! \| :call VimuxSetBreakpoints() \| :call VimuxRunFile()<CR>

" Save file and run mlint ("inspect")
map <leader>mi :w! \| :call VimuxRunCommand("mlint " . expand("%:p"))<CR>

" Send currently selected text to Matlab
vmap <F9> "vy :call VimuxSlime()<CR>

" Set break point at current line
" map <leader>mbs :call VimuxRunCommand("dbstop in '" . expand("%:p") . "' at " . line("."))<CR>
map <leader>mbs :call VimuxSetBreakpoints()<CR>

" Clear all break points
" map <leader>mbc :call VimuxRunCommand("dbclear all")<CR>
map <leader>mbc :call VimuxClearAllBreakpoints() \| :SignatureRefresh<CR>

" dbcont
map <F5> :call VimuxRunCommand("dbcont;;")<CR>

" dbquit
" Map code to Shift-F5 (see https://vim.fandom.com/wiki/Mapping_fast_keycodes_in_terminal_Vim)
" The code can be found with the command cat.
set <S-F5>=^[[15;2~
map <S-F5> :call VimuxRunCommand("dbquit;;")<CR>
map <leader>mbq :call VimuxRunCommand("dbquit;;")<CR>

" dbstep
map <F10> :call VimuxDbStep()<CR>

" List all break points
map <leader>mbl :call VimuxRunCommand("dbstatus")<CR>

" Goto current break point
map <leader>mbb :call VimuxOpenFileAtCurrentBreakPoint()<CR>

" Open item
map <leader>mo :call VimuxRunCommand("edit " . expand("<cword>"))<CR>
" map <leader>mo :call VimuxOpenItemUnderCursor()<CR>

" Prompt for item and open it
map <leader>me :VimuxPromptCommand("edit ")<CR>
" map <leader>me :call VimuxOpenPromptedItem()<CR>

" Open file with last error
map <leader>mx :call VimuxOpenFileWithLastError()<CR>

" Open function definitions with fzf
" map <leader>mf :execute 'BLines ' . 'function'<CR>
" map <leader>mf :BLines function<CR>
" map <leader>mf :cd %:p:h<CR>:RgCurrentFile function<CR>
map <leader>mf :w<CR>:cd %:p:h<CR>:RgCurrentFile ^\s*function<CR>

" Open todo entries with fzf
" map <leader>mt :BLines Todo<CR>
map <leader>mt :w<CR>:cd %:p:h<CR>:RgCurrentFile Todo<CR>

" Goto next/previous cell
" map <Down> :keeppatterns /%%<CR>:nohlsearch<CR>^
" map <Up> :keeppatterns ?%%<CR>:nohlsearch<CR>^

" Goto next/previous function
map <Down> :keeppatterns /function<CR>:nohlsearch<CR>^zz
map <Up> :keeppatterns ?function<CR>:nohlsearch<CR>^zz

" Markdown """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>d# :w<CR>:cd %:p:h<CR>:RgCurrentFile ^\s*#<CR>

" New commands """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :W sudo saves the file (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null

" Delete trailing spaces
command! TrimWhitespace call TrimWhitespace()

" Edit vimrc
" command Edrc e $MYVIMRC

" Snippets """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Navigating with guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

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
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'vifm/vifm.vim'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'bling/vim-airline'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'benmills/vimux'
" Plug 'itchyny/lightline.vim'
Plug 'kshenoy/vim-signature'
" Plug 'ptzz/lf.vim'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'unblevable/quick-scope'
Plug 'ap/vim-css-color'
Plug 'NLKNguyen/papercolor-theme'
" Plug 'jvirtanen/vim-octave'
Plug 'easymotion/vim-easymotion'
Plug 'ajh17/VimCompletesMe'
call plug#end()

" Plugin configurations """""""""""""""""""""""""""""""""""""""""""""""""""""""

" vifm
let $MYVIFMRC="/home/philipp/.config/vifm/vifmrc_vim_plugin"
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" vim-bufferline
let g:bufferline_echo = 0

" vim-airline
" let g:airline#extensions#tabline#enabled = 1

" fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'

" vimux
let g:VimuxRunnerType = 'pane'

" vim-commentary
autocmd FileType matlab setlocal commentstring=%\ %s
autocmd FileType julia setlocal commentstring=#\ %s
" Cannot be repeated with .
" nmap gcc <Plug>CommentaryLine \| j
nmap -- <Plug>CommentaryLine<bar>j
      \:<C-U>silent! call repeat#set('--', v:count)<CR>

" vimtex
" let g:vimtex_view_general_viewer = 'evince'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

" ultisnips
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsListSnippets="<c-tab>"

" quick-scope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

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

" Auto reload .vimrc file upon save
if has ('autocmd') " Remain compatible with earlier versions
  augroup vimrc " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif

" Return to last edit position when opening files
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" User interface """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme ron_modified
" colorscheme PaperColor
" set background=light

" Vertical line
" set colorcolumn=101

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

" Change cursor in insert mode
" :autocmd InsertEnter * set cul
" :autocmd InsertLeave * set nocul

" Display line numbers on the left
set number
" set relativenumber

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

" Toggle highlighting
" https://stackoverflow.com/a/26504944
" :nnoremap <silent><expr> <space> (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

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
" source: https://stackoverflow.com/questions/5547943/display-number-of-current-buffer

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

function! VimuxSlime()
  call VimuxOpenRunner()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

function! VimuxOpenItem(item)
  let s:file = '/tmp/openiteminvim.txt'
  call VimuxRunCommand("openiteminvim('" . a:item . "', '" . s:file . "')")
  sleep 100m
  if filereadable(s:file)
    let s:lines = readfile(s:file)
    " Open file on first line
    execute 'edit' s:lines[0]
    call delete(s:file)
  endif
endfunction

function! VimuxOpenPromptedItem()
  let s:item = input('Item: ')
  call VimuxOpenItem(s:item)
endfunction

function! VimuxOpenItemUnderCursor()
  let s:item = expand("<cword>")
  call VimuxOpenItem(s:item)
endfunction

function! VimuxOpenFileWithLastError()
  let s:file = '/tmp/openfilewithlasterrorinvim.txt'
  call VimuxRunCommand("openfilewithlasterrorinvim('" . s:file . "')")
  sleep 150m
  if filereadable(s:file)
    let s:lines = readfile(s:file)
    " Open file on first line
    let s:path = s:lines[0]
    let s:line = '+' . s:lines[1]
    execute 'edit' s:line s:path
    call delete(s:file)
    normal zz
  endif
endfunction

function! VimuxOpenFileAtCurrentBreakPoint()
  let s:file = '/tmp/openfileatcurrentbreakpointinvim.txt'
  call VimuxRunCommand("openfileatcurrentbreakpointinvim('" . s:file . "')")
  sleep 150m
  if filereadable(s:file)
    let s:lines = readfile(s:file)
    " Open file on first line
    let s:path = s:lines[0]
    let s:line = '+' . s:lines[1]
    execute 'edit' s:line s:path
    call delete(s:file)
    normal zz
  endif
endfunction

function! VimuxDbStep()
  let s:file = '/tmp/dbstep.txt'
  call VimuxRunCommand("dbstep;;")
  sleep 150m
  normal ,mbb
endfunction

function! VimuxClearAllBreakpoints()
  call VimuxRunCommand("dbclear all")
  delmarks M-Q " see VimuxSetBreakpoints
  " call SignatureRefresh()
endfunction

function! VimuxSetBreakpoints()
  if &filetype=='matlab'
      call VimuxRunCommand("dbclear all")
  endif
  let marks = ["M", "N", "O", "P", "Q"]
  for mark in marks
      let pos_mark = getpos("'" . mark)
      let buffer_no = pos_mark[0]
      " let filename = getcwd() . "/" . expand(bufname(pos_mark[0]))
      " let filename = expand(bufname(pos_mark[0]))
      let filename = expand("#" . pos_mark[0] . ":p")
      let lnum = pos_mark[1]
      " echo 'mark is ' . mark
      " echo 'buffer no is ' . buffer_no
      " echo 'buffer filename is ' . filename
      " echo 'line no is ' . lnum
      if buffer_no isnot 0 && lnum isnot 0 " if a mark is set
          if &filetype=='matlab'
              call VimuxRunCommand("dbstop in '" . filename . "' at " . lnum)
          endif
      endif
  endfor
endfunction

function! VimuxSetFileToRun()
  let g:vimux_file_to_run = expand("%:p")
  let g:vimux_dir_of_file_to_run = expand("%:p:h")
endfunction

function! VimuxRunFile()
    if &filetype=='matlab'
        call VimuxRunCommand("cd(\"" . g:vimux_dir_of_file_to_run . "\"); run(\"" . g:vimux_file_to_run . "\")")
    elseif &filetype=='octave'
        call VimuxRunCommand("cd(\"" . g:vimux_dir_of_file_to_run . "\"); run(\"" . g:vimux_file_to_run . "\")")
    elseif &filetype=='julia'
        call VimuxRunCommand("cd(\"" . g:vimux_dir_of_file_to_run . "\"); include(\"" . g:vimux_file_to_run . "\")")
    endif
endfunction

" function! VimuxMatlabSetSessionForEditor
"   call VimuxRunCommand("");
" endfunction

function! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfunction
