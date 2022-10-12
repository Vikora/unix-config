"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

syntax enable

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

" Auto-indents for new lines
set ai
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Convert to UNIX fileformat (avoid CRLF)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set fileformat=unix
"Set every files as Unix (LF) as Windows might set CRLF wich is not working
"for unix

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug For Managing Plugins
" To install:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
"{{ Syntax Highlighting and Colors }}
    Plug 'ap/vim-css-color'                            " Color previews for CSS
call plug#end()

