function! myconfig#before() abort
  call SpaceVim#custom#SPCGroupName(['o'], '+Vifm')
  call SpaceVim#custom#SPC('nore', ['o', 'o'], 'EditVifm', 'open file', 1)

  " Set black background (from https://vim.fandom.com/wiki/Override_Colors_in_a_Color_Scheme)
  augroup vimrc
      autocmd!
      autocmd ColorScheme * highlight Normal guibg=#111111
  augroup END

endfunction

function! myconfig#after() abort
  call SpaceVim#logger#info("bootstrap_after called")

  " Move faster
  nnoremap <C-k> 5k
  nnoremap <C-j> 5j
  vnoremap <C-k> 5k
  vnoremap <C-j> 5j

  " Change buffers
  nnoremap <C-h> :bprevious<CR>
  nnoremap <C-l> :bnext<CR>

  " Clipboard
  vnoremap <C-y> "*y :let @+=@*<CR>
  map <C-p> "*P

  " Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
  map Y y$

endfunction
