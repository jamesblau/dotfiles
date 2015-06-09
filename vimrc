"vim: set sw=2 ts=2 sts=2 expandtab ft=vim
set nocompatible
set shell=/bin/bash

" Leader stuff!
let mapleader = ","
nnoremap \ ,
nmap < ,
nnoremap << <<

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
set switchbuf=useopen
set tw=0
set tabpagemax=20               " Only show 20 tabs
set showmode                    " Display the current mode
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 lines high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=-9               " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set autoindent                  " Indent at the same level of the previous line
set expandtab                   " Tabs are spaces, not tabs
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set matchpairs+=<:>             " Match, to be used with %
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
set omnifunc=syntaxcomplete#Complete
set mouse=
set nrformats=              " No octal, etc wierdness in increment
set showcmd                 " Show partial commands in status line and

" Multi-cursor stuff
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_exit_from_visual_mode=0

" Silver Searcher stuff
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Tmux navigator stuff
let g:tmux_navigator_no_mappings = 1
"nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<CR>
"nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<CR>
"nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<CR>
"nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<CR>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<CR>

" WindowSwap stuff
"let g:windowswap_map_keys = 0
"nmap <Leader>WY :call WindowSwap#MarkWindowSwap()<CR>
"nmap <Leader>WP :call WindowSwap#DoWindowSwap()<CR>
"nmap <Leader>WW :call WindowSwap#EasyWindowSwap()<CR>

" ZoomWin remap
nnoremap <silent> <C-W><C-W> <Plug>ZoomWin
nnoremap <silent> <C-W><C-W> :ZoomWin<CR>

" Rainbow parentheses everywhere
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow#blacklist = [15, 121, 159]
au! BufNewFile,BufRead * RainbowParentheses

" swap j/gj, k/gk
noremap j gj
noremap gj j
noremap k gk
noremap gk k

" Stupid shift key fixes
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>

" Change Working Directory to that of the current file
nnoremap <silent> <Leader>wd :lcd %:p:h<CR>

" Visual stuff!
"     Visual shifting does not exit Visual mode
vnoremap < <gv
vnoremap > >gv
"     Allow using the repeat operator with a visual selection: http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>
nnoremap vv 0v$h
nnoremap VV _v$h
nnoremap vV v$h
nnoremap Vv v_

" Ctags
set tags=./tags;/,/home/james/.vimtags

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
  let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

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

" ctrlp
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <C-P> :CtrlP<CR>
nnoremap <silent> <Esc><C-p> :CtrlPBuffer<CR>
nnoremap <silent> <Esc>p :CtrlPMRU<CR>
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<c-h>', '<bs>', '<c-]>'],
  \ 'PrtDelete()':          ['<c-d>', '<del>'],
  \ 'PrtSelectMove("t")':   ['', '<Home>', '<kHome>'],
  \ 'PrtSelectMove("b")':   ['<c-g>', '<End>', '<kEnd>'],
  \ 'ToggleByFname()':      ['<c-i>'],
  \ 'ToggleType(1)':        ['<c-l>', '<c-up>'],
  \ 'ToggleType(-1)':       ['<c-down>'],
  \ 'PrtCurLeft()':         ['<c-b>', '<left>', '<c-^>'],
  \ 'PrtCurRight()':        ['<c-f>', '<right>'],
  \ 'PrtExit()':            ['<esc>', '<c-c>'],
  \ }
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\.git$\|\.hg$\|\.svn$',
  "\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" Fugitive and GitGutter
"let g:gitgutter_initialised = 1
"let g:gitgutter_realtime = 0
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

" UndoTree
nnoremap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1

if !exists('g:james_no_hud')
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#buffer_nr_show = 1
  "let g:airline_powerline_fonts = 1

  " vim-airline
  "let g:airline_powerline_fonts=1
  let g:airline_theme = 'powerlineish'
  if !exists('g:airline_powerline_fonts')
    " Use the default set of separators with a few customizations
    let g:airline_left_sep='›'  " Slightly fancier than '>'
    let g:airline_right_sep='‹' " Slightly fancier than '<'
  endif

  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\                     " Filename
  set statusline+=%w%h%m%r                 " Options
  set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " Filetype
  set statusline+=\ [%{getcwd()}]          " Current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" Incremement character under cursor only
nnoremap <Leader>ic a <Esc>h<C-A>lxh

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
set undodir=~/.vimundo//
if has('persistent_undo')
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

" Break lines
nmap <Leader>m i<CR><Esc><F5>
nmap <Leader>M a<CR><Esc><F5>

" Yank and Pasting stuff
cnoremap <C-T> <C-R>
nnoremap Y y$
nnoremap <Leader>p <Nop>
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

" Versioned stuff...
if v:version > 702
  " Keep window position
  au! BufLeave * let b:winview = winsaveview()
  au! BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
  " JSON
  nmap <Leader>jp <Esc>:%!underscore print<CR><Esc>:set filetype=json<CR><F5>
  nmap <Leader>jt <Esc>:%!python -mjson.tool<CR><Esc>:set filetype=json<CR><F5>
  " NumberToggle
  function! NumberToggle()
    if(&rnu == 1 && &nu == 1)
      set nonumber norelativenumber
    else
      set number relativenumber
    endif
  endfunction
  set number relativenumber
else
  " JSON
  nmap <Leader>jt <Esc>:%!python2.6 -mjson.tool<CR><Esc>:set filetype=json<CR><F5>
  " Backspace whatever. hack...
  inoremap  <BS>
  " NumberToggle
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

function! ShowBreakToggle()
  if(&showbreak == g:james_showbreak)
    set showbreak=
  else
    let &showbreak=g:james_showbreak
  endif
endfunction

" Sets and toggles
vnoremap <Leader>s <Nop>
nnoremap <Leader>s <Nop>
nnoremap <Leader>sn :call NumberToggle()<CR>
nnoremap <Leader>sf :call NfAlphaToggle()<CR>
nnoremap <Leader>sh :call HeightToggle()<CR>
nnoremap <Leader>sS :call ShcfToggle()<CR>
nnoremap <Leader>sd :call DiffWToggle()<CR>
nmap     <Leader>sD :call DiffWToggleRegex("")<C-B><C-B>
nnoremap <Leader>sN :set nu!<CR>
"nnoremap <Leader>svt :call VirtualToggle()<CR>
nnoremap <Leader>sv <Plug>VLToggle
nnoremap <Leader>ss :set spell!<CR>
nnoremap <Leader>sp :set paste!<CR>
nnoremap <Leader>sl :set cursorline!<CR>
nnoremap <Leader>s2 :set expandtab sw=2 ts=2 sts=2<CR>
nnoremap <Leader>s4 :set expandtab sw=4 ts=4 sts=4<CR>
nnoremap <Leader>sw :set wrap!<CR>
nnoremap <Leader>sW :windo set wrap!<CR>
nnoremap <Leader>sa <Plug>ToggleAutoCloseMappings
nnoremap <silent> <Leader>/ :set invhlsearch<CR>
nnoremap <Leader>sz :set foldmethod=manual<CR>

" Break-lines stuff
let g:james_showbreak=repeat('>',2)
let &showbreak=g:james_showbreak
nnoremap <Leader>sb :call ShowBreakToggle()<CR>

" Indent guides stuff
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_default_mapping = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
nnoremap <Leader>si :IndentGuidesToggle<CR>

" Syntastic stuff
let g:syntastic_mode_map = {'mode': 'passive'}
nnoremap <Leader>sy :SyntasticToggleMode<CR>
nnoremap <Leader>ys :SyntasticCheck<CR>

" Add/subtract stuff
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

function! ETW(what, ...)
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

" Edit multiple
command! -complete=file -nargs=+ Etabs call ETW('tabnew', <f-args>)
command! -complete=file -nargs=+ Ewindows call ETW('edit', <f-args>)
command! -complete=file -nargs=+ Eswindows call ETW('new', <f-args>)
command! -complete=file -nargs=+ Evwindows call ETW('vnew', <f-args>)

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

function! NextTWorB()
  if (tabpagenr("$") == 1) && (winnr("$") == 1)
    bn
  elseif (tabpagenr("$") == 1)
    wincmd w
  else
    tabn
  endif
endfunction
function! PrevTWorB()
  if (tabpagenr("$") == 1) && (winnr("$") == 1)
    bp
  elseif (tabpagenr("$") == 1)
    wincmd W
  else
    tabp
  endif
endfunction
function! NumTorB(number)
  if (tabpagenr("$") == 1)
    execute ":b" . a:number
  else
    execute ":tabn" . a:number
  endif
endfunction

" Buffer stuff
nnoremap <Leader>b  <Nop>
nnoremap <Leader>bl :buffers<CR>
nnoremap <Leader>bt :tab ball<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bD :bd!<CR>
nnoremap <Leader>Bd :call DeleteHiddenBuffers()<CR>
nnoremap <Leader>BD :call ReallyDeleteHiddenBuffers()<CR>
" Window stuff
nnoremap <C-H>      <C-W>h
nnoremap <C-J>      <C-W>j
nnoremap <C-K>      <C-W>k
nnoremap <C-L>      <C-W>l
nnoremap <Esc><C-J> :call SmoothDown()<CR>
nnoremap <Esc><C-K> :call SmoothUp()<CR>
" Tab stuff
nnoremap <Esc>i     :bp<CR>
nnoremap <Esc>o     :bn<CR>
nnoremap <Esc>h     :tabmove -1<CR>
nnoremap <Esc>l     :tabmove +1<CR>
nnoremap <Leader>th :tabfirst<CR>
nnoremap <Leader>tl :tablast<CR>
nnoremap <Leader>tm :tabm<Space>
nnoremap <Leader>td :tabclose<CR>
" Smart Tab, (Window), Buffer stuff
nnoremap <Esc>j     :call PrevTWorB()<CR>
nnoremap <Esc>k     :call NextTWorB()<CR>
nnoremap <Esc>1     :call NumTorB(1)<CR>
nnoremap <Esc>2     :call NumTorB(2)<CR>
nnoremap <Esc>3     :call NumTorB(3)<CR>
nnoremap <Esc>4     :call NumTorB(4)<CR>
nnoremap <Esc>5     :call NumTorB(5)<CR>
nnoremap <Esc>6     :call NumTorB(6)<CR>
nnoremap <Esc>7     :call NumTorB(7)<CR>
nnoremap <Esc>8     :call NumTorB(8)<CR>
nnoremap <Esc>9     :call NumTorB(9)<CR>
nnoremap <Esc>0     :call NumTorB(10)<CR>

function! SmoothMove(hjkl)
  if(&winheight == 999)
    wincmd ??
  else
    set winheight=999
    wincmd ??
    set winheight=1
  endif
endfunction

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
let g:EasyMotion_keys = '0123456789abcdefghijklmnopqrstuvwxyz'
map <C-\> <Plug>(easymotion-prefix)
map <C-\><C-\> <Plug>(easymotion-jumptoanywhere)
map <Leader><Leader> <Leader><Leader>

" Register stuff!
" {
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

"Special swapping mappings!
"Register from xclip
nnoremap <Leader>d :call setreg("\"",system("xclip -o -selection clipboard"))<CR>
"xclip from register
nnoremap <Leader>f :call system("xclip -i -selection clipboard", getreg("\""))<CR>

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
" }

" Center on search term, diff
nmap n nzz
nmap N Nzz
nmap ]c ]czz
nmap [c [czz

" Saving stuff
cmap w!! w !sudo tee % >/dev/null
nmap ,ww! :w<CR>:bw<CR>
cmap ww!<CR> w<CR>:bw<CR>
" Wut
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
"Markdown header make
nnoremap <Leader>MHm yypVr=k0
"Markdown header fix
nnoremap <Leader>MHf yyjVpVr=k0
"Markdown header unmake
nnoremap <Leader>MHu j"_ddk0
"Markdown minor header make
nnoremap <Leader>Mhm yypVr-k0
"Markdown minor header fix
nnoremap <Leader>Mhf yyjVpVr-k0
"Markdown minor header unmake
nnoremap <Leader>Mhu j"_ddk0

" Remove whitespace
nnoremap <silent> <F5> mm:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>'m

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
cnoremap <C-A> <Home>
cnoremap <C-D> <delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
set cedit=

" Substitution stuff!
vnoremap <Leader>s<Space> y:%S/<C-R>"/
vnoremap <Leader>ss y:%S/<C-R>"/<C-R>"/g
nnoremap <Leader>sc :%S/\<<C-R><C-W>\>/

" Session stuff!
let g:session_autoload = 'no'
let g:session_autosave = 'no'
set sessionoptions=blank,curdir,folds,tabpages,winsize
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

" Execute viml
nnoremap <Leader>e. :execute getline(".")<CR>
nnoremap <Leader>er : <C-R>"<CR>

" Use local bundles if available
source /home/james/.vimrc.bundles

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
hi Search             ctermfg=White         ctermbg=DarkRed
hi Visual             ctermfg=DarkRed       ctermbg=White
hi vimLineComment     ctermfg=LightBlue
hi NonText            ctermfg=DarkRed
hi DiffAdd            ctermfg=Yellow        ctermbg=None
hi DiffChange         ctermfg=Yellow        ctermbg=None
hi DiffDelete         ctermfg=Yellow        ctermbg=None
hi DiffText           ctermfg=None          ctermbg=DarkGray
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

" Bsc/Csv stuff
au! BufNewFile,BufRead *.bsv set filetype=csv
nnoremap <Leader>qw :WhatColumn<CR>
nnoremap <Leader>qW :WhatColumn!<CR>
nnoremap <Leader>qc :NrColumns<CR>
nnoremap <Leader>qs :SearchInColumn<Space>
nnoremap <Leader>qh :HiColumn<CR>
nnoremap <Leader>qH :HiColumn!<CR>
nmap <Leader>qd :let g:csv_delim=''<C-B>
nnoremap <silent> <Leader>qS :above new<CR>:res 3<CR>:setl scrollbind buftype=nofile<CR><C-W>j:setl scrollbind sbo=hor<CR>:CSVTabularize<CR>ggVjjd<C-W>kVp<C-W>j
" Fast horizontal navigation
nnoremap <Esc>H zH
nnoremap <Esc>L zL
nnoremap <Esc>J 25zh
nnoremap <Esc>K 25zl
" Or maybe:
"nnoremap <C-B> zH
"nnoremap <C-F> zL
"nnoremap <Esc>J 15jzz
"nnoremap <Esc>K 15kzz
"nnoremap <Esc>H 25zh
"nnoremap <Esc>L 25zl

" Regbuf stuff
nnoremap <Leader>sr :RegbufOpen<CR>

" Resource and re-Filetype temp. hack...
nnoremap <Leader>R <Nop>
nnoremap <Leader>RR :source /home/james/.vimrc<CR>:execute "setf ".&filetype<CR>

" Disgusting hack...
function! SacrificialTabRedraw()
  exec ':tabnew'
  exec ':redraw'
  exec ':bw'
endfunction
nnoremap <Leader>TR :call SacrificialTabRedraw()<CR>

" Swap parameters (,-seperated, in parens)
nnoremap <F14> /[,)]<C-I>hv?[ (]<C-I>l
nmap <Plug>MoveParamRight <F14>"yy<F14>dll<F14>pF,P0/<C-T>y<C-I>
      \:call repeat#set("\<Plug>MoveParamLeft")<CR>
nmap <Plug>MoveParamLeft <F14>"yy<F14>dhhh<F14>pllp0/<C-T>y<C-I>
      \:call repeat#set("\<Plug>MoveParamRight")<CR>
nmap <Leader>< <Plug>MoveParamLeft
nmap <Leader>> <Plug>MoveParamRight

" Undo and redo (useful for 'undo paste numbered register and paste next number register')
" Note that <C-_> is actually accessed with <C-7>!
map <C-_> u.

" Give S back to sneak and ,S to surround
let g:surround_no_mappings = 1
xmap S <Plug>Sneak_S
xmap <Leader>S <Plug>VSurround
" Largely defaults below
nmap ds  <Plug>Dsurround
nmap cs  <Plug>Csurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap gS  <Plug>VgSurround
imap <C-S> <Plug>Isurround
imap <C-G>s <Plug>Isurround
imap <C-G>S <Plug>ISurround

" Delete only braces [and their lines] (and indent)
"Set marks and highlight between
nnoremap <F15> mm%mpkVj%moj
nmap <Leader>%v <F15>
"Set marks and go back
nmap <F16> <F15><Esc>`m
"Indent between and go back
nmap <F17> <F15><<Esc>`m
nmap <Leader>%<< <F17>
"Delete brackets [and more] [and indent between]
nmap <Leader>%d <F16>`pdd`ox`m<F5>
nmap <Leader>%<d <F17>`pdd`ox`m<F5>
nmap <Leader>%x <F16>`px`ox`m<F5>
nmap <Leader>%<x <F17>`px`ox`m<F5>
nmap <Leader>%D <F17>`pdd`odd
nmap <Leader>%hd <F15>`pdd`old0
nnoremap <Leader>%fd diw%x``x

function! CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

" Modify selected text using combining diacritics
command! -range -nargs=0 Overline        call CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call CombineSelection(<line1>, <line2>, '0336')
"vnoremap <Leader>z :Overline<CR>
"vnoremap <C-K> <C-K>

" Merge stuff!
" Search for merge conflics
nnoremap <Leader>? /^[<=>]\{7\}[^<=>]*$<CR>
" Obtain merge diffs
nnoremap dOR :diffg REMOTE<CR>
nnoremap dOB :diffg BASE<CR>
nnoremap dOL :diffg LOCAL<CR>
nnoremap dU :diffupdate<CR>

" Scalding stuff
nmap <Leader>HC :%s/ *\.incrementCounter(\([^")]*"[^"]*"[^")]*\)*)\n\?//ge<CR><F5>

" Last buffer more easily
nmap  <C-^>

" Search stuff!
vnoremap <Leader>/ yq/VpA\/<ESC>V:s/\\/\\\\/g<CR>V:s/\//\\\//g<CR>I\V<ESC>$hhhD<CR>

" No mouse scrolling
map <Up> <F18>
map <S-Up> <F18>
map <C-Up> <F18>
map <Down> <F18>
map <S-Down> <F18>
map <C-Down> <F18>
imap <Up> <Nop>
imap <S-Up> <Nop>
imap <C-Up> <Nop>
imap <Down> <Nop>
imap <S-Down> <Nop>
imap <C-Down> <Nop>
cmap <Up> <Nop>
cmap <S-Up> <Nop>
cmap <C-Up> <Nop>
cmap <Down> <Nop>
cmap <S-Down> <Nop>
cmap <C-Down> <Nop>

" Scala stuff
au! BufEnter *.scala setl formatprg=java\ -jar\ ~/bin/scalariform.jar\ -f\ -q\ +compactControlReadability\ +alignParameters\ +alignSingleLineCaseStatements\ +doubleIndentClassDeclaration\ +preserveDanglingCloseParenthesis\ +rewriteArrowSymbols\ +preserveSpaceBeforeArguments\ --stdin\ --stdout

" TODO: Delete these when I'm sure I don't need them. Definitely by July.
"let g:autoclose_vim_commentmode = 1
"let g:DisableAutoPHPFolding = 0
"let g:PIVAutoClose = 0
"let g:snips_author = 'James Blau <james@tresata.com>'
"let g:pymode_lint_checker = "pyflakes"
"let g:pymode_utils_whitespaces = 0
"let g:pymode_options = 0
"let g:autoclose_on = 0
"let s:autoclose_mapped = 0
"let b:match_ignorecase = 1

" TODO: Just a reminder to namespace mappings...
"autocmd FileType unite call s:unite_keymaps()
"function! s:unite_keymaps()
   "" Play nice with supertab
  "let b:SuperTabDisabled=1 
  "" Enable navigation with control-j and control-k in insert mode
  "imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  "imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
"endfunction`

au! BufNewFile,BufRead * set sw=2 ts=2 sts=2
