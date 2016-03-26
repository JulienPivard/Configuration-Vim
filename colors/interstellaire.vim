" Name:         Interstellaire
" Maintainer:   PIVARD Julien <pivardjulien@gmail.com>
" Last Change:  Vendredi 20 mars 2016
" Created:      1er janvier 2016
"
" Inspiré par le thème icansee de : David Schweikert <dws@ee.ethz.ch>
" et par le thème Solarized de : Ethan Schoonover <es@ethanschoonover.com>

" Initialisation du thème de couleurs. " (((
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

if !exists('interstellaire_termcolors')
    let g:interstellaire_termcolors = 0
endif

highlight clear
if exists('syntax_on')
  syntax reset
endif
let colors_name = 'interstellaire'

" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" )))


" Définition de la palette de couleurs " (((
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

if has('gui_running')
    " Si on utilise Gvim

    let s:vmode         = 'gui'

    let s:indent1       = '#131313'
    let s:indent2       = '#222222'
    let s:noir          = '#000000'
    let s:grissombre    = '#111111'
    let s:rougesombre   = '#aa0000'
    let s:rouge         = '#ff0000'
    let s:rougeclair    = '#ff1f1f'
    let s:orangesombre  = '#ff4400'
    let s:orange        = '#ff6600'
    let s:orangeclair   = '#ff9900'
    let s:vertsombre    = '#009900'
    let s:vert          = '#00bb00'
    let s:vertclair     = '#00ff00'
    let s:jaunesombre   = '#cccc00'
    let s:jaune         = '#ffff00'
    let s:jauneclair    = '#ffff44'
    let s:bleusombre    = '#0000ff'
    let s:bleu          = '#2828ff'
    let s:bleuclair     = '#5050ff'
    let s:violetsombre  = '#880088'
    let s:violet        = '#bb00ff'
    let s:violetclair   = '#ff00ff'
    let s:cyansombre    = '#007777'
    let s:cyan          = '#00aaaa'
    let s:cyanclair     = '#00ffff'
    let s:gris          = '#aaaaaa'
    let s:blanc         = '#ffffff'

    let s:couleurfond   = '#000000'

elseif g:interstellaire_termcolors != 256 && &t_Co >= 16
    " Pour un terminal 16 couleurs.

    let s:vmode         = 'cterm'

    let s:indent1       = '0'
    let s:indent2       = '8'
    let s:noir          = '0'
    let s:grissombre    = '8'
    let s:rougesombre   = '1'
    let s:rouge         = '9'
    let s:rougeclair    = '9'
    let s:orangesombre  = '3'
    let s:orange        = '3'
    let s:orangeclair   = '3'
    let s:vertsombre    = '2'
    let s:vert          = '10'
    let s:vertclair     = '10'
    let s:jaunesombre   = '3'
    let s:jaune         = '11'
    let s:jauneclair    = '11'
    let s:bleusombre    = '4'
    let s:bleu          = '12'
    let s:bleuclair     = '12'
    let s:violetsombre  = '5'
    let s:violet        = '13'
    let s:violetclair   = '13'
    let s:cyansombre    = '6'
    let s:cyan          = '14'
    let s:cyanclair     = '14'
    let s:gris          = '7'
    let s:blanc         = '15'

    let s:couleurfond   = 'NONE'

elseif g:interstellaire_termcolors == 256
    " Pour un terminal 256 couleurs.

    let s:vmode         = 'cterm'

    let s:indent1       = '234'
    let s:indent2       = '236'
    let s:noir          = '16'
    let s:grissombre    = '233'
    let s:rougesombre   = '1'
    let s:rouge         = '160'
    let s:rougeclair    = '9'
    let s:orangesombre  = '130'
    let s:orange        = '166'
    let s:orangeclair   = '202'
    let s:vertsombre    = '2'
    let s:vert          = '34'
    let s:vertclair     = '10'
    let s:jaunesombre   = '3'
    let s:jaune         = '220'
    let s:jauneclair    = '11'
    let s:bleusombre    = '4'
    let s:bleu          = '27'
    let s:bleuclair     = '12'
    let s:violetsombre  = '5'
    let s:violet        = '162'
    let s:violetclair   = '13'
    let s:cyansombre    = '6'
    let s:cyan          = '45'
    let s:cyanclair     = '14'
    let s:gris          = '250'
    let s:blanc         = '255'

    let s:couleurfond   = 'NONE'

else
    " Pour un terminal 8 couleurs.

    let s:vmode         = 'cterm'

    let s:indent1       = 'Black'
    let s:indent2       = 'DarkGray'
    let s:noir          = 'Black'         " 0
    let s:grissombre    = 'DarkGray'      " 0*
    let s:rougesombre   = 'DarkRed'       " 1
    let s:rouge         = 'Red'
    let s:rougeclair    = 'LightRed'      " 1*
    let s:orangesombre  = 'DarkYellow'
    let s:orange        = 'DarkYellow'
    let s:orangeclair   = 'DarkYellow'
    let s:vertsombre    = 'DarkGreen'     " 2
    let s:vert          = 'Green'
    let s:vertclair     = 'LightGreen'    " 2*
    let s:jaunesombre   = 'DarkYellow'    " 3
    let s:jaune         = 'Yellow'
    let s:jauneclair    = 'LightYellow'   " 3*
    let s:bleusombre    = 'DarkBlue'      " 4
    let s:bleu          = 'Blue'
    let s:bleuclair     = 'LightBlue'     " 4*
    let s:violetsombre  = 'DarkMagenta'   " 5
    let s:violet        = 'Magenta'
    let s:violetclair   = 'LightMagenta'  " 5*
    let s:cyansombre    = 'DarkCyan'      " 6
    let s:cyan          = 'Cyan'
    let s:cyanclair     = 'LightCyan'     " 6*
    let s:gris          = 'LightGray'     " 7
    let s:blanc         = 'White'         " 7*

    let s:couleurfond   = 'NONE'

endif

" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" )))


" Options de mise en forme. " (((
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

let s:none      = 'NONE'
let s:bold      = ',bold'
let s:ucurl     = ',undercurl'
let s:reverse   = ',reverse'
let s:stdout    = ',standout'
let s:underline = ',underline'
let s:italic    = ',italic'

" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" )))


" Fond, texte, mise en forme " (((
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

let s:fond  = ' ' . s:vmode . 'bg='
let s:texte = ' ' . s:vmode . 'fg='
let s:forme = ' ' . s:vmode . '=NONE'

" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" )))


" Coloration basique " (((
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

exe 'highlight Normal'          . s:forme                               . s:texte . s:blanc             . s:fond . s:couleurfond
exe 'highlight Comment'         . s:forme                               . s:texte . s:bleusombre        . s:fond . s:none
exe 'highlight Constant'        . s:forme                               . s:texte . s:rougesombre       . s:fond . s:none
" String        Une chaine de caractères
" Character     Un caractère
" Number        Un nombre 234 0xff
" Boolean       Un booléen
" Float         Un nombre flottant 2.3e10

exe 'highlight Identifier'      . s:forme                               . s:texte . s:cyansombre        . s:fond . s:none
" Identifier    Un nom de variable
" Function      Un nom de fonction ou de méthode

exe 'highlight Statement'       . s:forme . s:bold                      . s:texte . s:bleuclair         . s:fond . s:none
" Conditional   if, then, else, endif, switch
" Repeat        for, do, while
" Label         case, default
" Operator      sizeof, +, -, *
" Keyword       Tous les autres mots clefs
" Exception     try, catch, throw

exe 'highlight PreProc'         . s:forme                               . s:texte . s:violetsombre      . s:fond . s:none
" Preproc       Les instructions de préprocesseur
" Include       #include
" Define        #define
" Macro         pareil que define
" PreCondit     #if, #else, #endif

exe 'highlight Type'            . s:forme . s:underline                 . s:texte . s:vertsombre        . s:fond . s:none
" Type          int, long, double, char
" StorageClass  static, register, volatile
" Structure     struct, union, enum
" Typedef       typedef

exe 'highlight Special'         . s:forme . s:bold                      . s:texte . s:rougeclair        . s:fond . s:none
" SpecialChar   Les caractère spéciaux
" Tag           Les liens CTRL-]
" Delimiter
" SpecialComment
" Debug

exe 'highlight Underlined'      . s:forme . s:underline                 . s:texte . s:violetsombre      . s:fond . s:none
" Texte qui sera souligné en html ou tex

exe 'highlight Ignore'          . s:forme                               . s:texte . s:none              . s:fond . s:none
" Blanc à gauche ou caché.

exe 'highlight Error'           . s:forme                               . s:texte . s:blanc             . s:fond . s:rouge
" Toutes les erreurs de constructions

exe 'highlight Todo'            . s:forme                               . s:texte . s:noir              . s:fond . s:cyan
" TODO FIXME XXX

" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" )))


" Coloration étendue "(((
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

exe 'highlight Character'       . s:forme . s:bold                      . s:texte . s:vertclair         . s:fond . s:none
exe 'highlight ColorColumn'     . s:forme                               . s:texte . s:none              . s:fond . s:none
exe 'highlight Conceal'         . s:forme                               . s:texte . s:jaunesombre       . s:fond . s:none

exe 'highlight Cursor'          . s:forme                               . ' guifg=bg'                   . ' guibg=fg'
exe 'highlight CursorColumn'    . s:forme . s:underline                 . s:texte . s:none              . s:fond . s:grissombre
exe 'highlight CursorLine'      . s:forme . s:underline                 . s:texte . s:none              . s:fond . s:grissombre
exe 'highlight CursorLineNr'    . s:forme                               . s:texte . s:jauneclair        . s:fond . s:grissombre

exe 'highlight DiffAdd'         . s:forme                               . s:texte . s:blanc             . s:fond . s:vertsombre
exe 'highlight DiffChange'      . s:forme                               . s:texte . s:blanc             . s:fond . s:violetsombre
exe 'highlight DiffDelete'      . s:forme . s:bold                      . s:texte . s:blanc             . s:fond . s:rouge
exe 'highlight DiffText'        . s:forme . s:bold                      . s:texte . s:blanc             . s:fond . s:cyansombre

exe 'highlight Directory'       . s:forme                               . s:texte . s:bleusombre        . s:fond . s:none
exe 'highlight ErrorMsg'        . s:forme                               . s:texte . s:blanc             . s:fond . s:rougesombre
exe 'highlight Exception'       . s:forme . s:bold                      . s:texte . s:rougeclair        . s:fond . s:none
exe 'highlight FoldColumn'      . s:forme                               . s:texte . s:gris              . s:fond . s:grissombre
exe 'highlight Folded'          . s:forme                               . s:texte . s:jaunesombre       . s:fond . s:grissombre
exe 'highlight IncSearch'       . s:forme . s:reverse                   . s:texte . s:none              . s:fond . s:none

exe 'highlight Label'           . s:forme                               . s:texte . s:jaune             . s:fond . s:none
exe 'highlight LineNr'          . s:forme                               . s:texte . s:jaunesombre       . s:fond . s:grissombre
exe 'highlight MatchParen'      . s:forme . s:bold                      . s:texte . s:blanc             . s:fond . s:bleusombre
exe 'highlight ModeMsg'         . s:forme . s:bold                      . s:texte . s:rouge             . s:fond . s:none
exe 'highlight MoreMsg'         . s:forme . s:bold                      . s:texte . s:vertsombre        . s:fond . s:none
exe 'highlight NonText'         . s:forme . s:bold                      . s:texte . s:violetsombre      . s:fond . s:none

exe 'highlight Operator'        . s:forme                               . s:texte . s:orangesombre      . s:fond . s:none
exe 'highlight Pmenu'           . s:forme                               . s:texte . s:noir              . s:fond . s:violetsombre
exe 'highlight PmenuSbar'       . s:forme                               . s:texte . s:none              . s:fond . s:gris
exe 'highlight PmenuSel'        . s:forme . s:bold                      . s:texte . s:blanc             . s:fond . s:bleusombre
exe 'highlight PmenuThumb'      . s:forme                               . s:texte . s:none              . s:fond . s:blanc

exe 'highlight Question'        . s:forme . s:bold                      . s:texte . s:vertsombre        . s:fond . s:none
exe 'highlight Repeat'          . s:forme . s:bold                      . s:texte . s:jaune             . s:fond . s:none
exe 'highlight Search'          . s:forme . s:bold                      . s:texte . s:noir              . s:fond . s:jauneclair
exe 'highlight SignColumn'      . s:forme                               . s:texte . s:none              . s:fond . s:grissombre
exe 'highlight SpecialComment'  . s:forme . s:bold                      . s:texte . s:bleuclair         . s:fond . s:none
exe 'highlight SpecialKey'      . s:forme                               . s:texte . s:bleusombre        . s:fond . s:none

exe 'highlight SpellBad'        . s:forme . s:ucurl . s:italic          . s:texte . s:none              . s:fond . s:grissombre
exe 'highlight SpellCap'        . s:forme                               . s:texte . s:noir              . s:fond . s:bleu
exe 'highlight SpellLocal'      . s:forme . s:ucurl                     . s:texte . s:none              . s:fond . s:none
exe 'highlight SpellRare'       . s:forme . s:ucurl                     . s:texte . s:none              . s:fond . s:none

exe 'highlight StatusLine'      . s:forme                               . s:texte . s:noir              . s:fond . s:jaunesombre
exe 'highlight StatusLineNC'    . s:forme                               . s:texte . s:jauneclair        . s:fond . s:bleusombre

exe 'highlight String'          . s:forme                               . s:texte . s:vertsombre        . s:fond . s:none
exe 'highlight TabLine'         . s:forme                               . s:texte . s:none              . s:fond . s:none
exe 'highlight TabLineFill'     . s:forme                               . s:texte . s:none              . s:fond . s:none
exe 'highlight TabLineSel'      . s:forme                               . s:texte . s:none              . s:fond . s:none
exe 'highlight Title'           . s:forme . s:bold                      . s:texte . s:violetsombre      . s:fond . s:none

exe 'highlight VertSplit'       . s:forme . s:bold                      . s:texte . s:cyansombre        . s:fond . s:bleusombre
exe 'highlight Visual'          . s:forme . s:reverse                   . s:texte . s:none              . s:fond . s:none
exe 'highlight VisualNOS'       . s:forme . s:underline . s:bold        . s:texte . s:none              . s:fond . s:none
exe 'highlight WarningMsg'      . s:forme                               . s:texte . s:rougesombre       . s:fond . s:none

exe 'highlight WildMenu'        . s:forme                               . s:texte . s:noir              . s:fond . s:violetsombre
exe 'highlight lCursor'         . s:forme                               . s:texte . s:none              . s:fond . s:cyan

" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" )))


" Coloration pour TagBar    "(((
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

exe 'highlight TagbarSignature'     . s:forme                               . s:texte . s:jaunesombre       . s:fond . s:none

" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" )))


" Coloration pour Indent Guides
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

exe 'highlight IndentGuidesOdd'     . s:forme                               . s:texte . s:none              . s:fond . s:indent2
exe 'highlight IndentGuidesEven'    . s:forme                               . s:texte . s:none              . s:fond . s:indent1

" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" )))


" Coloration de la syntaxe vim  "(((
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

highlight link vimLineComment vimComment
highlight link vimComment Comment
highlight link vimVar Identifier
highlight link vimFunc vimError
highlight link vimUserFunc Function
highlight link vimSet Normal
highlight link vimSetEqual Normal
highlight link vimCommentString vimString
highlight link vimCommand Statement
highlight link vimSynMtchOpt vimSynOption
highlight link vimIsCommand Normal
highlight link vimHiGroup vimGroup
highlight link vimHiLink Normal

exe 'highlight vimCmdSep'       . s:forme . s:underline                 . s:texte . s:jaunesombre       . s:fond . s:none
exe 'highlight vimCommand'      . s:forme . s:underline . s:bold        . s:texte . s:bleuclair         . s:fond . s:none
exe 'highlight vimSynType'      . s:forme . s:underline                 . s:texte . s:orange            . s:fond . s:none
exe 'highlight vimGroup'        . s:forme . s:underline                 . s:texte . s:orangesombre      . s:fond . s:none

" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" )))


" Coloration pour les fichiers en php   "(((
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

exe 'highlight phpMemberSelector'   . s:forme . s:underline                 . s:texte . s:jaunesombre       . s:fond . s:none

" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" )))


" Coloration pour la documentation doxygen "(((
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

exe 'highlight doxygenErrorComment'         . s:forme                               . s:texte . s:blanc             . s:fond . s:rougesombre
exe 'highlight doxygenParam'                . s:forme                               . s:texte . s:bleu              . s:fond . s:none
exe 'highlight doxygenSpecial'              . s:forme                               . s:texte . s:bleuclair         . s:fond . s:none
exe 'highlight doxygenBrief'                . s:forme                               . s:texte . s:bleuclair         . s:fond . s:none
exe 'highlight doxygenSpecialOnelineDesc'   . s:forme                               . s:texte . s:bleuclair         . s:fond . s:none
highlight link doxygenSmallSpecial doxygenParam
highlight link doxygenBOther doxygenParam

" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" )))


" Coloration pour la documentation javadoc "(((
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

highlight link javaDocComment SpecialComment
highlight link javaCommentStar SpecialComment

" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" )))


" Pour syntastic "(((
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

exe 'highlight SyntasticWarningSign'    . s:forme                               . s:texte . s:noir              . s:fond . s:jaunesombre

" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" )))


" Coloration pour signify "(((
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

exe 'highlight SignifySignAdd'      . s:forme                               . s:texte . s:vertsombre        . s:fond . s:grissombre
exe 'highlight SignifySignDelete'   . s:forme                               . s:texte . s:rougesombre       . s:fond . s:grissombre
exe 'highlight SignifySignChange'   . s:forme                               . s:texte . s:violetsombre      . s:fond . s:grissombre

" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" )))


" Coloration définie par l'utilisateur (((
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

" Pour mieux mettre en valeur le symbole qui signale une modification du
" fichier courant.
exe 'highlight User1'           . s:forme . s:bold                      . s:texte . s:noir              . s:fond . s:rougesombre
" Nombre d'ajout de suppression et de modifications
exe 'highlight User3'           . s:forme                               . s:texte . s:vertsombre        . s:fond . s:none
exe 'highlight User4'           . s:forme                               . s:texte . s:rougesombre       . s:fond . s:none
exe 'highlight User5'           . s:forme                               . s:texte . s:violetsombre      . s:fond . s:none
" La couleur de la branche git en cours.
exe 'highlight User6'           . s:forme                               . s:texte . s:grissombre        . s:fond . s:jaune

" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" )))

" vim:foldmethod=marker
