# V tools for vim

[V](https://github.com/vlang/v") tools for Vim, including auto formatting.

## Usage

```
:w
```

## Installation

You can install with your favorite plugin manager

[dein.vim](https://github.com/Shougo/dein.vim)

```viml
dein#add('zakuro9715/vim-vtools')
```

[vim-plug](https://github.com/junegunn/vim-plug)

```viml
Plug 'zakuro9715/vim-vtools'
```

## Commands

- VFmt: v fmt buffer
- VTest: v test buffer
- VRun: v run buffer
- VVet: v vet buffer

## Configuration

```viml
" enable auto format when write. (defaut)
let g:vfmt = 1
" disable auto format.
let g:vfmt = 0
```
