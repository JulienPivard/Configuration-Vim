" Vim fichier de coloration
" Maintainer:	PIVARD Julien <pivardjulien@gmail.com>
" Last Change:	mercredi 30 décembre 2015
" Inspiré par le colorscheme icansee de : David Schweikert <dws@ee.ethz.ch>
" Pour avoir les noms des groupes de coloration avec ce qu'il reconnaisse
" :h group-name

hi clear

let colors_name = "oldInterstellaire"

" Normal should come first
hi Normal       guifg=White         guibg=Black
hi Cursor       guifg=bg            guibg=fg
hi lCursor      guifg=NONE          guibg=Cyan
hi CursorLine   term=underline      cterm=underline     ctermbg=None    guibg=#222222
hi CursorColumn term=underline      cterm=underline     ctermbg=None    guibg=#222222

hi DiffAdd      ctermfg=White       ctermbg=DarkGreen      guibg=LightBlue
hi DiffChange   ctermfg=White       ctermbg=DarkMagenta    guibg=LightMagenta
hi DiffDelete   ctermfg=Red         ctermbg=DarkRed        gui=bold            guibg=Red
hi DiffText     ctermfg=White       ctermbg=DarkCyan       gui=bold            guifg=Blue  guibg=LightCyan
hi Directory    ctermfg=DarkBlue	    guifg=Blue
hi ErrorMsg     ctermfg=White	        ctermbg=DarkRed         guibg=Red	        guifg=White
hi FoldColumn   ctermfg=Grey            ctermbg=Black           guifg=darkyellow    guibg=#222222
hi Folded       ctermfg=Yellow          ctermbg=Black   	    guifg=darkyellow    guibg=#222222
hi IncSearch    cterm=reverse	        gui=reverse
hi Label        ctermfg=Yellow          guifg=yellow
hi LineNr       ctermfg=DarkYellow      guifg=Brown
hi CursorLineNr	ctermfg=Yellow          guifg=yellow
hi ModeMsg      cterm=bold	            gui=bold
hi MoreMsg      ctermfg=DarkGreen       gui=bold            guifg=SeaGreen
hi NonText      ctermfg=Magenta	        gui=bold            guifg=LightMagenta      guibg=Black
hi Operator     ctermfg=darkyellow      guifg=darkyellow
hi Exception    ctermfg=Red
hi Pmenu        guibg=LightBlue
hi PmenuSel     ctermfg=White	        ctermbg=DarkBlue    guifg=White     guibg=DarkBlue
hi Question     ctermfg=DarkGreen       gui=bold            guifg=SeaGreen
hi Repeat       ctermfg=Yellow          guifg=darkyellow
hi Search       ctermfg=Black           ctermbg=Yellow      guibg=Yellow    guifg=NONE
hi SpecialChar  ctermfg=Red             guifg=red
hi Character    cterm=bold  ctermfg=Green           guifg=green
hi SpecialKey   ctermfg=DarkBlue	    guifg=Blue
hi StatusLine   cterm=NONE              ctermbg=DarkYellow  ctermfg=0           gui=bold guifg=gold guibg=blue
hi StatusLineNC	cterm=NONE              ctermbg=DarkBlue    ctermfg=Yellow      gui=bold guifg=black guibg=blue
hi String       ctermfg=DarkGreen       guifg=darkgreen
hi Title        ctermfg=DarkMagenta     gui=bold            guifg=Magenta
hi VertSplit    cterm=bold              ctermfg=DarkCyan    ctermbg=Blue    gui=bold guifg=darkyellow guibg=black
hi Visual       ctermbg=NONE	        cterm=reverse       gui=reverse     guifg=Grey guibg=fg
hi VisualNOS    cterm=underline,bold    gui=underline,bold
hi WarningMsg   ctermfg=DarkRed	        guifg=Red
hi WildMenu     ctermfg=Black	        ctermbg=Magenta     guibg=Yellow    guifg=Black

" syntax highlighting
hi Todo         ctermbg=Cyan
hi MatchParen   ctermfg=DarkGreen   ctermbg=DarkBlue
hi ModeMsg      ctermfg=Red
hi Comment      cterm=NONE          ctermfg=DarkBlue        gui=NONE            guifg=darkblue
hi Constant     cterm=NONE          ctermfg=DarkRed         gui=NONE            guifg=darkred
hi Identifier   cterm=NONE          ctermfg=DarkCyan        gui=NONE            guifg=cyan4
hi Function     cterm=NONE          ctermfg=DarkCyan        gui=NONE            guifg=cyan4
hi PreProc      cterm=NONE          ctermfg=DarkMagenta     gui=NONE            guifg=magenta3
hi Special      cterm=bold          ctermfg=Red             gui=bold            guifg=red
hi Statement    cterm=bold          ctermfg=Blue	        gui=bold            guifg=darkcyan
hi Type	        cterm=underline     ctermfg=darkgreen       gui=underline       guifg=green
hi phpMemberSelector    cterm=underline     ctermfg=DarkYellow      gui=underline       guifg=yellow

" Pour TagBar
hi TagbarSignature  ctermfg=darkyellow
hi SpellBad         cterm=underline,italic     ctermbg=234             guibg=Red    guifg=NONE

" Pour la documentation doxygen
hi doxygenErrorComment	ctermfg=White	ctermbg=DarkRed     guibg=Red	guifg=White

" Pour syntastic
hi SyntasticWarningSign     ctermbg=Yellow  ctermfg=Black
" Pour signify
hi SignColumn               ctermbg=Black
hi SignifySignAdd     ctermbg=Black  ctermfg=DarkGreen
hi SignifySignDelete  ctermbg=Black  ctermfg=DarkRed
hi SignifySignChange  ctermbg=Black  ctermfg=DarkMagenta

" Pour la coloration de la statusLine
hi User1 term=reverse,bold  cterm=reverse,bold  ctermfg=Red         gui=inverse,bold    guifg=red
hi User2 term=reverse,bold  cterm=reverse,bold  ctermfg=Cyan        gui=inverse,bold    guifg=cyan
hi User3 term=NONE  cterm=NONE  ctermfg=DarkGreen   gui=inverse,bold    guifg=green
hi User4 term=NONE  cterm=NONE  ctermfg=DarkRed     gui=inverse,bold    guifg=red
hi User5 term=NONE  cterm=NONE  ctermfg=DarkMagenta gui=inverse,bold    guifg=magenta
hi User6 term=NONE  cterm=NONE  ctermfg=Yellow      ctermbg=DarkYellow
