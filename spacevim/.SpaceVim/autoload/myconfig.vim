function! myconfig#before() abort
  call SpaceVim#custom#SPC('nore', ['f', 'f'], 'EditVifm', 'open file', 1)

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
  vnoremap <C-y> "*y :let @+=@*<CR>
  map <C-p> "*P

  " Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
  map Y y$

  " Current line always at the middle of the screen
  " (https://vim.fandom.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen)
  set scrolloff=1000

  " Use case insensitive search, except when using capital letters
  set ignorecase
  set smartcase

  " Disable replacement of symbols in tex files
  let g:tex_conceal = "" 

endfunction
