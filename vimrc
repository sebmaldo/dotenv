"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" The current buffer can be put to the background without writing to disk;
" When a background buffer becomes current again, marks and undo-history are remembered.
set hidden

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Eliminar la funcionalidad del espacio
nnoremap <Space> <Nop>
" Añadir el espacio como leader
let mapleader = " "

" Cambiar a salto de linea por salto a linea y columna
nnoremap ' `
nnoremap ` '

" Extender la funcionalidad de % para cambiar entre más cosas
runtime macros/matchit.vim

" Syntaxis prendida por defecto
syntax on

" Autocompletado de funcionalidades en modo normal
set wildmenu
set wildmode=list:longest
