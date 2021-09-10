" Gotta be first
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'sjl/badwolf'
Plugin 'jacoborus/tender'
Plugin 'whatyouhide/vim-gotham'
"Plugin 'chriskempson/tomorrow-theme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'flazz/vim-colorschemes'

" ----- Vim as a programmer's text editor -----------------------------
"Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic' "checking syntax
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'duff/vim-trailing-whitespace'
Plugin 'jalvesaq/Nvim-R' "vim IDE for R


if has('gui_running') && has('python3')
    Plugin 'Valloric/YouCompleteMe' "Code completion for macvim only
endif


" Snippets
if has('python3')
    Plugin 'SirVer/ultisnips' " Track the engine.
    Plugin 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them. To edit/customize snippets, open a tex file and type :UltiSnipsEdit
endif

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
"Plugin 'Raimondi/delimitMate'
Plugin 'jiangmiao/auto-pairs'
Plugin 'bling/vim-bufferline'

" ----- Latex features ------------------------------------------------
if  has('clientserver')
        Plugin 'lervag/vimtex'
endif

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set encoding=utf-8

" --- line number ---
set ruler
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set showcmd
set incsearch
set hlsearch

"split
set splitright
"set splitbelow

set mouse+=a

" Silent!
set belloff=all

" Setup tabs
"set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
set cindent

"au BufNewFile,BufRead *.py
au Filetype python set
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    \ set fileformat=unix


"set nobackup
"set noswapfile
" Uncomment the next lines to set up the backup/swap on vim

set backup
if !has('win32')
    set backupdir=$TMPDIR//
    set dir=$TMPDIR//
else
    set backupdir=$TEMP,$TMP
    set dir=$TEMP,$TMP
endif
set writebackup
set cursorline      " highlight current line"
set wildmenu        " visual autocomplete for command menu"
set lazyredraw      " redraw only when we need to"

set autochdir       " Set working directory to the current file

"=== folding ===
"Uncomment the following lines for folding
set foldmethod=syntax   " fold based on indent level
set foldnestmax=10      " max 10 depth
set nofoldenable          " don't fold files by default on open
nnoremap <space><space> za
set foldlevel=2
set foldlevelstart=10   " start with fold level of 1

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn


" clipboard setting:  yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

if has("gui_running")
    set columns=164 fuoptions=maxvert
endif

"====file is large from 1GB ====
let g:LargeFile = 1024 * 1024 * 100
augroup LargeFile
    autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
" no syntax highlighting etc
    set eventignore+=FileType
" save memory when other file is viewed
    setlocal bufhidden=unload
" is read-only (write with :w new_filename)
    setlocal buftype=nowrite
" no undo possible
    setlocal undolevels=-1
" display message
    autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Uncomment the next line if your terminal is not configured for
" solarize/gruvbox
syntax enable
colorscheme solarized
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_visibility='high'
let g:solarized_termtrans = 1 "to keep MacOS terminal display color correctly
let macvim_skip_colorscheme=1
" Uncomment the next lines if use gruvbox
"let g:gruvbox_termcolors=256

" Uncomment this if you want to use molokai scheme
let g:molokai_original = 1
let g:rehash256 = 1

" Set the colorscheme
"colorscheme gruvbox "gotham256
"colorscheme molokai



" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2
set guifont=Menlo\ for\ Powerline:h11

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" Use the solarized theme for the Airline status bar
let g:airline_theme= 'jellybeans'
"let g:airline_theme= 'solarized'
"let g:airline_solarized_bg='dark'

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
"nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
"nnoremap <leader>ff :NERDTreeFocusToggle<CR>
"" To have NERDTree always open on startup
"let g:nerdtree_tabs_open_on_console_startup = 0
"let g:nerdtree_tabs_open_on_gui_startup = 0
"let g:nerdtree_tabs_smart_startup_focus = 2 "Always focus on file window after startup
"let g:NERDTreeChDirMode=2 "follow NERDTree's current directory

" ----- netrw with NERDtree-like setup
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possiblie
"autocmd BufEnter * nested :call tagbar#autoopen(0)


" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


" ----- Raimondi/delimitMate settings -----
"let delimitMate_expand_cr = 1
"augroup mydelimitMate
"  au!
"  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
"  au FileType tex let b:delimitMate_quotes = ""
"  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
"  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
"augroup END

" ----- jez/vim-superman settings -----
" better man page support
noremap K :SuperMan <cword><CR>
runtime! ftplugin/man.vim "man package distributed within vim

"--------YCM settigs ----------------
" Toggle YCM
"let g:ycm_semantic_completion_toggle = '<C-F>'
let g:ycm_auto_trigger=0
"press "\" and y or Y to enable or disable YCM.
nnoremap <leader>y :let g:ycm_auto_trigger=1<CR>                " turn off YCM
nnoremap <leader>yy :let g:ycm_auto_trigger=0<CR>                " turn on YCM
"" turn on completion in comments
let g:ycm_complete_in_comments=1 
"" load ycm conf by default
let g:ycm_confirm_extra_conf=0
"" turn on tag completion
let g:ycm_collect_identifiers_from_tags_files=1
"" only show completion as a list instead of a sub-window
set completeopt-=preview
"" start completion from the first character
let g:ycm_min_num_of_chars_for_completion=1
"" don't cache completion items
let g:ycm_cache_omnifunc=0
"" complete syntax keywords
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" Ultisnips settings
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mySnippets"]
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<s-TAB>"


"-------vimtex settings-----------------
let g:tex_flavor='latex' 
let g:vimtex_view_method = 'skim'
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2

let g:vimtex_delim_list = {'mods' : {}}
let g:vimtex_delim_list.mods.name = [
      \ ['\left', '\right'],
      \ ['\mleft', '\mright'],
      \ ['\bigl', '\bigr'],
      \ ['\Bigl', '\Bigr'],
      \ ['\biggl', '\biggr'],
      \ ['\Biggl', '\Biggr'],
      \ ['\big', '\big'],
      \ ['\Big', '\Big'],
      \ ['\bigg', '\bigg'],
      \ ['\Bigg', '\Bigg'],
      \]
let g:vimtex_delim_toggle_mod_list = [
  \ ['\left', '\right'],
  \ ['\mleft', '\mright'],
  \]

let g:vimtex_quickfix_latexlog = {
            \ 'default' : 1,
            \ 'fix_paths' : 0,
            \ 'general' : 1,
            \ 'references' : 1,
            \ 'overfull' : 1,
            \ 'underfull' : 1,
            \ 'font' : 1,
            \ 'packages' : {
            \   'default' : 1,
            \   'natbib' : 1,
            \   'biblatex' : 1,
            \   'babel' : 1,
            \   'hyperref' : 1,
            \   'scrreprt' : 1,
            \   'fixltx2e' : 1,
            \   'titlesec' : 1,
            \ },
            \}
