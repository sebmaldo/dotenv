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
"set listchars=tab:>-,trail:·,eol:$
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

" Resalta la línea actual
set cursorline

" Configurando el folding
set foldenable "Enable folding
set foldlevelstart=10 "Abierto por defecto nivel 10
set foldnestmax=10 "Maximo cerrado nivel 10
set foldmethod=indent "Cerrado basado en la identación

" Escape con jk
inoremap jk <esc>

" Pathogen
execute pathogen#infect()

" Javascript Syntax config
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" Solarized theme
set background=dark
colorscheme solarized8

" Change cursor shape for diferent modes

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Autocompletado.
set omnifunc=syntaxcomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS


" Para documentar con JSDoc
nmap <silent> <C-l> <Plug>(jsdoc)
let g:vimjs#casesensistive = 0
let g:vimjs#smartcomplete = 0


" Se setean las librerías utilizadas en los proyectos js.
let g:used_javascript_libs = 'react,chai,ramda,flux'

" Check sintactico
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
endfunction

autocmd FileType javascript let b:syntastic_javascript_jscs_args =
    \ get(g:, 'syntastic_javascript_jscs_args', '') .
    \ FindConfig('-c', '.jscsrc', expand('<afile>:p:h', 1))

"Autoformato.
noremap <F3> :Autoformat<CR>
