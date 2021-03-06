"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                preamble                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

let $LANG = 'en'      "set message language
set langmenu=en       "set menu's language of gvim
set encoding=utf-8

" Needed for vundle, will be turned on after vundle inits
filetype off

" Setup vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Vundle configuration                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These need to come before the configuration options for the plugins since
" vundle will add the plugin folders to the runtimepath only after it has seen
" the plugin's Plugin command.

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'kelvingao/kelvin-colorscheme'
Plugin 'gerw/vim-HiLinkTrace'
Plugin 'wincent/Command-T'
Plugin 'godlygeek/tabular'
Plugin 'tomtom/tcomment_vim'
Plugin 'Valloric/ListToggle'
Plugin 'majutsushi/tagbar'
Plugin 'Rykka/colorv.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        turn on filetype plugins                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call vundle#end()
" Enable detection, plugins and indenting in one step
" This needs to come AFTER the Plugin commands!
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            General settings                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme kelvin   " sets the colorscheme
set background=light " enable for light terminals
set t_Co=256         " enable 256 color terminals
set laststatus=2     " the statusline is now always shown
set number           " enable line numbers
set noshowmode       " no show mode in status bar (insert/replace/...)
set showcmd          " show typed command in status bar
set ruler            " show cursor position in status bar
set cursorline       " highlights the current line
set hlsearch         " highlights the search word

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

set tabstop=4    " number of spaces a tab counts for
set shiftwidth=4 " spaces for autoindents

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                ListToggle                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lt_location_list_toggle_map = '<leader>L'
let g:lt_quickfix_list_toggle_map = '<leader>q'

let g:lt_height = 10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Airline                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1

" symbols does not diaplsy correctly in win7
if has("win32")
else
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.branch = '⎇'
  ""let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  ""let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
endif

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            custom mappings                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" our <leader> will be the comma key
let mapleader=","

" with this, we can now type "jk" to exit out of insert mode
" if we really wanted to type "jk" then just type one char, wait half a sec,
" type another
inoremap jk <Esc>
vnoremap jk <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                tagbar                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tagbar_left = 1
let g:tagbar_sort = 0
if has("gui_macvim")
  let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
endif

nnoremap <F4> :TagbarToggle<cr><c-w>=
