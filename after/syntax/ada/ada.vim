" Ajouter ligne 250 :
" Permet de reconnaitre l'utilisation de use all type
syntax match adaUseType 	"^\s*\zsuse\(\s\+all\)\?\s\+type\>"

" Dans le fichier [syntax/ada.vim] ligne 327 avec : (392 avec les ajouts)
highlight def link adaUseType	    Typedef

" Dans le fichier [syntax/ada.vim] ligne 263 ajouter :
syntax region  adaComment
    \ oneline
    \ contains=adaTodo,adaLineError,@Spell,docAdaComment
    \ start="--"
    \ end="$"
    \ keepend

syntax region  docAdaComment
    \ oneline
    \ contains=adaTodo,docAdaChamps,docAdaCommentIntro,docAdaParam,docAdaReturn,docAdaValue,docAdaExceptions
    \ containedin=adaComment
    \ start="@"
    \ end="$"
    \ keepend

syntax keyword docAdaChamps
    \ value exception return param summary description group
    \ contained
    \ containedin=docAdaComment
    \ skipwhite

syntax keyword docAdaParam
    \ param
    \ contained
    \ containedin=docAdaComment
    \ nextgroup=docAdaParamNom
    \ skipwhite
syntax match   docAdaParamNom      contained "[A-Za-z0-9_]\+"

syntax keyword docAdaReturn
    \ return
    \ contained
    \ containedin=docAdaComment
    \ nextgroup=docAdaReturnTexte
    \ skipwhite
syntax region  docAdaReturnTexte  start="" end="$" contains=@Spell contained keepend

syntax keyword docAdaValue
    \ value
    \ contained
    \ containedin=docAdaComment
    \ nextgroup=docAdaValueNom
    \ skipwhite
syntax match   docAdaValueNom       contained "[A-Za-z0-9_]\+" nextgroup=docAdaValueTexte
syntax region  docAdaValueTexte     start="" end="$" contains=@Spell contained keepend

syntax keyword docAdaExceptions
    \ exception
    \ contained
    \ containedin=docAdaComment
    \ skipwhite

syntax keyword docAdaCommentIntro  contained summary description group

highlight docAdaChamps      ctermfg=6
highlight docAdaChampsIntro ctermfg=6

highlight def link docAdaComment	    adaComment
highlight def link docAdaCommentIntro	docAdaChampsIntro
highlight def link docAdaReturnTexte    SpecialComment
highlight def link docAdaValueTexte     SpecialComment

highlight def link docAdaParamNom	    Underlined
highlight def link docAdaValueNom	    Underlined

highlight def link docAdaParam	        docAdaChamps
highlight def link docAdaReturn	        docAdaChamps
highlight def link docAdaValue	        docAdaChamps
highlight def link docAdaExceptions     docAdaChamps
