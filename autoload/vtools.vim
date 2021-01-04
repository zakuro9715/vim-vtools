function! vtools#write_pre() abort
  if get(g:, 'vfmt', 1)
    call vtools#fmt()
  endif
endfunction

function! vtools#fmt() abort
  let l:tmpfile = s:write_to_tmp(expand('%'), '.v')
  let l:line = line('.')
  let l:col = col('.')
  echo system('v fmt -w ' . l:tmpfile)
  execute '%!cat ' . l:tmpfile
  silent call cursor(l:line, l:col)
  silent call system('rm ' . l:tmpfile)
endfunction


function! vtools#test() abort
  let l:name = expand('%')
  if l:name =~ '_test.v$'
    let l:tmpfile = s:write_to_tmp(l:name, '_test.v')
    echo system('v test ' . l:tmpfile)
    silent call system('rm ' . l:tmpfile)
  else
    let l:test_path = fnamemodify(l:name, ':r') . '_test.v'
    if ! filereadable(l:test_path)
      let l:test_path = fnamemodify(l:name, ':h')  " fallback to dir
    endif
    echo system('v test ' . l:test_path)
  endif
endfunction

function! vtools#run() abort
  let l:tmpfile = s:write_to_tmp(expand('%'), '.v')
  echo system('v run ' . l:tmpfile)
  silent call system('rm ' . l:tmpfile)
endfunction

function! vtools#vet() abort
  let l:tmpfile = s:write_to_tmp(expand('%'), '.v')
  echo system('v vet ' . l:tmpfile)
  silent call system('rm ' . l:tmpfile)
endfunction

function! s:write_to_tmp(original, suffix)
  let l:timestamp = localtime()
  let l:tmpfile = a:original . l:timestamp . a:suffix
  silent execute 'write ' . l:tmpfile
  return l:tmpfile
endfunction

function! vtools#import(name) abort
  let l:cursor_pos = getpos('.')

  call cursor(1, 1)
  let l:line = search('import', 'n')
  if l:line
    let l:line = l:line - 1 " before first import
  endif
  if !l:line
    let l:line = search('module', 'n')
  end
  if !l:line
    echoerr 'Cannot detect line to import (module and import not found).'
    return
  end

  call setpos('.', cursor_pos)
  call append(l:line, 'import ' . a:name)

  if get(g:, 'vfmt', 1)
    call vtools#fmt()
  endif
endfunction
