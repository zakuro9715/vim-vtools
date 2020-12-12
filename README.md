<div align="center">
    <p>
        <img width="80" src="https://raw.githubusercontent.com/donnisnoni95/v-logo/master/dist/v-logo.svg?sanitize=true">
    </p>
    <h1>V language tools for vim</h1>
    <p>
        <a href="https://github.com/vlang/v">v language</a> tools for vim
    </p>
</div>

## Features

- Auto format

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

- VFmt: v fmt
- VTest: v test
- VRun: v run
- VVet: v vet

## Configuration

```viml
" enable auto format when write. (defaut)
let g:vfmt = 1
" disable auto format.
let g:vfmt = 0
```
