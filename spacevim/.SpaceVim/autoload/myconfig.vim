function! myconfig#before() abort
  call SpaceVim#custom#SPCGroupName(['o'], '+Vifm')
  call SpaceVim#custom#SPC('nore', ['o', 'o'], 'EditVifm', 'open file', 1)
endfunction

function! myconfig#after() abort
  call SpaceVim#logger#info("bootstrap_after called")
  nnoremap <C-k> 5k
  nnoremap <C-j> 5j
  vnoremap <C-k> 5k
  vnoremap <C-j> 5j
  nnoremap <C-h> :bprevious<CR>
  nnoremap <C-l> :bnext<CR>
endfunction
