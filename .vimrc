" Gotta be first
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plugin 'altercation/vim-colors-solarized'
"Plugin 'tomasr/molokai'
"Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'
"Plugin 'sjl/badwolf'
"Plugin 'jacoborus/tender'
"Plugin 'whatyouhide/vim-gotham'
"Plugin 'chriskempson/tomorrow-theme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
"Plugin 'flazz/vim-colorschemes'

" ----- Vim as a programmer's text editor -----------------------------
"Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'ptzz/lf.vim'
"Plugin 'voldikss/vim-floaterm'
Plugin 'vim-syntastic/syntastic' "checking syntax
Plugin 'xolox/vim-misc'
Plugin 'ludovicchabant/vim-gutentags'
"Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'duff/vim-trailing-whitespace'
Plugin 'jalvesaq/Nvim-R' "vim IDE for R
Plugin 'puremourning/vimspector'


if has('gui_running') && has('python3')
    Plugin 'Valloric/YouCompleteMe' "Code completion for macvim only
endif


" Snippets
if has('python3')
    Plugin 'SirVer/ultisnips' " Track the engine.
    Plugin 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them. To edit/customize snippets, open a tex file and type :UltiSnipsEdit
endif

" Get YCM and Ultisnips work
Plugin 'ervandew/supertab'

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
set fileencoding=utf-8
set termencoding=utf-8

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

" Fast switching buffers
nnoremap <leader><TAB> :ls<CR>:b<Space>

"au BufNewFile,BufRead *.py
au Filetype python set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    \ fileformat=unix


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
set wildmenu wildoptions=pum         " visual autocomplete for command menu"
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
"hi clear SignColumn
"highlight! link SignColumn LineNr
"highlight SignColumn guibg=Black ctermbg=Black
"debugger split setting
let g:termdebug_wide = 163
"let g:termdebug_wide=

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
"let g:molokai_original = 1
"let g:rehash256 = 1

" Set the colorscheme
"colorscheme gruvbox "gotham256
"colorscheme molokai



" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2
"set guifont=Menlo\ for\ Powerline:h11
"nerd font MesloLG font-meslo-lg-nerd-font can be installed via brew cask
set guifont=MesloLGMDZ\ Nerd\ Font:h13
"set guifont=Comic\ Mono:h13

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

" Show buffer number in tabline
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_theme= 'jellybeans'
" Use the solarized theme for the Airline status bar
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
let g:netrw_liststyle = 2
let g:netrw_browse_split =4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_keepdir = 0
let g:netrw_hide = 1
hi! link netrwMarkFile Search
nmap ` : Lexplore<CR>

"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
"
" ----- lf configuration ----
"let g:lf_replace_netrw = 1
"let g:lf_open_new_tab = 1
"let g:lf_map_keys = 0
"map <leader>f :Lf<CR>



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
"let g:easytags_events = ['BufReadPost', 'BufWritePost']
"let g:easytags_async = 1
"let g:easytags_dynamic_files = 2
"let g:easytags_resolve_links = 1
"let g:easytags_suppress_ctags_warning = 1
" ----- 'ludovicchabant/vim-gutentags' -----
set statusline+=%{gutentags#statusline()}
let g:gutentags_project_root = ['Makefile']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ '--c++-kinds=+p',
      \ '--fields=+iaS',
      \ '--extras=+qf',
      \ '--language-force=C++',
      \ ]

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>T :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possiblie
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- cscope settings -----
"source ~/.vim/bundle/cscope_maps.vim
set cscopetag

" check cscope for definition of a symbol before checking ctags: set to 1
" if you want the reverse search order.
set csto=0

" add any cscope database in current directory
if filereadable("cscope.out")
    cs add cscope.out  
" else add the database pointed to by environment variable 
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif

" show msg when any other cscope db added
set cscopeverbose  
set cscoperelative

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
highlight! link SignColumn LineNr


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
let g:ycm_disable_for_files_larger_than_kb = 1024*500
let g:ycm_auto_trigger=0
"Toggle YouCompleteMe on and off with ,yy
"function Toggle_ycm()
"    if g:ycm_show_diagnostics_ui == 0
"        let g:ycm_auto_trigger = 1
"        let g:ycm_show_diagnostics_ui = 1
"        :YcmRestartServer
"        :e
"        :echo "YCM on"
"    elseif g:ycm_show_diagnostics_ui == 1
"        let g:ycm_auto_trigger = 0
"        let g:ycm_show_diagnostics_ui = 0
"        :YcmRestartServer
"        :e
"        :echo "YCM off"
"    endif
"endfunction
"nnoremap  ,yy :call Toggle_ycm() <CR>
"Toggle YouCompleteMe on and off with ,y
function Toggle_ycm()
    if g:ycm_auto_trigger == 0
        let g:ycm_auto_trigger = 1
        :echo "YCM on"
    elseif g:ycm_auto_trigger == 1
        let g:ycm_auto_trigger = 0
        :echo "YCM off"
    endif
endfunction
nnoremap  ,yy :call Toggle_ycm() <CR>


"" turn on completion in comments
let g:ycm_complete_in_comments=0 
"" load ycm conf by default
let g:ycm_confirm_extra_conf=0
"" turn on tag completion
"let g:ycm_collect_identifiers_from_tags_files=1
"" only show completion as a list instead of a sub-window
set completeopt-=preview
"" start completion from the first character
let g:ycm_min_num_of_chars_for_completion=3
"" don't cache completion items
let g:ycm_cache_omnifunc=0
"" complete syntax keywords
let g:ycm_seed_identifiers_with_syntax=1
"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]
" setup key to stop completion
"let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping=1


" Ultisnips settings
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsSnippetDirectories=["mySnippets", "UltiSnips"]
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/mySnippets', $HOME.'vim/bundle/vim-snippets/UltiSnips']
"let g:UltiSnipsSnippetDirectories=["mySnippets"]
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'

"-------vimtex settings-----------------
set grepprg="rg\ -nH\ $*"
let g:tex_flavor='latex' 
let g:vimtex_view_method = 'skim'
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
let g:vimtex_complete_bib = {
            \ 'recursive': 0,
            \ 'simple': 1,
            \}

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

let g:vimtex_include_search_enabled = 0
let g:vimtex_syntax_custom_cmds = [
            \{
                \ 'name': 'href',
                \ 'argspell': 0
            \},
            \{
                \ 'name': 'fullcite',
                \ 'argspell': 0
            \},
            \{
                \ 'name': 'textcite',
                \ 'argspell': 0
            \},
            \{
                \ 'name': 'url',
                \ 'argspell': 0
            \},
            \]
""""""""""""""""""""""""""""""""""""""""""""""""""""
" buffer settings

