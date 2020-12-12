function! s:install()
  augroup vtools_write_pre
    au! * <buffer>
    autocmd BufWritePre <buffer> call vtools#write_pre()
  augroup END
  command! -buffer -bang -nargs=0 VFmt call vtools#fmt()
  command! -buffer -bang -nargs=0 VTest call vtools#test()
endfunction

augroup vtools_install
  au!
  autocmd FileType vlang call s:install()
augroup END
