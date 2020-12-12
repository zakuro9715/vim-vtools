function! s:install()
  augroup vtools_write_pre
    au! * <buffer>
    autocmd BufWritePre <buffer> call vtools#write_pre()
  augroup END
  command! -buffer -bang -nargs=0 Fmt call vtools#fmt()
endfunction

augroup vtools_install
  au!
  autocmd FileType v call s:install()
augroup END
