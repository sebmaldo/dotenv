"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" The current buffer can be put to the background without writing to disk
" When a background buffer becomes current again, marks and undo-history 
" are remembered.
set hidden

" Enable filetype plugins
filetype on
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

" Mirar el número de línea en vim
set number

" Que te quede siempre el cursor al medio
set so=3

" Poner el titulo del terminal
set title

" Busquedas inteligentes ignorando mayusculas y minusculas si no se ponen
" mayusculas
set ignorecase
set smartcase

" Centralizado de archivos temporales de vim
if !isdirectory('~/.vim-tmp')
  call mkdir('~/.vim-tmp', 'p')
endif
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Ver al fondo de vim la línea y columna
set ruler

" Aumentar el movimiento del view port
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Intuitive backspacing in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw

" The following will make tabs and trailing spaces visible when requested
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Sin Campaña!!
set visualbell

" Keep backup if file is overwritten
set backup

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1

" Height of the command bar
set cmdheight=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
