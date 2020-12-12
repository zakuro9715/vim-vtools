function! s:install()
  command! -buffer -bang -nargs=0 Fmt call vtools#fmt()
endfunction

augroup vtools_install
  au!
  autocmd FileType v call s:install()
augroup END
