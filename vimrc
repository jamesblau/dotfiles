" vim: set sw=2 ts=2 sts=2 expandtab ft=vim
set nocompatible

"let g:james_minimal_plugins=1
let mapleader = ","
nnoremap \ ,

set background=dark
set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
set expandtab                   " Tabs are spaces, not tabs
set foldenable                  " Auto fold code
set foldtext=MyFoldText()
set cedit=                    " Key to open command-line window
set hidden                      " Allow buffer switching without saving
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set lazyredraw
set linespace=0                 " No extra spaces between rows
set list
set matchpairs+=<:>             " Match, to be used with %
set matchtime=2
set mouse=
set mousehide                   " Hide the mouse cursor while typing
set nobackup                    " Not sure about this one
set nocursorline
set nohlsearch
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set nospell
set noswapfile                  " Not sure about this one
set nowrap
set omnifunc=syntaxcomplete#Complete
set scrolljump=-9               " Lines to scroll when cursor leaves screen
set shortmess+=filmnrxoOtT      " Abbrev. of messages (avoids 'hit enter')
set showmatch                   " Show matching brackets/parenthesis
set showmode                    " Display the current mode
set smartcase                   " Case sensitive when uc present
set splitbelow                  " Puts new split windows to the bottom of the current
set splitright                  " Puts new vsplit windows to the right of the current
set switchbuf=useopen
set t_Co=256
set textwidth=0
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore         " Allow for cursor beyond last character
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set winminheight=0              " Windows can be 0 lines high

" Use local bundles if available
source /home/james/dotfiles/vimrc.bundles

" Enforce alt consistency between vim and nvim
if !has('nvim')
  for c in ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
    execute 'nmap <Esc>'.c.' <A-'.c.'>'
    execute 'cmap <Esc>'.c.' <A-'.c.'>'
    execute 'nmap <Esc><C-'.c.'> <C-A-'.c.'>'
    execute 'cmap <Esc><C-'.c.'> <C-A-'.c.'>'
  endfor
endif

" Override vim-sensible
runtime! plugin/sensible.vim
set listchars=tab:›\ ,trail:•,extends:>,precedes:<,nbsp:⚪
set notimeout nottimeout
set nrformats=
set scrolloff=3

" Tags stuff
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if findfile(".tags", ".;") =~ "tags"
  set tags=./.tags;/
elseif gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/.tags'
    let &tags = &tags . ',' . gitroot . '/.git/tags'
    let &tags = &tags . ',' . gitroot . '/.tags'
    let &tags = &tags . ',' . gitroot . '/tags'
endif

if has('persistent_undo')
  set undofile
  set undodir=~/.vimundo//
  set undolevels=1000
  set undoreload=10000
endif

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

" Incremement character under cursor only
nnoremap <Leader>ic a <C-C>h<C-A>lxh

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

" Break lines
nmap <Leader>m i<CR><C-C><F5>
nmap <Leader>M a<CR><C-C><F5>

" Yank and Pasting stuff
cnoremap <C-T> <C-R>
nnoremap <Leader>p <Nop>
nnoremap <Leader>pl mm$p`m
nnoremap <Leader>pL mmA<Space><C-C>p`m
nnoremap <Leader>ph mm0P`m
nnoremap <Leader>pH mmI<Space><C-C>P`m
nnoremap <Leader>pj mmo<C-C>p`m
nnoremap <Leader>pJ mm3o<C-C>kp`m
nnoremap <Leader>pk mmO<C-C>p`m
nnoremap <Leader>pK mm3O<C-C>kp`m
nnoremap <Leader>pp mm)O<CR><C-R>"<C-C>`m
nnoremap <Leader>pP mm(O<C-R>"<CR><C-C>`m

if v:version > 702
  " Keep window position
  au! BufLeave * let b:winview = winsaveview()
  au! BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
  " JSON
  nmap <Leader>jp :%!underscore print<CR>:set filetype=json<CR><F5>
  nmap <Leader>jt :%!python -mjson.tool<CR>:set filetype=json<CR><F5>
  vmap <Leader>jp :!underscore print<CR>:set filetype=json<CR><F5>
  vmap <Leader>jt :!python -mjson.tool<CR>:set filetype=json<CR><F5>
else
  " JSON
  nmap <Leader>jt :%!python2.6 -mjson.tool<CR>:set filetype=json<CR><F5>
  vmap <Leader>jt :!python -mjson.tool<CR>:set filetype=json<CR><F5>
  if !has('nvim')
    " Backspace whatever. hack...
    inoremap  <BS>
  endif
endif
if v:version >= 704
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
  " NumberToggle
  function! NumberToggle()
    if(&rnu == 1 && &nu == 1)
      set nonumber
    else
      set number
    endif
  endfunction
  set number
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
  echom &diffopt &diffexpr
endfunction

function! DiffWToggleRegex()
  set diffopt+=iwhite
  set diffexpr=DiffW()
  echom &diffopt &diffexpr
endfunction

function! ShowBreakToggle()
  if(&showbreak == g:james_showbreak)
    set showbreak=
  else
    let &showbreak=g:james_showbreak
  endif
endfunction

function! TabSpaces()
  let l:char=nr2char(getchar())
  if(l:char == 'r')
    execute ":retab"
  else
    let l:num=l:char+0
    setl expandtab
    let &l:sw=l:num
    let &l:ts=l:num
    let &l:sts=l:num
  endif
endfunction

function! RegisterFromUnnamed()
  let l:char=nr2char(getchar())
  execute ":let @" . l:char . "=@\""
endfunction

function! UnnamedFromRegister()
  let l:char=nr2char(getchar())
  execute ":let @\"=@" . l:char
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
nnoremap <Leader>sc :set spell!<CR>
nnoremap <Leader>sp :set paste!<CR>
nnoremap <Leader>sl :set cursorline! \| set cursorcolumn!<CR>
nnoremap <expr> <Leader>st ":call TabSpaces()<CR>"
nnoremap <Leader>sw :set wrap!<CR>
nnoremap <Leader>sW :windo set wrap!<CR>
nnoremap <silent> <Leader>/ :set invhlsearch<CR>
nnoremap <Leader>sz :set foldmethod=manual<CR>

" Break-lines stuff
let g:james_showbreak=repeat('>',2)
let &showbreak=g:james_showbreak
nnoremap <Leader>sb :call ShowBreakToggle()<CR>

" Add/subtract stuff
function! AddSubtract(char, back)
  let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
  call search(pattern, 'cw' . a:back)
  execute 'normal! ' . v:count1 . a:char
  silent! call repeat#set(":\<C-U>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction
nnoremap <silent> <C-A> :<C-U>call AddSubtract("\<C-A>", '')<CR>
nnoremap <silent> <A-a>   :<C-U>call AddSubtract("\<C-A>", 'b')<CR>
nnoremap <silent> <C-X> :<C-U>call AddSubtract("\<C-X>", '')<CR>
nnoremap <silent> <A-x>   :<C-U>call AddSubtract("\<C-X>", 'b')<CR>

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
nnoremap <C-A-J> :call SmoothDown()<CR>
nnoremap <C-A-K> :call SmoothUp()<CR>
" Tab stuff
nnoremap <A-i>     :bp<CR>
nnoremap <A-o>     :bn<CR>
nnoremap <A-h>     :tabmove -1<CR>
nnoremap <A-l>     :tabmove +1<CR>
" Smart Tab, (Window), Buffer stuff
nnoremap <A-j>     :call PrevTWorB()<CR>
nnoremap <A-k>     :call NextTWorB()<CR>
" Numbered buffers and tabs
for n in range(1, 9)
  execute 'nnoremap <A-'.n.'> :call NumTorB('.n.')<CR>'
endfor
nnoremap <A-0> :call NumTorB(10)<CR>
" <C-C> is unsafe in mappings
inoremap <C-C> <Esc><Esc>

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

" Register stuff!
" {{{
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
nnoremap <Leader>D :call setreg("\"",system("xclip -o -selection clipboard"))<CR>
"xclip from register
nnoremap <Leader>F :call system("xclip -i -selection clipboard", getreg("\""))<CR>
"Swap registers
nnoremap <expr> <Leader>R ":call RegisterFromUnnamed()<CR>"
nnoremap <expr> <Leader>U ":call UnnamedFromRegister()<CR>"

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
" }}}

" Center on search term, diff
nmap n nzz
nmap N Nzz
nnoremap <A-n> n
nnoremap <A-N> N
nmap ]c ]czz
nmap [c [czz
nnoremap <A-c> ]c
nnoremap <A-C> [c

" Saving stuff
cmap w!! w !sudo tee % >/dev/null
nmap ,ww! :w<CR>:bw<CR>
cmap ww!<CR> w<CR>:bw<CR>
" Wut
nmap ,w!w!w! :w!!<CR>ll:bw<CR>
cmap w!w!w! :w!!<CR>ll:bw<CR>

" Header stuff
"Header make
nnoremap <Leader>Hm ^i\|\|<Space><C-C>A<Space>\|\|<C-C>"qyy"qP"qD999a=<C-C>jhlk"qD"qyyj"qpqqqk^
"Header fix
nnoremap <Leader>Hf k999A=<C-C>jhlk"qD"qyyj"qpj"qddkkkqqqj^
"Header unmake
nnoremap <Leader>Hu k"qdd"qx"qx"qx$"qX"qX"qxj"qddqqqk^
"Minor header make
nnoremap <Leader>hm I\|__<Space><C-C>A<Space>__\|<C-C>yyPElv$Bhr<Space>^r<Space>$r<Space>x
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

" Bundles folding
"Create fold
nnoremap <Leader>BF yyo" }}}<C-C>k>>PI" <C-C>A {{{<C-C>j_
"Remove fold

" Remove whitespace
nnoremap <silent> <F5> mm:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>'m

" Emacs stuff!
inoremap <C-F> <right>
cnoremap <C-F> <Right>
inoremap <C-B> <left>
cnoremap <C-B> <Left>
cnoremap <C-A> <Home>
cnoremap <C-D> <delete>
cnoremap <A-b> <S-Left>
cnoremap <A-f> <S-Right>

" No accidental Ex-mode or keyword-lookup
nnoremap Q gggqG
nnoremap <Leader>Q Q
nnoremap K <Nop>
nnoremap <Leader>K K

" Execute viml
nnoremap <Leader>e. :execute getline(".")<CR>
nnoremap <Leader>er : <C-R>"<CR>

" Color stuff!
"let g:seoul256_background = 233
"colorscheme seoul256
let g:zenburn_old_Visual=1
let g:zenburn_alternate_Visual=1
let g:zenburn_high_Contrast=1
colorscheme zenburn
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"colorscheme transparent
"hi CursorLine         ctermfg=White         ctermbg=DarkRed     cterm=Bold
"hi SignColumn         ctermfg=Yellow        ctermbg=None
"hi LineNr             ctermfg=Yellow        ctermbg=None
"hi CursorLineNr       ctermfg=Yellow        ctermbg=None
"hi Normal             ctermfg=White
"hi Search             ctermfg=White         ctermbg=DarkRed
"hi Visual             ctermfg=DarkRed       ctermbg=White
"hi vimLineComment     ctermfg=LightBlue
"hi NonText            ctermfg=DarkRed
"hi DiffAdd            ctermfg=Yellow        ctermbg=None
"hi DiffChange         ctermfg=Yellow        ctermbg=None
"hi DiffDelete         ctermfg=Yellow        ctermbg=None
"hi DiffText           ctermfg=None          ctermbg=DarkGray
"hi GitGutterAdd                             ctermbg=None
"hi GitGutterChange                          ctermbg=None
"hi GitGutterChangeDeleteDefault             ctermbg=None
"hi GitGutterChangeLineDefault               ctermbg=None
"hi GitGutterDeleteLine                      ctermbg=None
"hi GitGutterAddDefault                      ctermbg=None
"hi GitGutterChangeDefault                   ctermbg=None
"hi GitGutterChangeDeleteLine                ctermbg=None
"hi GitGutterDelete                          ctermbg=None
"hi GitGutterAddLine                         ctermbg=None
"hi GitGutterChangeDelete                    ctermbg=None
"hi GitGutterChangeLine                      ctermbg=None
"hi GitGutterDeleteDefault                   ctermbg=None
"hi shDoubleQuote                            ctermbg=None
"hi MatchParen          cterm=undercurl,bold

" Check coloring
map <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
map <F9> :echo "hi<" . synIDattr(synID(line("."),col(".")+1,1),"name") . '> trans<' . synIDattr(synID(line("."),col(".")+1,0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col(".")+1,1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col(".")+1,1)),"fg#")<CR>

" Expand/collapse braces
nmap <Leader>{ 2yEysi{<C-J>/<C-T>"<CR>
nmap <Leader>} 2yE?{<CR>Jh%kJ?<C-T>"<CR>
nmap <Leader>( 2yEysi(<C-J>/<C-T>"<CR>
nmap <Leader>) 2yE?(<CR>J"_xh%kJ?<C-T>"<CR>
nmap <Leader>[ 2yEysi[<C-J>/<C-T>"<CR>
nmap <Leader>] 2yE?[<CR>J"_xh%kJx?<C-T>"<CR>

" swap j/gj, k/gk
noremap j gj
noremap k gk
noremap gj j
noremap gk k

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

" Diff stuff!
nnoremap <Leader>dt :windo diffo \| windo difft<CR>
nnoremap <Leader>do :windo diffo<CR>

" Scalding stuff
nmap <Leader>HC :%s/ *\.incrementCounter(\([^")]*"[^"]*"[^")]*\)*)\n\?//ge<CR><F5>

" Last buffer more easily
nmap <BS> <C-^>

" Search stuff!
vnoremap <Leader>/ y/<C-G>VpA\/<ESC>V:s/\\/\\\\/g<CR>V:s/\//\\\//g<CR>I\V<ESC>$hhhD<CR>

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

" Fast horizontal navigation
nnoremap <A-H> zH
nnoremap <A-L> zL
nnoremap <A-J> 25zh
nnoremap <A-K> 25zl
" Or maybe:
"nnoremap <C-B> zH
"nnoremap <C-F> zL
"nnoremap <A-J> 15jzz
"nnoremap <A-K> 15kzz
"nnoremap <A-H> 25zh
"nnoremap <A-L> 25zl

" Fold stuff
nmap <C-\> za
function! MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  let poorDevil = substitute(sub, '^\( *\)" ', '\1', '')
  let pad = repeat(' ', (winwidth(0)/2)-strlen(line)-strlen(v:folddashes))
  return poorDevil . v:folddashes . pad
endfunction

" Set syntax
nmap <Leader>tc :set ft=csv syn=csv<CR>
nmap <Leader>ts :set ft=scala syn=scala<CR>
nmap <Leader>td :set ft=drake syn=drake<CR>
nmap <Leader>t<Space> :set ft= syn= formatprg= <CR>

" TODO: Smaller buffer numbers: instead of creating a new buffer sometimes, open the lowest-numbered empty hidden buffer.
" TODO: Function to line up word under cursor with <count>th instance of same word on line above or below.
" TODO: <Leader>L<Something> for :arglocal uses

" TODO: Just a reminder to namespace mappings...
"autocmd FileType unite call s:unite_keymaps()
"function! s:unite_keymaps()
   "" Play nice with supertab
  "let b:SuperTabDisabled=1
  "" Enable navigation with control-j and control-k in insert mode
  "imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  "imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
"endfunction`

" Write to null (buffer doesn't look unsaved)
nnoremap <Leader>wn :w! /dev/null<CR>

" Redraw mapping
nnoremap <Leader><C-R> :redraw<CR>

" Once again protecting sneak...this doesn't seem to work in vimrc.bundles
if exists('g:yankstack_map_keys')
  call yankstack#setup()
  nmap s <Plug>Sneak_s
  nmap S <Plug>Sneak_S
  vmap s <Plug>Sneak_s
  vmap S <Plug>Sneak_S
  nmap Y y$
endif

au! BufNewFile,BufRead * set expandtab sw=2 ts=2 sts=2
