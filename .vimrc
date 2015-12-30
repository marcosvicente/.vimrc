execute pathogen#infect()

"Aparecer numeros"
set number

"Pesquisa"
set incsearch
set ignorecase
set hlsearch
set smartcase  - use case if any caps used 


" colorizer.vim	Colorize all text in the form #rrggbb or #rgb; entrance

if exists("loaded_colorizer") || v:version < 700 || !(has("gui_running") || &t_Co == 256)
  finish
endif
let loaded_colorizer = 1

let s:save_cpo = &cpo
set cpo&vim

"Define commands {{{1
if !exists('g:colorizer_maxlines')
  let g:colorizer_maxlines = -1
endif
command! -bar -bang ColorHighlight call colorizer#ColorHighlight(1, "<bang>")
command! -bar ColorClear call colorizer#ColorClear()
command! -bar ColorToggle call colorizer#ColorToggle()
nnoremap <silent> <Plug>Colorizer :ColorToggle<CR>
if !hasmapto("<Plug>Colorizer") && (!exists("g:colorizer_nomap") || g:colorizer_nomap == 0)
  nmap <unique> <Leader>tc <Plug>Colorizer
endif
if !exists('g:colorizer_startup') || g:colorizer_startup
  call colorizer#ColorHighlight(0)
endif

" Cleanup and modelines {{{1
let &cpo = s:save_cpo
" vim:ft=vim:fdm=marker:fmr={{{,}}}:

"syntastic
let g:syntastic_c_checkers=['make','splint']

" =============
" NerdTree
" ============
let Tlist_Use_Right_Window = 1
let NERDTreeQuitOnOpen = 0
let NERDTreeIgnore=['.pyc$[[file]]','.gitignore$[[dir]]']
let g:nerdtree_tabs_open_on_gui_startup = 1
map <F5> :NERDTreeToggle<cr>
vmap <F5> <esc>:NERDTreeToggle<cr>
imap <F5> <esc>:NERDTreeToggle<cr>
map <leader>nt :NERDTreeToggle<cr>
vmap <leader>nt <esc>:NERDTreeToggle<cr>
imap <leader>nt <esc>:NERDTreeToggle<cr>

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let g:pymode_run = 0
let g:pymode_folding=0
let g:pymode_lint_checker="pyflakes,pep8"
let g:pymode_lint_ignore="N4,E12,E711,E712,E721,E502"
 
let g:pymode_rope_enable_shortcuts=0
let pymode_rope_vim_completion=0
let pymode_rope_extended_complete=0
"let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_goto_def_newwin="new"
let g:pymode_rope_guess_project = 1
let g:pymode_rope = 1

" Desabilitar menus:
set guioptions-=m
set guioptions-=r
set guioptions-=T

" Limpar os resultados destacados:
nmap <silent> <C-C> :silent noh<CR>


" Tabs por espaços:
set expandtab
set shiftwidth=4
set tabstop=4

"Regua e quebra de linhas, linhas"
set linebreak
set number
set ruler
set showbreak=...
set wrap linebreak nolist

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible


" Clipboard do sistema:
set clipboard=unnamed

" Salvar:
nmap <silent> <C-S> :silent w<CR>

"Auto completar"
set omnifunc=htmlcomplete#CompleteTags
set omnifunc=csscomplete#CompleteCSS
set omnifunc=javascriptcomplete#CompleteJS
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"



"Fonte e janela:
set guifont=Monospace\ 13
set encoding=utf-8
set lines=36 columns=142
set wildmenu

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif




"Thema"
set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "jellybeans"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
  let s:low_color = 0
else
  let s:low_color = 1
endif

" Color approximation functions by Henry So, Jr. and David Liang {{{
" Added to jellybeans.vim by Daniel Herbert

" returns an approximate grey index for the given grey level
fun! s:grey_number(x)
  if &t_Co == 88
    if a:x < 23
      return 0
    elseif a:x < 69
      return 1
    elseif a:x < 103
      return 2
    elseif a:x < 127
      return 3
    elseif a:x < 150
      return 4
    elseif a:x < 173
      return 5
    elseif a:x < 196
      return 6
    elseif a:x < 219
      return 7
    elseif a:x < 243
      return 8
    else
      return 9
    endif
  else
    if a:x < 14
      return 0
    else
      let l:n = (a:x - 8) / 10
      let l:m = (a:x - 8) % 10
      if l:m < 5
        return l:n
      else
        return l:n + 1
      endif
    endif
  endif
endfun

" returns the actual grey level represented by the grey index
fun! s:grey_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 46
    elseif a:n == 2
      return 92
    elseif a:n == 3
      return 115
    elseif a:n == 4
      return 139
    elseif a:n == 5
      return 162
    elseif a:n == 6
      return 185
    elseif a:n == 7
      return 208
    elseif a:n == 8
      return 231
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 8 + (a:n * 10)
    endif
  endif
endfun

" returns the palette index for the given grey index
fun! s:grey_color(n)
  if &t_Co == 88
    if a:n == 0
      return 16
    elseif a:n == 9
      return 79
    else
      return 79 + a:n
    endif
  else
    if a:n == 0
      return 16
    elseif a:n == 25
      return 231
    else
      return 231 + a:n
    endif
  endif
endfun

" returns an approximate color index for the given color level
fun! s:rgb_number(x)
  if &t_Co == 88
    if a:x < 69
      return 0
    elseif a:x < 172
      return 1
    elseif a:x < 230
      return 2
    else
      return 3
    endif
  else
    if a:x < 75
      return 0
    else
      let l:n = (a:x - 55) / 40
      let l:m = (a:x - 55) % 40
      if l:m < 20
        return l:n
      else
        return l:n + 1
      endif
    endif
  endif
endfun

" returns the actual color level for the given color index
fun! s:rgb_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 139
    elseif a:n == 2
      return 205
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 55 + (a:n * 40)
    endif
  endif
endfun

" returns the palette index for the given R/G/B color indices
fun! s:rgb_color(x, y, z)
  if &t_Co == 88
    return 16 + (a:x * 16) + (a:y * 4) + a:z
  else
    return 16 + (a:x * 36) + (a:y * 6) + a:z
  endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun! s:color(r, g, b)
  " get the closest grey
  let l:gx = s:grey_number(a:r)
  let l:gy = s:grey_number(a:g)
  let l:gz = s:grey_number(a:b)

  " get the closest color
  let l:x = s:rgb_number(a:r)
  let l:y = s:rgb_number(a:g)
  let l:z = s:rgb_number(a:b)

  if l:gx == l:gy && l:gy == l:gz
    " there are two possibilities
    let l:dgr = s:grey_level(l:gx) - a:r
    let l:dgg = s:grey_level(l:gy) - a:g
    let l:dgb = s:grey_level(l:gz) - a:b
    let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
    let l:dr = s:rgb_level(l:gx) - a:r
    let l:dg = s:rgb_level(l:gy) - a:g
    let l:db = s:rgb_level(l:gz) - a:b
    let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
    if l:dgrey < l:drgb
      " use the grey
      return s:grey_color(l:gx)
    else
      " use the color
      return s:rgb_color(l:x, l:y, l:z)
    endif
  else
    " only one possibility
    return s:rgb_color(l:x, l:y, l:z)
  endif
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun! s:rgb(rgb)
  let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
  let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
  let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
  return s:color(l:r, l:g, l:b)
endfun

" sets the highlighting for the given group
fun! s:X(group, fg, bg, attr, lcfg, lcbg)
  if s:low_color
    let l:fge = empty(a:lcfg)
    let l:bge = empty(a:lcbg)

    if !l:fge && !l:bge
      exec "hi ".a:group." ctermfg=".a:lcfg." ctermbg=".a:lcbg
    elseif !l:fge && l:bge
      exec "hi ".a:group." ctermfg=".a:lcfg." ctermbg=NONE"
    elseif l:fge && !l:bge
      exec "hi ".a:group." ctermfg=NONE ctermbg=".a:lcbg
    endif
  else
    let l:fge = empty(a:fg)
    let l:bge = empty(a:bg)

    if !l:fge && !l:bge
      exec "hi ".a:group." guifg=#".a:fg." guibg=#".a:bg." ctermfg=".s:rgb(a:fg)." ctermbg=".s:rgb(a:bg)
    elseif !l:fge && l:bge
      exec "hi ".a:group." guifg=#".a:fg." guibg=NONE ctermfg=".s:rgb(a:fg)." ctermbg=NONE"
    elseif l:fge && !l:bge
      exec "hi ".a:group." guifg=NONE guibg=#".a:bg." ctermfg=NONE ctermbg=".s:rgb(a:bg)
    endif
  endif

  if a:attr == ""
    exec "hi ".a:group." gui=none cterm=none"
  else
    let l:noitalic = join(filter(split(a:attr, ","), "v:val !=? 'italic'"), ",")
    if empty(l:noitalic)
      let l:noitalic = "none"
    endif
    exec "hi ".a:group." gui=".a:attr." cterm=".l:noitalic
  endif
endfun
" }}}

if !exists("g:jellybeans_background_color")
  let g:jellybeans_background_color = "151515"
end

call s:X("Normal","e8e8d3",g:jellybeans_background_color,"","White","")
set background=dark

if !exists("g:jellybeans_use_lowcolor_black") || g:jellybeans_use_lowcolor_black
    let s:termBlack = "Black"
else
    let s:termBlack = "Grey"
endif

if version >= 700
  call s:X("CursorLine","","1c1c1c","","",s:termBlack)
  call s:X("CursorColumn","","1c1c1c","","",s:termBlack)
  call s:X("MatchParen","ffffff","556779","bold","","DarkCyan")

  call s:X("TabLine","000000","b0b8c0","italic","",s:termBlack)
  call s:X("TabLineFill","9098a0","","","",s:termBlack)
  call s:X("TabLineSel","000000","f0f0f0","italic,bold",s:termBlack,"White")

  " Auto-completion
  call s:X("Pmenu","ffffff","606060","","White",s:termBlack)
  call s:X("PmenuSel","101010","eeeeee","",s:termBlack,"White")
endif

call s:X("Visual","","404040","","",s:termBlack)
call s:X("Cursor",g:jellybeans_background_color,"b0d0f0","","","")

call s:X("LineNr","605958",g:jellybeans_background_color,"none",s:termBlack,"")
call s:X("CursorLineNr","ccc5c4","","none","White","")
call s:X("Comment","888888","","italic","Grey","")
call s:X("Todo","c7c7c7","","bold","White",s:termBlack)

call s:X("StatusLine","000000","dddddd","italic","","White")
call s:X("StatusLineNC","ffffff","403c41","italic","White","Black")
call s:X("VertSplit","777777","403c41","",s:termBlack,s:termBlack)
call s:X("WildMenu","f0a0c0","302028","","Magenta","")

call s:X("Folded","a0a8b0","384048","italic",s:termBlack,"")
call s:X("FoldColumn","535D66","1f1f1f","","",s:termBlack)
call s:X("SignColumn","777777","333333","","",s:termBlack)
call s:X("ColorColumn","","000000","","",s:termBlack)

call s:X("Title","70b950","","bold","Green","")

call s:X("Constant","cf6a4c","","","Red","")
call s:X("Special","799d6a","","","Green","")
call s:X("Delimiter","668799","","","Grey","")

call s:X("String","99ad6a","","","Green","")
call s:X("StringDelimiter","556633","","","DarkGreen","")

call s:X("Identifier","c6b6ee","","","LightCyan","")
call s:X("Structure","8fbfdc","","","LightCyan","")
call s:X("Function","fad07a","","","Yellow","")
call s:X("Statement","8197bf","","","DarkBlue","")
call s:X("PreProc","8fbfdc","","","LightBlue","")

hi! link Operator Structure

call s:X("Type","ffb964","","","Yellow","")
call s:X("NonText","606060",g:jellybeans_background_color,"",s:termBlack,"")

call s:X("SpecialKey","444444","1c1c1c","",s:termBlack,"")

call s:X("Search","f0a0c0","302028","underline","Magenta","")

call s:X("Directory","dad085","","","Yellow","")
call s:X("ErrorMsg","","902020","","","DarkRed")
hi! link Error ErrorMsg
hi! link MoreMsg Special
call s:X("Question","65C254","","","Green","")


" Spell Checking

call s:X("SpellBad","","902020","underline","","DarkRed")
call s:X("SpellCap","","0000df","underline","","Blue")
call s:X("SpellRare","","540063","underline","","DarkMagenta")
call s:X("SpellLocal","","2D7067","underline","","Green")

" Diff

hi! link diffRemoved Constant
hi! link diffAdded String

" VimDiff

call s:X("DiffAdd","D2EBBE","437019","","White","DarkGreen")
call s:X("DiffDelete","40000A","700009","","DarkRed","DarkRed")
call s:X("DiffChange","","2B5B77","","White","DarkBlue")
call s:X("DiffText","8fbfdc","000000","reverse","Yellow","")

" PHP

hi! link phpFunctions Function
call s:X("StorageClass","c59f6f","","","Red","")
hi! link phpSuperglobal Identifier
hi! link phpQuoteSingle StringDelimiter
hi! link phpQuoteDouble StringDelimiter
hi! link phpBoolean Constant
hi! link phpNull Constant
hi! link phpArrayPair Operator
hi! link phpOperator Normal
hi! link phpRelation Normal
hi! link phpVarSelector Identifier

" Python

hi! link pythonOperator Statement

" Ruby

hi! link rubySharpBang Comment
call s:X("rubyClass","447799","","","DarkBlue","")
call s:X("rubyIdentifier","c6b6fe","","","Cyan","")
hi! link rubyConstant Type
hi! link rubyFunction Function

call s:X("rubyInstanceVariable","c6b6fe","","","Cyan","")
call s:X("rubySymbol","7697d6","","","Blue","")
hi! link rubyGlobalVariable rubyInstanceVariable
hi! link rubyModule rubyClass
call s:X("rubyControl","7597c6","","","Blue","")

hi! link rubyString String
hi! link rubyStringDelimiter StringDelimiter
hi! link rubyInterpolationDelimiter Identifier

call s:X("rubyRegexpDelimiter","540063","","","Magenta","")
call s:X("rubyRegexp","dd0093","","","DarkMagenta","")
call s:X("rubyRegexpSpecial","a40073","","","Magenta","")

call s:X("rubyPredefinedIdentifier","de5577","","","Red","")

" Erlang

hi! link erlangAtom rubySymbol
hi! link erlangBIF rubyPredefinedIdentifier
hi! link erlangFunction rubyPredefinedIdentifier
hi! link erlangDirective Statement
hi! link erlangNode Identifier

" JavaScript

hi! link javaScriptValue Constant
hi! link javaScriptRegexpString rubyRegexp

" CoffeeScript

hi! link coffeeRegExp javaScriptRegexpString

" Lua

hi! link luaOperator Conditional

" C

hi! link cFormat Identifier
hi! link cOperator Constant

" Objective-C/Cocoa

hi! link objcClass Type
hi! link cocoaClass objcClass
hi! link objcSubclass objcClass
hi! link objcSuperclass objcClass
hi! link objcDirective rubyClass
hi! link objcStatement Constant
hi! link cocoaFunction Function
hi! link objcMethodName Identifier
hi! link objcMethodArg Normal
hi! link objcMessageName Identifier

" Vimscript

hi! link vimOper Normal

" HTML

hi! link htmlTag Statement
hi! link htmlEndTag htmlTag
hi! link htmlTagName htmlTag

" XML

hi! link xmlTag Statement
hi! link xmlEndTag xmlTag
hi! link xmlTagName xmlTag
hi! link xmlEqual xmlTag
hi! link xmlEntity Special
hi! link xmlEntityPunct xmlEntity
hi! link xmlDocTypeDecl PreProc
hi! link xmlDocTypeKeyword PreProc
hi! link xmlProcessingDelim xmlAttrib

" Debugger.vim

call s:X("DbgCurrent","DEEBFE","345FA8","","White","DarkBlue")
call s:X("DbgBreakPt","","4F0037","","","DarkMagenta")

" vim-indent-guides

if !exists("g:indent_guides_auto_colors")
  let g:indent_guides_auto_colors = 0
endif
call s:X("IndentGuidesOdd","","232323","","","")
call s:X("IndentGuidesEven","","1b1b1b","","","")

" Plugins, etc.

hi! link TagListFileName Directory
call s:X("PreciseJumpTarget","B9ED67","405026","","White","Green")

if !exists("g:jellybeans_background_color_256")
  let g:jellybeans_background_color_256=233
end
" Manual overrides for 256-color terminals. Dark colors auto-map badly.
if !s:low_color
  hi StatusLineNC ctermbg=235
  hi Folded ctermbg=236
  hi FoldColumn ctermbg=234
  hi SignColumn ctermbg=236
  hi CursorColumn ctermbg=234
  hi CursorLine ctermbg=234
  hi SpecialKey ctermbg=234
  exec "hi NonText ctermbg=".g:jellybeans_background_color_256
  exec "hi LineNr ctermbg=".g:jellybeans_background_color_256
  hi DiffText ctermfg=81
  exec "hi Normal ctermbg=".g:jellybeans_background_color_256
  hi DbgBreakPt ctermbg=53
  hi IndentGuidesOdd ctermbg=235
  hi IndentGuidesEven ctermbg=234
endif

if exists("g:jellybeans_overrides")
  fun! s:load_colors(defs)
    for [l:group, l:v] in items(a:defs)
      call s:X(l:group, get(l:v, 'guifg', ''), get(l:v, 'guibg', ''),
      \                 get(l:v, 'attr', ''),
      \                 get(l:v, 'ctermfg', ''), get(l:v, 'ctermbg', ''))
      if !s:low_color
        for l:prop in ['ctermfg', 'ctermbg']
          let l:override_key = '256'.l:prop
          if has_key(l:v, l:override_key)
            exec "hi ".l:group." ".l:prop."=".l:v[l:override_key]
          endif
        endfor
      endif
      unlet l:group
      unlet l:v
    endfor
  endfun
  call s:load_colors(g:jellybeans_overrides)
  delf s:load_colors
endif

" delete functions {{{
delf s:X
delf s:rgb
delf s:color
delf s:rgb_color
delf s:rgb_level
delf s:rgb_number
delf s:grey_color
delf s:grey_level
delf s:grey_number
set runtimepath^=~/.vim/bundle/ag
