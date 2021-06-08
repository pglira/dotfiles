function! myfunctions#VimuxSetFileToRun()
  let g:vimux_file_to_run = expand("%:p")
  let g:vimux_dir_of_file_to_run = expand("%:p:h")
  echomsg "File set to \"" . g:vimux_file_to_run . "\""
endfunction

function! myfunctions#VimuxSaveAllAndRunFile()
  if !exists("g:vimux_dir_of_file_to_run") || !exists("g:vimux_file_to_run")
    echomsg "Set file first!"
    return
  endif
  execute "wall!"
  if &filetype=='matlab'
    call VimuxRunCommand("cd(\"" . g:vimux_dir_of_file_to_run . "\");
        \ run(\"" . g:vimux_file_to_run . "\")")
  elseif &filetype=='octave'
    call VimuxRunCommand("cd(\"" . g:vimux_dir_of_file_to_run . "\");
        \ run(\"" . g:vimux_file_to_run . "\")")
  elseif &filetype=='julia'
    call VimuxRunCommand("cd(\"" . g:vimux_dir_of_file_to_run . "\");
        \ include(\"" . g:vimux_file_to_run . "\")")
  endif
endfunction

function! myfunctions#VimuxSlime()
  " Save selection to register v
  normal! gv"vy
  call VimuxOpenRunner()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction
