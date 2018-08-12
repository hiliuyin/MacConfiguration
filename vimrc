set nocompatible "be iMproved, required
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'Valloric/YouCompleteMe'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'

Plugin 'taglist.vim'
Plugin 'Mark'
Plugin 'a.vim'
Plugin 'ShowTrailingWhitespace'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


"au GUIEnter * simalt ~x     " Make Vim to start with a maximized window

set transparency=2

set guioptions-=T

"if (has("gui_running"))
if (has("gui_macvim"))
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 10  " List of fonts which will be used for the GUI version of Vim
endif

call pathogen#infect()
call pathogen#helptags()

syntax on                   " Switch syntax highlighting on according to the current value of the 'filetype' option

colorscheme molokai         " set colorscheme

set autochdir               " Change the current working directory whenever I open a file, switch buffers, delete a buffer or open/close a window

set nobackup                " Never make a backup before overwriting a file

set showtabline=1           " Display the line with tab page labels only if there are at least two tab pages
set nu                      " Precede each line with its line number
set ch=2                    " The number of screen lines to use for the command-line is 2
set ruler                   " Show the line and column number of the cursor position

"set tabstop=4              " Number of spces that a <Tab> in the file counts for
set softtabstop=4           " Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
set expandtab               " In Insert mode: Use the appropriate number of spaces to insert a <Tab>

"set autoindent             " Comment the line because filetype indent is on
set shiftwidth=4            " Number of spaces to use for each step of (auto)indent

set hlsearch                " When there is a previous search pattern, highlight all its matches
set backspace=2             " Same as ":Set backspace=indent,eol,start (Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode
set showmatch               " When a bracket is inserted, briefly jump to the matching one

if version > 603
    set helplang=cn         " The first language for which the desired help can be found
endi

" 让文本文件也有高亮，thanks to xbeta@smth
augroup filetypedetect
au BufNewFile,BufRead *.* setf ztxt
augroup END

" 缓冲区写入文件的时候自动检查文件类型
au FileWritePost * filet detect

" 设定文件编码类型，彻底解决中文编码问题
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936   " List of character encodings considered when starting to edit an existing file

"strip all trailing whitespace in the current file
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>

" Plugin settings
" NERDTree
nnoremap <silent> <F5> :NERDTree<CR>

" Taglist
nnoremap <silent> <F8> :Tlist<CR>
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow = 1

" WinManager
" nnoremap <silent> <F4> :WMToggle<CR>

" Sketch
" nnoremap <silent> <F1> :call ToggleSketch()<CR>

" WordComplete
" au VimEnter * call DoWordComplete()
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
if has("cscope") && filereadable("/usr/local/bin/cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree setting defaults to work around http://github.com/scrooloose/nerdtree/issues/489
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"
