function! myconfig#before() abort

  " Open file with vifm
  call SpaceVim#custom#SPC('nore', ['f', 'f'], 'EditVifm', 'Open file', 1)

  " Vimux
  call SpaceVim#custom#SPCGroupName(['v'], '+Vimux')
  call SpaceVim#custom#SPC('nore', ['v', 's'], 'call myfunctions#VimuxSetFileToRun()', 
        \'Set file to run', 1)
  call SpaceVim#custom#SPC('nore', ['v', 'v'], 'call myfunctions#VimuxSaveAllAndRunFile()', 
        \'Save all and run file', 1)
  call SpaceVim#custom#SPC('nore', ['v', 't'], 'call myfunctions#VimuxSlime()', 
        \'Run selected text', 1)

  " Help
  call SpaceVim#custom#SPC('nore', ['h', 'h'], 'vertical botright help', 'Open VIM help file', 1)

  " Set black background (from https://vim.fandom.com/wiki/Override_Colors_in_a_Color_Scheme)
  autocmd ColorScheme * highlight Normal guibg=#111111 | highlight Terminal guibg=#111111

endfunction

function! myconfig#after() abort
  call SpaceVim#logger#info("bootstrap_after called")

  " Move faster
  nnoremap <C-k> 5k
  nnoremap <C-j> 5j
  vnoremap <C-k> 5k
  vnoremap <C-j> 5j

  " Useful if soft wrap of lines is on
  noremap <silent> k gk
  noremap <silent> j gj
  noremap <silent> 0 g0
  noremap <silent> $ g$

  " Change buffers
  nnoremap <silent> <C-h> :bprevious<CR>
  nnoremap <silent> <C-l> :bnext<CR>

  " Copy filepath to clipboard
  nnoremap <F9> :call SpaceVim#util#CopyToClipboard()<CR>

  " Clipboard
  vnoremap <silent> <C-y> "*y :let @+=@*<CR>
  map <C-p> "*P

  " Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
  map Y y$

  " Current line always at the middle of the screen
  " (https://vim.fandom.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen)
  set scrolloff=1000

  " Use case insensitive search, except when using capital letters
  set ignorecase
  set smartcase

  " Latex
  let g:tex_conceal = "" 

  " Julia
  autocmd FileType julia setlocal shiftwidth=4 softtabstop=4 expandtab

  " Matlab
  autocmd FileType matlab setlocal shiftwidth=4 softtabstop=4 expandtab

endfunction
