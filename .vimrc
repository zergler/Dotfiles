"-------------------------------------------------------------------------------
" File:		    ~/.vimrc
" Authors:	    Igor Janjic
" Description:	Configuration file for vim.
""------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" NeoBundle
""

if has('vim_starting')
    set nocompatible
    set runtimepath+=/home/iggz/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('/home/iggz/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/NERDtree'
NeoBundle 'bling/vim-airline'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'vim-scripts/CycleColor'

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

call neobundle#end()

set nocompatible
filetype plugin on

" If there are uninstalled bundles found on startup, this will conveniently
" prompt you to install them.
NeoBundleCheck

"-------------------------------------------------------------------------------
" YouCompleteMe
""
"let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

"-------------------------------------------------------------------------------
" Airline
""

let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts   = 1
let g:airline_theme             = 'wombat'

"-------------------------------------------------------------------------------
" Syntastic Options
""

hi SignColumn ctermbg=None
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_checkers=['gcc']
let g:syntastic_c_checkers=['make','splint']
let g:syntastic_tex_checkers=['chktex']

let g:syntastic_cpp_include_dirs=['/opt/cuda/include']

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args = "--ignore=E501,E221,E222,E226,E241 --max-complexity 10"

" Toggle syntastic with <C-S>.
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

"-------------------------------------------------------------------------------
" Switch Between Source and Header for C/C++ Easily
""

" :e %<.c

"-------------------------------------------------------------------------------
" IDE-Like
""

" Enable exrc to force vim to source .vimrc file in the current directory (for
" coding projects).
set exrc
set secure

"-------------------------------------------------------------------------------
" Misc. Options
""

autocmd BufRead,BufNewFile *.launch setfiletype roslaunch

colorscheme molokai
hi Normal  ctermfg=252 ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none
hi LineNr term=bold ctermfg=LightGreen
hi colorcolumn ctermbg=235

" Toggle the undo graph with <F5>.
nnoremap <F5> :GundoToggle<CR>
nmap <F7> :TagbarToggle<CR>
