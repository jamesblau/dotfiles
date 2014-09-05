"vim: set sw=4 ts=4 sts=4 et ft=vim
" Basics
set nocompatible        " Must be first line
"if !(has('win16') || has('win32') || has('win64'))
set shell=/bin/bash
"endif

" Globals
let g:spf13_bundle_groups=['general', 'neocomplcache', 'programming', 'misc', 'scala']
let g:neocomplcache_disable_auto_complete = 1
let g:evervim_devtoken='S=s200:U=15f5845:E=1490b215f4f:C=141b3703353:P=1cd:A=en-devtoken:V=2:H=db1cc3d81bd4554cb82ba09928779b86'
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_exit_from_visual_mode=0
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_default_mapping=0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:autoclose_vim_commentmode = 1
let g:DisableAutoPHPFolding = 0
let g:PIVAutoClose = 0
let g:NERDShutUp=1
let g:nerdtree_tabs_open_on_gui_startup=0
let g:snips_author = 'James Blau <james@tresata.com>'
let g:pymode_lint_checker = "pyflakes"
let g:pymode_utils_whitespaces = 0
let g:pymode_options = 0
let g:autoclose_on = 0
let s:autoclose_mapped = 0
let b:match_ignorecase = 1
let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['LightBlue', 'DarkGreen', 'Yellow', 'DarkRed']
let g:session_autoload = 'no'
let g:session_autosave = 'no'
let g:EasyMotion_keys = '0123456789abcdefghijklmnopqrstuvwxyz'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:tmux_navigator_no_mappings = 1
"let g:windowswap_map_keys = 0
"let g:airline_powerline_fonts = 1
"let g:solarized_termtrans = 1
"let g:gitgutter_initialised = 1
"let g:gitgutter_realtime = 0
"let g:spf13_no_neosnippet_expand = 1
"let g:spf13_keep_trailing_whitespace = 1
"let g:airline_powerline_fonts = 1
"\/ \/ https://github.com/airblade/vim-gitgutter/issues/106 \/ \/
"let g:gitgutter_realtime = 1

" Silver Searcher stuff
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Tmux navigator stuff
"nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<CR>
"nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<CR>
"nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<CR>
"nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<CR>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<CR>

" WindowSwap stuff
"nmap <Leader>WY :call WindowSwap#MarkWindowSwap()<CR>
"nmap <Leader>WP :call WindowSwap#DoWindowSwap()<CR>
"nmap <Leader>WW :call WindowSwap#EasyWindowSwap()<CR>

" ZoomWin remap
nnoremap <silent> <C-W><C-W> <Plug>ZoomWin
nnoremap <silent> <C-W><C-W> :ZoomWin<CR>

filetype on
filetype off
set rtp+=/home/james/.vim/bundle/vundle
call vundle#rc()

" Use local bundles if available
source /home/james/.vimrc.bundles

" General
let mapleader=','
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
scriptencoding utf-8
set mousehide               " Hide the mouse cursor while typing
set bg=dark
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set hidden                          " Allow buffer switching without saving
set tw=0
set tabpagemax=20               " Only show 20 tabs
set showmode                    " Display the current mode
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set autoindent                  " Indent at the same level of the previous line
set expandtab                   " Tabs are spaces, not tabs
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
set mat=2
set nospell
set notimeout
set nowrap
set nocursorline
set nohlsearch
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set noswapfile                  " Not sure about this one
set nobackup                    " Not sure about this one
au! BufNewFile,BufRead *.scala set sw=2 ts=2 sts=2
"au! BufNewFile,BufRead *.txt syntax off
"au! BufNewFile,BufRead *.txt set sw=4 ts=4 sts=4
"au! BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" Remove trailing whitespaces and ^M chars
au! FileType c,cpp,java,go,php,javascript,python,twig,xml,yml au! BufWritePre <buffer> call StripTrailingWhitespace()
au! FileType go au! BufWritePre <buffer> Fmt
au! BufNewFile,BufRead *.html.twig set filetype=html.twig
au! FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2 "best in a plugin...
au! BufNewFile,BufRead *.coffee set filetype=coffee

" swap j/gj, k/gk
noremap j gj
noremap gj j
noremap k gk
noremap gk k

" Stupid shift key fixes
if !exists('g:spf13_no_keyfixes')
if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif
endif

" Code folding options
nmap <Leader>f0 :set foldlevel=0<CR>
nmap <Leader>f1 :set foldlevel=1<CR>
nmap <Leader>f2 :set foldlevel=2<CR>
nmap <Leader>f3 :set foldlevel=3<CR>
nmap <Leader>f4 :set foldlevel=4<CR>
nmap <Leader>f5 :set foldlevel=5<CR>
nmap <Leader>f6 :set foldlevel=6<CR>
nmap <Leader>f7 :set foldlevel=7<CR>
nmap <Leader>f8 :set foldlevel=8<CR>
nmap <Leader>f9 :set foldlevel=9<CR>

" Change Working Directory to that of the current file
nnoremap <silent> <Leader>wd :lcd %:p:h<CR>

" Visual stuff!
"     Visual shifting does not exit Visual mode
vnoremap < <gv
vnoremap > >gv
"     Allow using the repeat operator with a visual selection: http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>
nnoremap vv 0v$h
nnoremap vV v$h
nnoremap <Esc>v v$h

"""""""""""""START UNTESTED
" Find merge conflict markers
map <Leader>fc /\v^[<\|=>]( .*\|$)<CR>

" Fix home and end keybindings for screen, particularly on mac
" - for some reason this fixes the arrow keys too. huh.
"map <Esc>[F $
"imap <Esc>[F <C-O>$
"map <Esc>[H g0
"imap <Esc>[H <C-O>g0

" Adjust viewports to the same size
map <Leader>= <C-W>=

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easier horizontal scrolling
map zl zL
map zh zH

" OmniComplete
if has("autocmd") && exists("+omnifunc")
au! Filetype *
            \if &omnifunc == "" |
            \setlocal omnifunc=syntaxcomplete#Complete |
            \endif
endif

hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" Some convenient mappings
inoremap <expr> <Esc>      pumvisible() ? "\<C-E>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-Y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-N>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-P>" : "\<Up>"
inoremap <expr> <C-D>      pumvisible() ? "\<PageDown>\<C-P>\<C-N>" : "\<C-D>"
inoremap <expr> <C-U>      pumvisible() ? "\<PageUp>\<C-P>\<C-N>" : "\<C-U>"

" Automatically open and close the popup menu / preview window
au! CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,preview,longest

" Ctags
set tags=./tags;/,/home/james/.vimtags

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

" AutoCloseTag
" Make it so AutoCloseTag works for xml and xhtml files as well
"au! FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
"nmap <Leader>ac <Plug>ToggleAutoCloseMappings

" NerdTree
map <C-Q> :NERDTreeToggle<CR>
"map <Leader>e :NERDTreeFind<CR>
"nmap <Leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" Tabularize
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" Session List
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
nmap <Leader>sl :SessionList<CR>
nmap <Leader>ss :SessionSave<CR>

" JSON
nmap <Leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>

" ctrlp
let g:ctrlp_working_path_mode = 'ra'
"nnoremap <silent> <D-t> :CtrlP<CR>
"nnoremap <silent> <D-r> :CtrlPMRU<CR>
"let g:ctrlp_custom_ignore = {
        "\ 'dir':  '\.git$\|\.hg$\|\.svn$',
        "\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" TagBar
nnoremap <silent> <Leader>tt :TagbarToggle<CR>
"
" PythonMode
" Disable if python support not present
if !has('python')
let g:pymode = 1
endif

" Fugitive
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gm :Gdiff master<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gl :Glog<CR>
nnoremap <silent> <Leader>gp :Git push<CR>
nnoremap <silent> <Leader>gr :Gread<CR>:GitGutter<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>:GitGutter<CR>
nnoremap <silent> <Leader>ge :Gedit<CR>
nnoremap <silent> <Leader>gg :GitGutterToggle<CR>

" neocomplete
if count(g:spf13_bundle_groups, 'neocomplete')
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 15
let g:neocomplete#force_overwrite_completefunc = 1
" SuperTab like snippets behavior.
"imap <silent><expr><TAB> neosnippet#expandable() ?
            "\ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
            "\ "\<C-E>" : "\<TAB>")
"smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions' }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns =
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings
" These two lines conflict with the default digraph mapping of <C-K>
" If you prefer that functionality, add the following to your
" .vimrc.before.local file:
"   let g:spf13_no_neosnippet_expand = 1
if !exists('g:spf13_no_neosnippet_expand')
    imap <C-K> <Plug>(neosnippet_expand_or_jump)
    smap <C-K> <Plug>(neosnippet_expand_or_jump)
endif
"inoremap <expr><C-G> neocomplete#undo_completion()
inoremap <expr><C-L> neocomplete#complete_common_string()
inoremap <expr><CR> neocomplete#complete_common_string()
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-P>" : "\<TAB>"
" <CR>: close popup
" <s-CR>: close popup and save indent.
inoremap <expr><s-CR> pumvisible() ? neocomplete#close_popup()"\<CR>" : "\<CR>"
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<CR>"
" <C-H>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-H>"
inoremap <expr><C-Y> neocomplete#close_popup()
"
" Enable omni completion.
au! FileType css setlocal omnifunc=csscomplete#CompleteCSS
au! FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au! FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au! FileType python setlocal omnifunc=pythoncomplete#Complete
au! FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au! FileType ruby setlocal omnifunc=rubycomplete#Complete
au! FileType haskell setlocal omnifunc=necoghc#omnifunc
" Haskell post write lint and check with ghcmod
" $ `cabal install ghcmod` if missing and ensure
" ~/.cabal/bin is in your $PATH.
if !executable("ghcmod")
    au! BufWritePost *.hs GhcModCheckAndLintAsync
endif
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns =
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
" Use honza's snippets.
let g:neosnippet#snippets_directory='/home/james/.vim/bundle/vim-snippets/snippets'
" Enable neosnippet snipmate compatibility mode
let g:neosnippet#enable_snipmate_compatibility = 1
" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif
" Disable the neosnippet preview candidate window
" When enabled, there can be too much visual noise
" especially when splits are used.
set completeopt-=preview
endif

" neocomplcache
if count(g:spf13_bundle_groups, 'neocomplcache')
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_max_list = 15
let g:neocomplcache_force_overwrite_completefunc = 1
" SuperTab like snippets behavior.
imap <silent><expr><TAB> neosnippet#expandable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
            \ "\<C-E>" : "\<TAB>")
smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions' }
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns= {}
endif
let g:neocomplcache_keyword_patterns._ = '\h\w*'
" Plugin key-mappings
" These two lines conflict with the default digraph mapping of <C-K>
" If you prefer that functionality, add the following to your
" .vimrc.before.local file:
"   let g:spf13_no_neosnippet_expand = 1
if !exists('g:spf13_no_neosnippet_expand')
    imap <C-K> <Plug>(neosnippet_expand_or_jump)
    smap <C-K> <Plug>(neosnippet_expand_or_jump)
endif
"inoremap <expr><C-G> neocomplcache#undo_completion()
inoremap <expr><C-L> neocomplcache#complete_common_string()
inoremap <expr><CR> neocomplcache#complete_common_string()
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-P>" : "\<TAB>"
" <CR>: close popup
" <s-CR>: close popup and save indent.
inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" <C-H>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-H>"
inoremap <expr><C-Y> neocomplcache#close_popup()
"
" Enable omni completion.
au! FileType css setlocal omnifunc=csscomplete#CompleteCSS
au! FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au! FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au! FileType python setlocal omnifunc=pythoncomplete#Complete
au! FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au! FileType ruby setlocal omnifunc=rubycomplete#Complete
au! FileType haskell setlocal omnifunc=necoghc#omnifunc
" Haskell post write lint and check with ghcmod
" $ `cabal install ghcmod` if missing and ensure
" ~/.cabal/bin is in your $PATH.
if !executable("ghcmod")
    au! BufWritePost *.hs GhcModCheckAndLintAsync
endif
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
" Use honza's snippets.
let g:neosnippet#snippets_directory='/home/james/.vim/bundle/vim-snippets/snippets'
" Enable neosnippet snipmate compatibility mode
let g:neosnippet#enable_snipmate_compatibility = 1
" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif
" Disable the neosnippet preview candidate window
" When enabled, there can be too much visual noise
" especially when splits are used.
set completeopt-=preview
endif

" UndoTree
nnoremap <Leader>u :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1

" indent_guides
if !exists('g:spf13_no_indent_guides_autocolor')
let g:indent_guides_auto_colors = 1
else
" For some colorschemes, autocolor will not work (eg: 'desert', 'ir_black')
au! VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121 ctermbg=3
au! VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=4
endif

" vim-airline
" Set configuration options for the statusline plugin vim-airline.
" Use the powerline theme and optionally enable powerline symbols.
" To use the symbols , , , , , , and .in the statusline
" segments add the following to your .vimrc.before.local file:
"   let g:airline_powerline_fonts=1
" If the previous symbols do not render for you then install a
" powerline enabled font.
let g:airline_theme = 'powerlineish'
if !exists('g:airline_powerline_fonts')
" Use the default set of separators with a few customizations
let g:airline_left_sep='›'  " Slightly fancier than '>'
let g:airline_right_sep='‹' " Slightly fancier than '<'
endif

" Functions
" UnBundle
function! UnBundle(arg, ...)
  let bundle = vundle#config#init_bundle(a:arg, a:000)
  call filter(g:bundles, 'v:val["name_spec"] != "' . a:arg . '"')
endfunction
"com! -nargs=+         UnBundle
        \ call UnBundle(<args>)

" Initialize directories
function! InitializeDirectories()
  let parent = $HOME
  let prefix = 'vim'
  let dir_list = {
              \ 'backup': 'backupdir',
              \ 'views': 'viewdir',
              \ 'swap': 'directory' }
  if has('persistent_undo')
    let dir_list['undo'] = 'undodir'
  endif
" To specify a different directory in which to place the vimbackup,
" vimviews, vimundo, and vimswap files/directories, add the following to
" your .vimrc.before.local file:
"   let g:spf13_consolidated_directory = <full path to desired directory>
"   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
if exists('g:spf13_consolidated_directory')
    let common_dir = g:spf13_consolidated_directory . prefix
else
    let common_dir = parent . '/.' . prefix
endif
for [dirname, settingname] in items(dir_list)
    let directory = common_dir . dirname . '/'
    if exists("*mkdir")
        if !isdirectory(directory)
            call mkdir(directory)
        endif
    endif
    if !isdirectory(directory)
        echo "Warning: Unable to create backup directory: " . directory
        echo "Try: mkdir -p " . directory
    else
        let directory = substitute(directory, " ", "\\\\ ", "g")
        exec "set " . settingname . "=" . directory
    endif
endfor
endfunction
call InitializeDirectories()

" Initialize NERDTree as needed
function! NERDTreeInitAsNeeded()
redir => bufoutput
buffers!
redir END
let idx = stridx(bufoutput, "NERD_tree")
if idx > -1
    NERDTreeMirror
    NERDTreeFind
    wincmd l
endif
endfunction

" Strip whitespace
function! StripTrailingWhitespace()
" To disable the stripping of whitespace, add the following to your
" .vimrc.before.local file:
"   let g:spf13_keep_trailing_whitespace = 1
if !exists('g:spf13_keep_trailing_whitespace')
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endif
endfunction

" Shell command
function! s:RunShellCommand(cmdline)
    botright new
    "setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    setlocal nowrap
    setlocal filetype=shell
    setlocal syntax=shell
    "call setline(1, a:cmdline)
    call setline(2, substitute(a:cmdline, '.', '=', 'g'))
    execute 'silent $read !' . escape(a:cmdline, '%#')
    setlocal nomodifiable
    1
endfunction
"command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
" e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
"""""""""""""END UNTESTED

" Incremement character under cursor only
nnoremap <Leader>ic a <Esc>h<C-A>lxh
" No octal, etc wierdness in increment
set nrformats=

" Other empty sets!
set mouse=
set spellcapcheck=

if has ('x') && has ('gui') " On Linux use + register for copy-paste
set clipboard=unnamedplus
endif
if has('cmdline_info')
set ruler                   " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd                 " Show partial commands in status line and
" Selected characters/lines in visual mode
endif

" <C-Space> leaves insert, visual without moving cursor. Not sure about this one...
inoremap <C-Space> <Esc>`^
imap <C-@> <C-Space>
vnoremap <C-Space> <Esc>
vmap <C-@> <C-Space>

" kj with fast timeout for same as above
"set ttimeoutlen=100
"set <F13>=kj
"imap <F13> <C-Space>

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au! FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction
augroup resCur
au!
au! BufWinEnter * call ResCur()
augroup END

" Setting up the directories
set backup                  " Backups are nice ...
if has('persistent_undo')
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

if has('statusline')
set laststatus=2

" Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" Break lines
nmap <Leader>m i<CR><Esc><F5>
nmap <Leader>M a<CR><Esc><F5>

" Yank and Pasting stuff
cnoremap <C-T> <C-R>
nnoremap Y y$
nnoremap <Leader>p <Nop>
nnoremap <Leader>p<Space> :set paste!<CR>
nnoremap <Leader>pl mm$p`m
nnoremap <Leader>pL mmA<Space><Esc>p`m
nnoremap <Leader>ph mm0P`m
nnoremap <Leader>pH mmI<Space><Esc>P`m
nnoremap <Leader>pj mmo<Esc>p`m
nnoremap <Leader>pJ mm3o<Esc>kp`m
nnoremap <Leader>pk mmO<Esc>p`m
nnoremap <Leader>pK mm3O<Esc>kp`m
nnoremap <Leader>pp mm)O<CR><C-R>"<Esc>`m
nnoremap <Leader>pP mm(O<C-R>"<CR><Esc>`m

inoremap <expr><TAB> pumvisible() ? "\<C-N>" : <SID>check_back_space() ? "\<TAB>" : "\<C-X>\<C-U>"
function! s:check_back_space()
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

if v:version > 702
  function! NumberToggle()
    if(&rnu == 1 && &nu == 1)
      set nonumber norelativenumber
    else
      set number relativenumber
    endif
  endfunction
  set number relativenumber
else
  function! NumberToggle()
    if(&rnu == 1 && &nu == 1)
      set nonumber
    else
      set number
    endif
  endfunction
endif

function! NfAlphaToggle()
  if(&nrformats == "")
    set nrformats=alpha
  else
    set nrformats=
  endif
endfunction

function! HeightToggle()
  if(&winheight == 999)
    set winheight=1
  else
    set winheight=999
  endif
endfunction

function! ShcfToggle()
  if(&shcf == "-c")
    set shcf=-ci
  else
    set shcf=-c
  endif
endfunction

function! DiffW()
  let opt = ""
  if &diffopt =~ "icase"
    let opt = opt . "-i "
  endif
  if &diffopt =~ "iwhite"
    let opt = opt . "-w " " vim uses -b by default
  endif
  "if a:1 != ""
    "let opt = opt . "-G " . a:1
  "endif
  silent execute "!diff -a --binary " . opt .
        \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
endfunction

function! DiffWToggle()
  if &diffopt =~ "iwhite"
    set diffopt-=iwhite
    set diffexpr=
  else
    set diffopt+=iwhite
    set diffexpr=DiffW()
  endif
  call SacrificialTabRedraw()
  echom &diffopt &diffexpr
endfunction

function! DiffWToggleRegex()
  set diffopt+=iwhite
  set diffexpr=DiffW()
  call SacrificialTabRedraw()
  echom &diffopt &diffexpr
endfunction

" Sets and toggles!
vnoremap <Leader>s <Nop>
nnoremap <Leader>s <Nop>
nnoremap <Leader>si :IndentGuidesToggle<CR>
nnoremap <Leader>sn :call NumberToggle()<CR>
nnoremap <Leader>sf :call NfAlphaToggle()<CR>
nnoremap <Leader>sh :call HeightToggle()<CR>
nnoremap <Leader>sS :call ShcfToggle()<CR>
nnoremap <Leader>sd :call DiffWToggle()<CR>
nmap     <Leader>sD :call DiffWToggleRegex("")<C-B><C-B>
nnoremap <Leader>sy :SyntasticToggleMode<CR>
nnoremap <Leader>sN :set nu!<CR>
"nnoremap <Leader>svt :call VirtualToggle()<CR>
nnoremap <Leader>sv <Plug>VLToggle
nnoremap <Leader>ss :set spell!<CR>
nnoremap <Leader>sl :set cursorline!<CR>
nnoremap <Leader>s2 :set sw=2 ts=2 sts=2<CR>
nnoremap <Leader>s4 :set sw=4 ts=4 sts=4<CR>
nnoremap <Leader>sw :set wrap!<CR>
nnoremap <Leader>sW :windo set wrap!<CR>
nnoremap <Leader>sa <Plug>ToggleAutoCloseMappings
nnoremap <silent> <Leader>/ :set invhlsearch<CR>


"Replace comma with backslash for find backwards last.
nnoremap \ ,
"Not sure about this one, but easier capitalized leader mappings
nmap < ,
"But don't mess up unindenting
nnoremap << <<
nnoremap <Space> <Nop>

function! AddSubtract(char, back)
  let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
  call search(pattern, 'cw' . a:back)
  execute 'normal! ' . v:count1 . a:char
  silent! call repeat#set(":\<C-U>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction
nnoremap <silent> <C-A> :<C-U>call AddSubtract("\<C-A>", '')<CR>
nnoremap <silent> <Esc>a   :<C-U>call AddSubtract("\<C-A>", 'b')<CR>
nnoremap <silent> <C-X> :<C-U>call AddSubtract("\<C-X>", '')<CR>
nnoremap <silent> <Esc>x   :<C-U>call AddSubtract("\<C-X>", 'b')<CR>

" Edit multiple
command! -complete=file -nargs=+ Etabs call s:ETW('tabnew', <f-args>)
command! -complete=file -nargs=+ Ewindows call s:ETW('edit', <f-args>)
command! -complete=file -nargs=+ Eswindows call s:ETW('new', <f-args>)
command! -complete=file -nargs=+ Evwindows call s:ETW('vnew', <f-args>)

function! s:ETW(what, ...)
  for f1 in a:000
    let files = glob(f1)
    if files == ''
      execute a:what . ' ' . escape(f1, '\ "')
    else
      for f2 in split(files, "\n")
        execute a:what . ' ' . escape(f2, '\ "')
      endfor
    endif
  endfor
endfunction

" Tab stuff!
nnoremap <Leader>th :tabfirst<CR>
nnoremap <Leader>tl :tablast<CR>
nnoremap <Leader>tm :tabm<Space>
nnoremap <Leader>td :tabclose<CR>

" Some helpers to edit mode
cnoremap %% <C-R>=expand('%:h').'/'<CR>
nnoremap <Leader>ew :Ewindows<Space>
nnoremap <Leader>es :Eswindows<Space>
nnoremap <Leader>ev :Evwindows<Space>
nnoremap <Leader>et :Etabs<Space>
nmap <Leader>eW :Ewindows %%
nmap <Leader>eS :Eswindows %%
nmap <Leader>eV :Evwindows %%
nmap <Leader>eT :Etabs %%
nnoremap <Leader>EW :enew<CR>
nnoremap <Leader>ES :new<CR>
nnoremap <Leader>EV :vnew<CR>
nnoremap <Leader>ET :tabnew<CR>
nnoremap <Leader>Ew :b<Space>
nnoremap <Leader>Es :sb<Space>
nnoremap <Leader>Ev :vert sb<Space>
nnoremap <Leader>Et :tab sb<Space>

function! NextTorB()
    if (tabpagenr("$") == 1)
        bn
    else
        tabn
    endif
endfunction
function! PrevTorB()
    if (tabpagenr("$") == 1)
        bp
    else
        tabp
    endif
endfunction

" Tab, window, and buffer movement stuff!
"Tab movement
nnoremap <silent> <Esc>i        :bp<CR>
nnoremap <silent> <Esc>o        :bn<CR>
"inoremap <silent> <Leader><Esc>h        <C-O>:tabp<CR>
"inoremap <silent> <Leader><Esc>l        <C-O>:tabn<CR>
nnoremap <silent> <Esc>h     :tabmove -1<CR>
nnoremap <silent> <Esc>l     :tabmove +1<CR>
"Buffer movement
nnoremap          <Esc>j        :call PrevTorB()<CR>
nnoremap          <Esc>k        :call NextTorB()<CR>
"inoremap          <Leader><Esc>j        <C-O>:bp<CR>
"inoremap          <Leader><Esc>k        <C-O>:bn<CR>
"Window movement
nnoremap          <C-J>      <C-W>j
"nnoremap          <Esc><C-J> <C-W>j<C-W>_
nnoremap          <Esc><C-J> :call SmoothDown()<CR>
nnoremap          <C-K>      <C-W>k
"nnoremap          <Esc><C-K> <C-W>k<C-W>_
nnoremap          <Esc><C-K> :call SmoothUp()<CR>
nnoremap          <C-H>      <C-W>h
nnoremap          <C-L>      <C-W>l
"Other buffer stuff
nnoremap <Leader>b  <Nop>
nnoremap <Leader>bl :buffers<CR>
nnoremap <Leader>bt :tab ball<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bD :bd!<CR>
nnoremap <Leader>Bd :call DeleteHiddenBuffers()<CR>
nnoremap <Leader>BD :call ReallyDeleteHiddenBuffers()<CR>

"function! SmoothMove(hjkl)
    "if(&winheight == 999)
        "wincmd ??
    "else
        "set winheight=999
        "wincmd ??
        "set winheight=1
    "endif
"endfunction

function! SmoothDown()
    if(&winheight == 999)
        wincmd j
    else
        set winheight=999
        wincmd j
        set winheight=1
    endif
endfunction

function! SmoothUp()
    if(&winheight == 999)
        wincmd k
    else
        set winheight=999
        wincmd k
        set winheight=1
    endif
endfunction

function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

function! ReallyDeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout!' buf
    endfor
endfunction

" Easymotion stuff!
map <C-\> <Plug>(easymotion-prefix)
map <C-\><C-\> <Plug>(easymotion-jumptoanywhere)
map <Leader><Leader> <Leader><Leader>

" Register stuff!
"TODO: name register for all below
nnoremap <Leader>c <Nop>
nnoremap <Leader>x <Nop>
nnoremap <Leader>r <Nop>
vnoremap <Leader>c <Nop>
"Line to xclip
nnoremap <Leader>C yy:call system("xclip -i -selection clipboard", getreg("\""))<CR>
vnoremap <Leader>C y:call system("xclip -i -selection clipboard", getreg("\""))<CR>
"Paste from xclip
nnoremap <Leader>v :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
vnoremap <Leader>v :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
nnoremap <Leader>V :call setreg("\"",system("xclip -o -selection clipboard"))<CR>P
vnoremap <Leader>V :call setreg("\"",system("xclip -o -selection clipboard"))<CR>P
"Register from xclip
nnoremap <Leader>rx :call setreg("\"",system("xclip -o -selection clipboard"))<CR>
"xclip from register
nnoremap <Leader>xr :call system("xclip -i -selection clipboard", getreg("\""))<CR>
"Register from full path
nnoremap <Leader>rp :call setreg("\"", expand("%:p"))<CR>
"Xclip from full path
nnoremap <Leader>xp :call system("xclip -i -selection clipboard", expand("%:p"))<CR>
"Register from filename
nnoremap <Leader>rf :call setreg("\"", expand("%:t"))<CR>
"Xclip from filename
nnoremap <Leader>xf :call system("xclip -i -selection clipboard", expand("%:t"))<CR>
"Register from dir
nnoremap <Leader>rd :call setreg("\"", expand("%:p:h")."/")<CR>
"xclip from dir
nnoremap <Leader>xd :call system("xclip -i -selection clipboard", expand("%:p:h")."/")<CR>
"Register from Git repo
nnoremap <Leader>rg :call setreg("\"", system("git rev-parse --show-toplevel"))<CR>
"xclip from Git repo
nnoremap <Leader>xg :call system("git rev-parse --show-toplevel \| tr -d '\n' \| xclip -i -selection clipboard")<CR>
"Register from buffers
nnoremap <Leader>rb :call setreg( "\"", join(map(filter(range(0,bufnr('$')), 'buflisted(v:val)'), 'fnamemodify(bufname(v:val), ":p")'), " ") )<CR>
"xclip from buffers
nnoremap <Leader>xb
                \ :call system(
                    \ "xclip -i -selection clipboard",
                    \ join(map(filter(range(0,bufnr('$')), 'buflisted(v:val)'), 'fnamemodify(bufname(v:val), ":p")'), " ")
                \ )<CR>
"Export buffers
nnoremap <silent> <Leader>be
                    \ :call writefile(
                        \ map(filter(range(0,bufnr('$')), 'buflisted(v:val)'), 'fnamemodify(bufname(v:val), ":p")'),
                        \ system("echo /home/james/.buffersave/`date +\"\%Y\%m\%d_\%H:\%M:\%S\"`")
                    \ )<CR>
"Register from All
nnoremap <Leader>ra mmggVGy`m
"xclip from All
nnoremap <Leader>xa mmggVGy:call system("xclip -i -selection clipboard", getreg("\""))<CR>`m

" Center on search term, diff
nmap n nzz
nmap N Nzz
nmap ]c ]czz
nmap [c [czz

" Saving stuff
cmap w!! w !sudo tee % >/dev/null
nmap ,ww! :w<CR>:bw<CR>
cmap ww!<CR> w<CR>:bw<CR>
nmap ,w!w!w! :w!!<CR>ll:bw<CR>
cmap w!w!w! :w!!<CR>ll:bw<CR>

" Header stuff
"Header make
nnoremap <Leader>Hm ^i\|\|<Space><Esc>A<Space>\|\|<Esc>"qyy"qP"qD999a=<Esc>jhlk"qD"qyyj"qpqqqk^
"Header fix
nnoremap <Leader>Hf k999A=<Esc>jhlk"qD"qyyj"qpj"qddkkkqqqj^
"Header unmake
nnoremap <Leader>Hu k"qdd"qx"qx"qx$"qX"qX"qxj"qddqqqk^
"Minor header make
nnoremap <Leader>hm I\|__<Space><Esc>A<Space>__\|<Esc>yyPElv$Bhr<Space>^r<Space>$r<Space>x
"Minor header fix
nnoremap <Leader>hf "yyykV"yp^r<Space>$xBhv^Elr<Space>
"Minor header unmake
nnoremap <Leader>hu ^4x$x3Xkdd

" ???
"nnoremap <Leader>HM ,c ^i\|\| <esc>A \|\|<esc>"qyy"qP"qD999a=<esc>jhlk"qD"qyyj"qpVkk,c j^
"nnoremap <Leader>HF jVkk,c 999A=<esc>jhlkDyyjpjddkVkk,c j^
"nnoremap <Leader>HU kVjj,c \"qdd"qx"qx"qx$"qX"qX"qxj"qddqqqk^,c<Space>

" Remove whitespace
nnoremap <silent> <F5> mm:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>'m

"au! BufNewFile,BufRead fugitive://* set bufhidden=delete

inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
cnoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

let &showbreak=repeat('>', 2)
function! ShowBreakToggle()
  if(&showbreak == repeat('>', 2))
    set showbreak=
  else
    let &showbreak=repeat('>', 2)
  endif
endfunction
nnoremap <Leader>sb :call ShowBreakToggle()<CR>

" Camel stuff!
map -w <Plug>CamelCaseMotion_w
map -b <Plug>CamelCaseMotion_b
map -e <Plug>CamelCaseMotion_e
omap i-w <Plug>CamelCaseMotion_iw
xmap i-w <Plug>CamelCaseMotion_iw
omap i-b <Plug>CamelCaseMotion_ib
xmap i-b <Plug>CamelCaseMotion_ib
omap i-e <Plug>CamelCaseMotion_ie
xmap i-e <Plug>CamelCaseMotion_ie

" Emacs stuff!
inoremap <C-F> <right>
cnoremap <C-F> <Right>
inoremap <C-B> <left>
cnoremap <C-B> <Left>
inoremap <C-A> <esc>I
cnoremap <C-A> <Home>
inoremap <C-E> <esc>A
inoremap <C-D> <delete>
cnoremap <C-D> <delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
set cedit=


" Substitution stuff!
vnoremap <Leader>s<Space> y:%s/<C-R>"/
vnoremap <Leader>ss y:%s/<C-R>"/<C-R>"/g
nnoremap <Leader>sc :%s/\<<C-R><C-W>\>/

" Session stuff!
nnoremap <Leader>S <Nop>
nnoremap <Leader>SL :SessionList<CR>
nnoremap <Leader>SO :OpenSession<Space>
nnoremap <Leader>SV :ViewSession<CR>
nnoremap <Leader>SS :SaveSession<Space>
nnoremap <Leader>SC :CloseSession<CR>
nnoremap <Leader>STO :OpenTabSession<CR>
nnoremap <Leader>STS :SaveTabSession<CR>
nnoremap <Leader>STA :AppendTabSession<CR>
nnoremap <Leader>STC :CloseTabSession<CR>

" Accept autocomplete selection
cnoremap  <space><delete>

" No accidental Ex-mode or keyword-lookup
nnoremap Q <Nop>
nnoremap <Leader>Q Q
nnoremap K <Nop>
nnoremap <Leader>K K

"nnoremap <Leader>yf A<Backspace>" +\<Esc>2F"j999I <Esc>k2F"jdwi"<Esc>
"function! s:indent_to_here(row)
  "let col = col('.')
  "return !col || getline('.')[col - 1] =~ '\s'
"endfunction

" Execute viml
nnoremap <Leader>e. :execute getline(".")<CR>
nnoremap <Leader>er : <C-R>"<CR>

" Color stuff!
colorscheme transparent
"nnoremap <Leader>lr :hi CursorLine   cterm=Bold ctermbg=DarkRed ctermfg=White
"nnoremap <Leader>li :hi CursorLine   cterm=reverse,bold
hi CursorLine         ctermfg=White         ctermbg=DarkRed     cterm=Bold
hi SignColumn         ctermfg=Yellow        ctermbg=None
hi LineNr             ctermfg=Yellow        ctermbg=None
hi CursorLineNr       ctermfg=Yellow        ctermbg=None
hi Normal             ctermfg=White
"hi TabLine            ctermfg=Black         ctermbg=Yellow
"hi TabLineSel         ctermfg=White         ctermbg=DarkRed
"hi TabLineFill        ctermfg=None
hi Search             ctermfg=White         ctermbg=Black       cterm=bold
hi Visual             ctermfg=DarkRed       ctermbg=White
hi vimLineComment     ctermfg=LightBlue
hi NonText            ctermfg=DarkRed
hi DiffAdd            ctermfg=Yellow        ctermbg=None
hi DiffChange         ctermfg=Yellow        ctermbg=None
hi DiffDelete         ctermfg=Yellow        ctermbg=None
hi GitGutterAdd                             ctermbg=None
hi GitGutterChange                          ctermbg=None
hi GitGutterChangeDeleteDefault             ctermbg=None
hi GitGutterChangeLineDefault               ctermbg=None
hi GitGutterDeleteLine                      ctermbg=None
hi GitGutterAddDefault                      ctermbg=None
hi GitGutterChangeDefault                   ctermbg=None
hi GitGutterChangeDeleteLine                ctermbg=None
hi GitGutterDelete                          ctermbg=None
hi GitGutterAddLine                         ctermbg=None
hi GitGutterChangeDelete                    ctermbg=None
hi GitGutterChangeLine                      ctermbg=None
hi GitGutterDeleteDefault                   ctermbg=None
hi shDoubleQuote                            ctermbg=None
"hi Braces             ctermfg=None          ctermbg=None
"hi vimHiCtermColor     ctermfg=Black
"hi Highlight           ctermfg=Black
"hi vimHiCtermFgBg     ctermfg=None          ctermbg=None
"hi vimHiCTerm         ctermfg=None          ctermbg=None
"hi preProc            ctermfg=None          ctermbg=None
"hi Type               ctermfg=None          ctermbg=None
hi MatchParen          cterm=undercurl,bold
"hi clear MatchParen
"hi Cursor

" Check coloring
map <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
map <F9> :echo "hi<" . synIDattr(synID(line("."),col(".")+1,1),"name") . '> trans<' . synIDattr(synID(line("."),col(".")+1,0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col(".")+1,1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col(".")+1,1)),"fg#")<CR>

" Resource and re-Filetype temp. hack...
nnoremap <Leader>R <Nop>
nnoremap <Leader>RR :source /home/james/.vimrc<CR>:execute "setf ".&filetype<CR>

" Backspace whatever. hack...
if v:version < 703
    inoremap  <BS>
endif

" Should be elsewhere? Resize windows.
function! Sum(vals) "{{{
    let acc = 0
    for val in a:vals
        let acc += val
    endfor
    return acc
endfunction "}}}
function! LogicalLineCounts() "{{{
    if &wrap
        let width = winwidth(0)
        let line_counts = map(range(1, line('$')), "foldclosed(v:val)==v:val?1:(virtcol([v:val, '$'])/width)+1")
    else
        let line_counts = [line('$')]
    endif
    return line_counts
endfunction "}}}
function! LinesHiddenByFoldsCount() "{{{
    let lines = range(1, line('$'))
    call filter(lines, "foldclosed(v:val) > 0 && foldclosed(v:val) != v:val")
    return len(lines)
endfunction "}}}
function! AutoResizeWindow(vert) "{{{
    if a:vert
        let longest = max(map(range(1, line('$')), "virtcol([v:val, '$'])"))
        exec "vertical resize " . (longest+4)
    else
        let line_counts  = LogicalLineCounts()
        let folded_lines = LinesHiddenByFoldsCount()
        let lines        = Sum(line_counts) - folded_lines
        exec 'resize ' . lines
        1
    endif
endfunction "}}}
nnoremap <Leader>wf :call AutoResizeWindow(0)<CR>

" Bsc/Csv stuff
au! BufNewFile,BufRead *.bsv set filetype=csv
nnoremap <Leader>qw :WhatColumn<CR>
nnoremap <Leader>qW :WhatColumn!<CR>
nnoremap <Leader>qc :NrColumns<CR>
nnoremap <Leader>qs :SearchInColumn<Space>
nnoremap <Leader>qh :HiColumn<CR>
nnoremap <Leader>qH :HiColumn!<CR>

" Regbuf stuff
nnoremap <Leader>sr :RegbufOpen<CR>

" Disgusting hack...
function! SacrificialTabRedraw()
  exec ':tabnew'
  exec ':redraw'
  exec ':bw'
endfunction
nnoremap <Leader>TR :call SacrificialTabRedraw()<CR>


" Swap parameters (,-seperated, in parens)
nmap <F14> /[,)]hv?[ (]l
nmap <Plug>MoveParamRight <F14>"yy<F14>dll<F14>pF,P0/y
  \:call repeat#set("\<Plug>MoveParamLeft")<CR>
nmap <Plug>MoveParamLeft <F14>"yy<F14>dhhh<F14>pllp0/y
  \:call repeat#set("\<Plug>MoveParamRight")<CR>
nmap <Leader>< <Plug>MoveParamLeft
nmap <Leader>> <Plug>MoveParamRight
