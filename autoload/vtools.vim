function! vtools#write_pre() abort
  if get(g:, 'vfmt', 1)
    call vtools#fmt()
  endif
endfunction

function! vtools#fmt() abort
  let l:tmpfile = s:write_to_tmp_v(expand('%'))
  let l:line = line('.')
  let l:col = col('.')
  call system('v fmt -w ' . l:tmpfile)
  execute '%!cat ' . l:tmpfile
  silent call cursor(l:line, l:col)
  silent call system('rm ' . l:tmpfile)
endfunction

function! vtools#test() abort
  execute '!v test %'
endfunction

function! vtools#run() abort
  execute '!v run %'
endfunction

function! vtools#vet() abort
  execute '!v vet %'
endfunction

function! s:write_to_tmp_v(original)
  let l:timestamp = localtime()
  let l:tmpfile = a:original . l:timestamp . '.v'
  silent execute 'write ' . l:tmpfile
  return l:tmpfile
endfunction
