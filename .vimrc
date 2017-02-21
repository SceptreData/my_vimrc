" Set vim default shell to bash
set shell=/bin/sh

" Plugins
" Managed by Vim-Plug
call plug#begin('~/.vim/bundle/')

    "CSApprox for Color themes.
    Plug 'godlygeek/csapprox/'

    " vim-airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    "   Load NERDTree after first call of Toggle.
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

    " Rainbow Parentheses
    Plug 'luochen1990/rainbow'

    " TComment, Comment helper plugin
    Plug 'tomtom/tcomment_vim'

    " vim-surround - Tim Pope
    Plug 'tpope/vim-surround'

    " Syntastic
    Plug 'vim-syntastic/syntastic'

    " vim-easy-align
    Plug 'junegunn/vim-easy-align'

    " vim-indent-guide
    Plug 'nathanaelkane/vim-indent-guides'

    " CtrlP - Fuzzy File Finder
    Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" Plugin Configuration
    "Rainbow Parentheses Options
    let g:rainbow_active = 1

    "CSApprox options
    let g:CSApprox_attr_map = {'bold' : 'bold', 'italic': '', 'sp' : '' }

    " Airline Options
    set laststatus=2
    let g:airline_theme='distinguished'

    " Indent Guide options
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1

    " Syntastic Stuff.
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0 
    let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" My vim cfg preferences.
    syntax on          " Syntax Highlighting
    se mouse+=a        " Mouse support
    set number         " Show line numbers
    set relativenumber " Make line numbers relative.
    set linebreak      " break up long lines (only used for .txt)
    set cursorline     " Highlight current line

    " Tab/Indentation settings
    set ts=4 sw=4
    set expandtab
    set smarttab
    set smartindent

    " Window Split settings
    set splitright
    set splitbelow

    set showmatch      " Highlight matching Parentheses

    " Search settings
    set incsearch
    set hlsearch

    " Replace Error Beeps with visual.
    set visualbell
    
    " Automatically change working directory
    set autochdir

" Color options
    set t_Co=256
    colorscheme slate

    :highlight Comment guifg=green
    :highlight Comment ctermfg=green

    :hi Pmenu ctermfg=0 ctermbg=6 guibg=#444444
    :hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff

" Filetype Speciic Options
    au BufRead,BufNewFile *.txt setlocal textwidth=79
    au BufRead,BufNewFile *.lua setlocal ts=2 sw=2
    au BufRead,BufNewFile *.js setlocal ts=2 sw=2

" fold options
    set foldmethod=indent
    set foldnestmax=10
    set nofoldenable
    set foldlevel=1

" Custom Functions

    " Toggle Relative/Absolute line numbers.
    function! g:ToggleNuMode()
      if(&relativenumber == 1)
        set norelativenumber
      else
        set relativenumber
      endif
    endfunc

" Keybinds
    let mapleader=","
    nmap j gj
    nmap k gk

    " Toggle relative/absolute line nums
    nnoremap <leader>N :call g:ToggleNuMode()<CR>

    " CtrlP Keys
    let g:ctrlp_map='<c-p>'
    let g:ctrlp_cmd='CtrlP'

    " Syntastic Keys
    nnoremap <leader>C :SyntasticToggleMode<CR>
    nnoremap <leader>c :SyntasticCheck<CR> 
    
    "Easy Align Options
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
