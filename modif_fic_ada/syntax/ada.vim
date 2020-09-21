"----------------------------------------------------------------------------
"  Description: Vim Ada syntax file
"     Language: Ada (2005)
"	   $Id: ada.vim 887 2008-07-08 14:29:01Z krischik $
"    Copyright: Copyright (C) 2006 Martin Krischik
"   Maintainer: Martin Krischik
"		David A. Wheeler <dwheeler@dwheeler.com>
"		Simon Bradley <simon.bradley@pitechnology.com>
" Contributors: Preben Randhol.
"      $Author: krischik $
"	 $Date: 2008-07-08 16:29:01 +0200 (Di, 08 Jul 2008) $
"      Version: 4.6
"    $Revision: 887 $
"     $HeadURL: https://gnuada.svn.sourceforge.net/svnroot/gnuada/trunk/tools/vim/syntax/ada.vim $
"		http://www.dwheeler.com/vim
"      History: 24.05.2006 MK Unified Headers
"		26.05.2006 MK ' should not be in iskeyword.
"		16.07.2006 MK Ada-Mode as vim-ball
"		02.10.2006 MK Better folding.
"		15.10.2006 MK Bram's suggestion for runtime integration
"		05.11.2006 MK Spell check for comments and strings only
"		05.11.2006 MK Bram suggested to save on spaces
"    Help Page: help ft-ada-syntax
"------------------------------------------------------------------------------
" The formal spec of Ada 2005 (ARM) is the "Ada 2005 Reference Manual".
" For more Ada 2005 info, see http://www.gnuada.org and http://www.adapower.com.
"
" This vim syntax file works on vim 7.0 only and makes use of most of Voim 7.0
" advanced features.
"------------------------------------------------------------------------------

if exists("b:current_syntax") || version < 700
    finish
endif
let s:keepcpo= &cpo
set cpo&vim

let b:current_syntax = "ada"

syntax case ignore

" Section: Highlighting commands {{{1
"
" There are 72 reserved words in total in Ada2005. Some keywords are
" used in more than one way. For example:
" 1. "end" is a general keyword, but "end if" ends a Conditional.
" 2. "then" is a conditional, but "and then" is an operator.
"
for b:Item in g:ada#Keywords
   " Standard Exceptions (including I/O).
   " We'll highlight the standard exceptions, similar to vim's Python mode.
   " It's possible to redefine the standard exceptions as something else,
   " but doing so is very bad practice, so simply highlighting them makes sense.
   if b:Item['kind'] == "x"
      execute 'syntax keyword adaException ' . b:Item['word']
   endif
   if b:Item['kind'] == "a"
      execute 'syntax keyword adaAspect ' . b:Item['word'] . ' contained'
      execute 'syntax match adaAttribute "\V''' . b:Item['word'] . '\>"'
   endif
   if b:Item['kind'] == "p"
      execute 'syntax keyword adaAspect ' . b:Item['word'] . ' contained'
   endif
   " We don't normally highlight types in package Standard
   " (Integer, Character, Float, etc.).  I don't think it looks good
   " with the other type keywords, and many Ada programs define
   " so many of their own types that it looks inconsistent.
   " However, if you want this highlighting, turn on "ada_standard_types".
   " For package Standard's definition, see ARM section A.1.
   if b:Item['kind'] == "t" && exists ("g:ada_standard_types")
      execute 'syntax keyword adaBuiltinType ' . b:Item['word']
   endif
   if b:Item['kind'] == "s"
      execute 'syntax keyword adaSpark ' . b:Item['word'] . ' contained'
   endif
endfor

"syntax keyword adaException Constraint_Error Program_Error Storage_Error
"            \ Tasking_Error Status_Error Mode_Error Name_Error Use_Error
"            \ Device_Error End_Error Data_Error Layout_Error Length_Error
"            \ Pattern_Error Index_Error Translation_Error Time_Error
"            \ Argument_Error Tag_Error Picture_Error Terminator_Error
"            \ Conversion_Error Pointer_Error Dereference_Error Update_Error
"
"syntax keyword adaBuiltinType Boolean Integer Natural Positive Float
"            \ Character Wide_Character Wide_Wide_Character String
"            \ Wide_String  Wide_Wide_String Duration


"}}}1

" Section: others {{{1
"
syntax keyword  adaLabel	others

"}}}1

" Section: Opérateurs {{{1
"
syntax keyword  adaOperateur abs mod rem xor
syntax match    adaOperateur "\<not\>"
syntax match    adaOperateur "\<and\>"
syntax match    adaOperateur "\<and\s\+then\>"
syntax match    adaOperateur "\<or\>"
syntax match    adaOperateur "\<or\s\+else\>"
syntax match    adaOperateur "[-+*/<>&]"
syntax keyword  adaOperateur **
syntax match    adaOperateur "[/<>]="
syntax keyword  adaOperateur =>
syntax match    adaOperateur "\.\."
syntax match    adaOperateur "="

"}}}1

" Section: <> {{{1
"
" Le diamant : <>, est spécial :
"
syntax keyword  adaSpecial	    <>

"}}}1

" Section: Caractères spéciaux {{{1
"
syntax match	adaSpecial	 "[:;(),]"
syntax match	adaSpecial	 "\v\.((\.)@!)"

"}}}1

" Section: := {{{1
"
" On à besoin de définir ":=" sinon, " le symbole "=" à l'intérieur
" sera erronément interprété comme un opérateur.
" En Ada, l'assignement (:=) n'est pas considéré comme un opérateur.
"
syntax match adaAssignement		":="

"}}}1

" Section: Nombres, dont : points flottant, exposants, et bases autre que 10 {{{1
"
syntax match   adaNombres		"\<\d[0-9_]*\(\.\d[0-9_]*\)\=\([Ee][+-]\=\d[0-9_]*\)\=\>"
syntax match   adaNombres		"\<\d\d\=#\x[0-9A-Fa-f_]*\(\.\x[0-9A-Fa-f_]*\)\=#\([Ee][+-]\=\d[0-9_]*\)\="

"}}}1

" Section: Distinction des signes numérique {{{1
"
" Dans "A-5" le "-" est un opérateur, mais dans "A:=-5" le "-" est un signe.
" ce qui interprète "A3+-5" (etc.) correctement.
"
syntax match adaSignes "[[:space:]<>=(,|:;&*/+-][+-]\d"lc=1,hs=s+1,he=e-1,me=e-1

"}}}1

" Section: Labels pour les goto {{{1
"
syntax region  adaLabel		start="<<"  end=">>"

"}}}1

" Section: Constantes booléennes {{{1
syntax keyword adaBooleens	true false

"}}}1

" Section: Avertissements C/C++ {{{1
"
" On avertit ceux qui essayent d'utiliser les notations C/C++ par erreur:
"
syntax match adaErreur "//"
syntax match adaErreur "/\*"
syntax match adaErreur "=="

"}}}1

syntax match    adaEnd       "\<end\>"
syntax keyword  adaPreproc	 pragma

syntax keyword  adaStatement accept goto raise requeue return
syntax keyword  adaStatement terminate abort
syntax match    adaStatement "\<delay\>"
syntax match    adaStatement "\<delay\>\s\+\<until\>"

" Section: Reconnais le mot clef record  {{{1
"
" 'record' démarre habituellement une structure, mais pas "with null record;"
" et "end record;" en fini une.  L'ordre est essentiel ici.
" 'record;' reconnais "with null record", donc on en fait un mot clefs
"
syntax match adaStructure   "\<record\>"
syntax match adaStructure   "\<end\>\s\+\<record\>"
syntax match adaMotClef	    "\<record;"me=e-1

"}}}1

" Section: type et classes {{{1
"
syntax match   adaStorageClass	"\<abstract\>"
syntax keyword adaStorageClass	access aliased array at
syntax keyword adaStorageClass	constant delta digits of range
syntax keyword adaStorageClass	tagged interface synchronized
syntax match   adaStorageClass	"\<private\>"
syntax match   adaStorageClass	"\<limited\>"
syntax match   adaStorageClass	"\<not\>\s\+\<null\>\s\+\<access\>"

syntax keyword adaTypeDef    subtype type

"}}}1

" Section: Conditions {{{1
"
syntax match    adaConditional  "\<then\>"
syntax match    adaConditional	"\<else\>"
syntax match    adaConditional	"\<end\>\s\+\<if\>"
syntax match    adaConditional	"\<end\>\s\+\<case\>"
syntax match    adaConditional	"\<end\>\s\+\<select\>"
syntax match    adaConditional	"\<if\>"
syntax keyword  adaConditional	case select
syntax keyword  adaConditional	elsif when

"}}}1

" Section: Autres mots clefs {{{1
syntax match    adaMotClef	    "\<is\>"
syntax match    adaMotClef	    "\<separate\>" contains=adaSeparate
syntax keyword  adaMotClef	    all do exception in new null
syntax keyword  adaMotClef	    out overriding some

"}}}1

" Section: Mots clefs de début {{{1
"
syntax match    adaBegin	"\<declare\>"
syntax keyword  adaBegin	begin body entry generic
syntax keyword  adaBegin	protected renames task

syntax match    adaBegin	"\<function\>"
syntax match    adaBegin	"\<procedure\>"
syntax match    adaBegin	"\<package\>"   contains=adaPackage

"}}}1

if exists("ada_with_gnat_project_files")
   syntax match adaBegin	"\<project\>"   contains=adaProject
   syntax match adaBegin	"\<library\>"   contains=adaProject
   syntax match adaBegin	"\<extends\>"   contains=adaProject
   syntax match adaBegin	"\<aggregate\>" contains=adaProject
endif

if line ('$') < 1000
    syntax region adaSeparate
                \ start="\v<separate>\s+\(\k+(\.\k+)*\)\_s+<procedure>\s+\z(\k+)"
                \ end="\<end\>\s\+\z1\s*;"
                \ transparent keepend extend
                \ contains=ALLBUT,adaInc,adaTodo,adaAspect,adaDocParamNom,adaDocTagSuiviDunNom,adaSpark
    syntax region adaPackage
                \ start="\v(<package>\s+<body>|<package>)\s+\z(\k+(\.\k+)*)\_s+(<with>(\_s+\k+\s+\=\>\s+\k+,?\_s+)+)?<is>(\_s+<new>)@!"
                \ end="\<end\>\s\+\z1\s*;"
                \ transparent keepend extend
                \ contains=ALLBUT,adaInc,adaTodo,adaAspect,adaDocParamNom,adaDocTagSuiviDunNom,adaSpark
    syntax region adaProject
                \ start="\v^((<aggregate>(\s+<library>)?|<abstract>|<library>)\s+)?<project>\s+\z(\k+(\.\k+)*)\_s+(<extends>\s+(<all>\s+)?\"[a-zA-Z0-9/-_]+\.gpr\"\_s+)?<is>"
                \ end="\<end\>\s\+\z1\s*;"
                \ transparent keepend extend
                \ contains=ALLBUT,adaInc,adaTodo,adaAspect,adaDocParamNom,adaDocTagSuiviDunNom,adaSpark
endif

" Section: Distinction entre with et with {{{1
"
" On fait la distinction entre le with utilisé pour faire les
" imports de package, et les with utilisé pour les aspects.
"
if line ('$') < 1000
    syntax match adaMotClef "\<with\>" contained
    syntax match adaMotClef "\<use\>"  contained
    syntax match adaInc     "\<with\>"
    syntax match adaInc     "\<use\>"
else
    syntax match adaMotClef "\<with\>"
    syntax match adaMotClef "\<use\>"
    syntax match adaBeginWith        "^\zs\(\(with\)\|\(use\)\)\>" contains=adaInc nextgroup=adaSemiWith
    syntax match adaSemiWith "\(;\s*\)\@<=\(\(with\)\|\(use\)\)\>" contains=adaInc nextgroup=adaSemiWith
    syntax match adaInc     "\<with\>" contained contains=NONE
    syntax match adaInc     "\<use\>"  contained contains=NONE
endif
syntax match AdaInc  	"\<private\>\s\+\<with\>"
syntax match AdaInc  	"\<limited\>\s\+\<with\>"
" Reconnais "with null record" comme un seul mot clef.
syntax match adaMotClef	"\<with\>\s\+\<null\>\s\+\<record\>"
" Les package, fonctions et procédures sont considéré comme des mots clefs.
syntax match adaMotClef	";\s*\zs\<with\>\s\+\<\(function\|procedure\|package\)\>"
syntax match adaMotClef	"^\s*\zs\<with\>\s\+\<\(function\|procedure\|package\)\>"

" Le mot clef with qui n'est pas suivis de procedure function package
" et que n'est pas un héritage objet
syntax region adaWith
            \ start="\v^\s+<with>((\s+(function|procedure|package))@!)"
            \ end="\(;\|\<is\>\)"
            \ transparent keepend
            \ contains=adaAttribute,adaAspect,adaMotClef,adaOperateur,adaNombres,adaSpecial,adaBooleens,adaString,adaSpark,adaConditional,adaComment,adaBoucle

"}}}1

" Section: Chaines de caractères {{{1
"
syntax region  adaString	contains=@Spell start=+"+ skip=+""+ end=+"+
syntax match   adaCharacter "'.'"

"}}}1

" Permet de reconnaitre l'utilisation de use all type
syntax match adaUseType 	"\v<use>(\s+<all>)?\s+<type>"

" Section: Boucles {{{1
"
" Traite la reconnaissance des boucles en Ada
"
syntax keyword adaBoucle    exit for reverse while
syntax match   adaBoucle    "\<loop\>"
syntax match   adaBoucle    "\<end\>\s\+\<loop\>"

"}}}1

" Section: Commentaires {{{1
"
" Reconnais les commentaires, et les annotations pour la
" documentation automatique.
"
syntax keyword adaTodo TODO FIXME XXX NOTE containedin=adaComment contained

syntax region adaComment
            \ oneline keepend
            \ contains=adaDocTags,adaTodo,@Spell,adaDocComment
            \ start="--"
            \ end="$"

syntax match adaDocTags
            \ "@\zs\(return\|exception\|summary\|description\)\>"
            \ containedin=adaComment
            \ contained

syntax region adaDocTagAvecNom
            \ start="@\zs\(param\|value\|group\)\>"
            \ end="$"
            \ containedin=adaComment
            \ contains=adaDocTagSuiviDunNom,adaDocParamNom
            \ nextgroup=adaDocParamNom
            \ contained

syntax keyword adaDocTagSuiviDunNom param value group
            \ containedin=adaDocTagAvecNom
            \ nextgroup=adaDocParamNom
            \ contained

syntax match adaDocParamNom "\k\+" containedin=adaDocTagAvecNom contained

"}}}1

highlight adaDocTags            ctermfg=6
highlight adaDocTagSuiviDunNom  ctermfg=6

highlight def link adaAspect        Exception
highlight def link adaSpark         Exception
highlight def link adaAssignement   Special
highlight def link adaAttribute	    Exception
highlight def link adaBegin         Keyword
highlight def link adaBooleens	    Boolean
highlight def link adaBoucle	    Repeat
highlight def link adaBuiltinType   Type
highlight def link adaCharacter	    Character
highlight def link adaComment	    Comment
highlight def link adaConditional   Conditional
highlight def link adaDocParamNom	Underlined
highlight def link adaEnd           Keyword
highlight def link adaErreur	    Error
highlight def link adaException	    Exception
highlight def link adaInc	        PreProc
highlight def link adaLabel	        Label
highlight def link adaMotClef	    Keyword
highlight def link adaNombres	    Number
highlight def link adaOperateur	    Operator
highlight def link adaPreproc       PreProc
highlight def link adaSignes	    Number
highlight def link adaSpecial	    Special
highlight def link adaStatement	    Statement
highlight def link adaStorageClass  StorageClass
highlight def link adaString	    String
highlight def link adaStructure	    Structure
highlight def link adaTODO	        Todo
highlight def link adaTypeDef	    Typedef
highlight def link adaUseType	    Typedef

" Section: sync {{{1
"
" We don't need to look backwards to highlight correctly;
" this speeds things up greatly.
if line ('$') < 1000
    syntax sync fromstart
else
    syntax sync minlines=1 maxlines=10
endif
"syntax sync fromstart

let &cpo = s:keepcpo
unlet s:keepcpo

finish " 1}}}

"------------------------------------------------------------------------------
"   Copyright (C) 2006	Martin Krischik
"
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
"vim: textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
"vim: foldmethod=marker
