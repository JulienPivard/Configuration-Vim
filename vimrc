set nocompatible                        " Casser compatible avec vielle version

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.O=)(=O.o=)(=o.o=)(=-.-=)(=@.@=)(=~.~=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
"                                    Début des réglages de Vundle                                    "
" -------------------------------------------------------------------------------------------------- "

filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim       " Ajoute le chemin pour initialiser Vundle au démarrage.
call vundle#begin()
" Si on veut installer ailleurs que dans le dossier par défaut.
"call vundle#begin('~/some/path/here')

" Pour se maintenir à jours.
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/FuzzyFinder.git'
Plugin 'sjl/gundo.vim.git'
Plugin 'Yggdroot/indentLine.git'
Plugin 'vim-scripts/L9.git'
Plugin 'Shougo/neocomplete.vim.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'vim-scripts/OmniCppComplete.git'
Plugin 'hdima/python-syntax.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'majutsushi/tagbar.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'vim-scripts/undotree.vim.git'
Plugin 'phongnh/vim-antlr.git'
Plugin 'spf13/vim-autoclose.git'
Plugin 'tpope/vim-fugitive'
Plugin 'edsono/vim-matchit.git'
Plugin 'mhinz/vim-signify.git'
Plugin 'tpope/vim-surround.git'

call vundle#end()
filetype plugin indent on
" Pense bête
" :PluginList       - Liste les extensions configuré
" :PluginInstall    - Installer
" :PluginUpdate     - Mettre à jours
" :PluginSearch foo - Cherche foo
" :PluginClean      - Supprime les extensions inutilisée

" -------------------------------------------------------------------------------------------------- "
"                                     Fin des réglages de Vundle                                     "
" (=^.^=)(=O.O=)(=O.o=)(=o.o=)(=-.-=)(=@.@=)(=~.~=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "

"execute pathogen#infect('bundle/{}')
"call pathogen#helptags()
"filetype plugin indent on

syntax on

set noautochdir                         " Pour ne pas se changer automatiquement de répertoire
set   autoindent                        " Adapte l'indentation automatiquement
set   autoread                          " Permet de relire les fichiers modifié à l'extérieur
set   autowrite                         " Sauvegarde automatiquement le document
set noautowriteall                      " Sauvegarde automatiquement le document dans plus de cas
set   background=dark                   " Fixe la valeur du fond en sombre pour les thèmes
set   backspace=indent,eol,start        " Fixe le comportement de la touche backspace
set   backup                            " Conserve une copie de tout les fichiers édité
set   backupdir=$HOME/.vim/backup       " Définit le dossier de backup sauvegarde le fichier avant de commencer à le modifier
set   breakindent                       " Permet une meilleur conservation de l'indentation lors de l'enroulement des lignes, la ligne ne commence plus collée à gauche
set   breakindentopt=min:55,shift:0     " Pour afficher les caractères de showbreak collé à gauche ajoutez sbr.
set   completeopt=menuone,longest       " Options pour le menu de l'omnicompletion
set   concealcursor=c                   " Quand le curseur est sur un caractère conceal il reste en conceal
set   conceallevel=2                    " Change les combinaison de caractère en leur équivalent utf-8
set   confirm                           " Affiche une ligne de dialogue pour choisir une action
set   copyindent                        " Adapte l'indentation des lignes collées
set   cryptmethod=blowfish              " Change l'algorithme de cryptage
set nocursorcolumn                      " Surligne la colonne ou se situe le curseur
set nocursorline                        " Surligne la ligne ou se situe le curseur
set nodigraph                           " seul i_ctl-k suivit de deux lettres permet d'écrire des caractères spéciaux
set   display=lastline,uhex             " Les lignes trop longues ne sont plus remplacées par @
set   encoding=utf-8                    " Encodage des fichiers en utf-8
set noexrc                              " Bloque la lecture de vimrc locaux
set   expandtab                         " Change les tabulations en espaces
set noerrorbells                        " Pas de beep lors des erreurs
set   foldclose=all                     " Ferme le replis si le curseur en sort et level>foldlevel
set   foldcolumn=1                      " Taille de la colonne qui indique les marques
set   foldenable                        " Activer les replis
set   foldlevel=1                       " Ferme tout les replis de niveau supérieur
set   foldmethod=syntax                 " Génère des replis automatiquement selon le type de fichier
set   foldmarker=(((,)))                " Si on utilise des marqueurs utilisent ce codage
set   foldtext=MonFoldText()            " Redéfinir le texte de la ligne de repli
set   fileencoding=utf-8                " Force l'encodage des fichiers en utf-8
set   fileformat=unix                   " Force l'encodage des fin de lignes en unix
set   fileformats=unix,mac,dos          " Formats à essayer à l'ouverture
set   history=100                       " Taille de l'historique de commande
set   hlsearch                          " Active le sur lignage lors de la recherche
set   incsearch                         " Se déplace au premier terme trouvé pendant la frappe
set   ignorecase                        " Désactive la casse pour utiliser la casse intelligente
set nojoinspaces                        " Ne met qu'un seul espace quand on joint des lignes
set   laststatus=2                      " La barre de statut s'affiche toujours
set   linebreak                         " Enroule la ligne a partir de la coupure d'un mot
set   modeline                          " Options spécifiques à vim dans les premières lignes
set   modelines=3                       " Nombres de lignes vérifiées à l'ouverture
set   nrformats=alpha,octal,hex         " Pour utiliser ctrl-a/ctrl-x avec les lettres les octaux(0) et les hexadécimaux(0x)
set   number                            " Affiche les numéros de ligne
set   printencoding=utf8                " Fixe l'encodage pour l'impression
set   printoptions=paper:A4             " Permet de régler plusieurs options dont la taille du papier
set norelativenumber                    " Affiche le nombre de ligne relatif à la position
set   report=0                          " Affiche toujours le nombre de lignes modifié
set   scrolloff=7                       " Affiche au minimum les 3 lignes autour du curseur
set   shiftround                        " Indentation arrondie à un multiple de shiftwidth
set   shiftwidth=4                      " Taille des tabulations avec >> ou <<
set   showmatch                         " Affiche la parenthèse correspondante
set   showcmd                           " Affiche la commande quand elle est tapé
set   showbreak=―――>                    " Affiche un caractère au début d'une ligne enroulée
set   smartcase                         " Casse intelligente
set   smartindent                       " Indentation intelligente
set   smarttab                          " Suppression de tabulation intelligente
set   softtabstop=4                     " Taille des tabulation en édition
set nospell                             " Désactive la vérification orthographique
set   spelllang=fr                      " Dictionnaire en français
set   statusline=%!MaLigneStatus()      " La ligne de statut du buffer.
set   tabstop=4                         " Taille des tabulations avec tab
set   textwidth=0                       " Pour ne pas avoir de limite à la longueur des lignes
set   title                             " Modifier le titre du terminal
set   titlelen=255                      " Taille de la string dans le titre de la fenêtre d'application
set   undodir=~/.vim/undodir            " Définit le dossier d'annulation
set   undofile                          " Historique d'annulation persistant
set   undolevels=2500                   " Fixe le nombre de changements conservé
set   wildmenu                          " Affiche le menu de complétion pour les commandes dans la barre de statut
set   wildmode=longest:full,full        " Complète d'abord avec la correspondance la plus longue sans ambigüité

" Thésaurus de synonyme français
set thesaurus+=~/.vim/spell/Thesaurus/thesaurus_fr_FR.txt

"set patchmode=.original            " Crée une copie de l'original du fichier édité

" Changer la ligne de statut de vim.
" Couper si la ligne est trop logue %<
" Le nom du chemin complet %f
" le tag d'aide %h
" la coloration utilisateur %1* ... %0*
" Si le fichier à été modifié %m
" Si le fichier est readonly %r
" Si la fenêtre est une preview %w
" La branche en cours d'utilisation %{fugitive#statusline()}
" Séparation entre gauche est droite %=
" Taille minimum de 10 caractères %-10
" Le numéro de la ligne %l. Le nombre de lignes %L
" Le numéro du caractère %c. Le numéro de la colonne virtuelle %V
" Groupe %(%) . Formatage de nombre de caractères minimum %02 %3
" Le type du fichier %y. Le numéro du buffer actuel %n. Si plusieurs fichiers
" ouverts en même temps %a.
" Le code hexadécimal du caractère sous le curseur %B.
" La position dans le fichier en pourcentage %P
function! MaLigneStatus()
    let nomFichier = '%<%f '
    if exists('*sy#repo#get_stats()')
        let etatDepot = '%3*%{SyStatAjout()}%0*' . '%4*%{SyStatSuppression()}%0*' . '%5*%{SyStatModifications()}%0* '
    else
        let etatDepot = ''
    endif
    let flagStatLigne = '%h%1*%m%0*%r%w '
    let posiCurseur = '%-10.(%P, %3l/%L, C%02c%)'
    let buffInfos = '%y tmp:%n%a'
    let hexaCara = '0x%02B %2*|'
    return '' . nomFichier . etatDepot . flagStatLigne . '%=' . posiCurseur . ' ‖ ' . buffInfos . ' ‖ ' . hexaCara
endfunction

" Pour connaitre le nombre de lignes ajoutées au fichier courant [git]
function! SyStatAjout()
    let [added, modified, removed] = sy#repo#get_stats()
    if added > 0
        return '[' . printf('+%s', added ) . ']'
    else
        return ''
    endif
endfunction

" Pour connaitre le nombre de lignes supprimées au fichier courant [git]
function! SyStatSuppression()
    let [added, modified, removed] = sy#repo#get_stats()
    if removed > 0
        return '[' . printf('-%s', removed ) . ']'
    else
        return ''
    endif
endfunction

" Pour connaitre le nombre de lignes modifiées au fichier courant [git]
function! SyStatModifications()
    let [added, modified, removed] = sy#repo#get_stats()
    if modified > 0
        return '[' . printf('~%s', modified ) . ']'
    else
        return ''
    endif
endfunction

" Définie l'affichage de le ligne de repli.
function! MonFoldText()
    let line = getline(v:foldstart)
    let lignes = v:foldend - v:foldstart + 1
    let subFold = substitute(line, '^\s*\|(((\=', '', 'g')
    let debut = '+' . v:folddashes . ' | ' . v:foldstart . '-' . v:foldend . ' |  '
    let nbLignes = printf('%12s', lignes . ' lignes : ')
    return  debut . nbLignes . subFold
endfunction

" Permet de changer les droits d'un fichier pour le rendre exécutable
function! ModeChange()
    if getline(1) =~ "^#!.*/bin/"
        silent !chmod u+x <afile>
    endif
endfunction

" Voir les espaces en fin de lignes
set listchars=nbsp:¤,tab:>-,trail:¤
autocmd FileType make setlocal list                 " Affiche les caractères non imprimable
autocmd FileType make setlocal tabstop=8            " Taille des tabulations avec tab
autocmd FileType make setlocal shiftwidth=8         " Taille des tabulations avec >> ou <<
autocmd FileType make setlocal softtabstop=8        " Taille des tabulation en édition

" Pour que vim se souvienne de la position du curseur à la fermeture pour la prochaine ouverture
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Définition de la coloration syntaxique pour les fichier antlr
autocmd BufRead *.g4 setlocal filetype=antlr

" Suppression automatique des espaces superflus
" \s correspond à un espace ou une tab \+ 1 ou plus $ fin de ligne
" /e pour ne pas générer d'erreur si on ne trouve pas de correspondance
autocmd BufWritePre * :%s/\s\+$//e

" Avoir squelette de base à la création d'un fichier
autocmd BufNewFile *.sh                 0r ~/.vim/CodeBasique/codeBasique.sh
autocmd BufNewFile *.c                  0r ~/.vim/CodeBasique/codeBasique.c
autocmd BufNewFile *.h                  0r ~/.vim/CodeBasique/codeBasique.h
autocmd BufNewFile *.py                 0r ~/.vim/CodeBasique/codeBasique.py
autocmd BufNewFile *.tex                0r ~/.vim/CodeBasique/codeBasique.tex
autocmd BufNewFile *.java               call ConfigurationNouveauFichierJAVA()
autocmd BufNewFile *.html               0r ~/.vim/CodeBasique/codeBasique.html
autocmd BufNewFile *.css                0r ~/.vim/CodeBasique/codeBasique.css
autocmd BufNewFile *.js                 0r ~/.vim/CodeBasique/codeBasique.js
autocmd BufNewFile *.php                0r ~/.vim/CodeBasique/codeBasique.php
autocmd BufNewFile *.me                 0r ~/.vim/CodeBasique/codeBasique.me
autocmd BufNewFile *.1                  0r ~/.vim/CodeBasique/codeBasique.1
autocmd BufNewFile *.pl                 0r ~/.vim/CodeBasique/codeBasique.pl
autocmd BufNewFile client.cpp           0r ~/.vim/CodeBasique/client.cpp
autocmd BufNewFile *.cpp                0r ~/.vim/CodeBasique/codeBasique.cpp
autocmd BufNewFile *.hpp                0r ~/.vim/CodeBasique/codeBasique.hpp
autocmd BufNewFile build.xml            0r ~/.vim/CodeBasique/build.xml
autocmd BufNewFile bibliographie.bib    0r ~/.vim/CodeBasique/bibliographie.bib
autocmd BufNewFile makefile             0r ~/.vim/CodeBasique/makefileBasique
autocmd BufNewFile CMakeLists.txt       0r ~/.vim/CodeBasique/CMakeLists.txt
autocmd BufNewFile Doxyfile             0r ~/.vim/CodeBasique/Doxyfile.base

" Pour configurer automatiquement le make de vim selon le type de fichier
autocmd FileType haskell        setlocal makeprg=ghci\ %
autocmd FileType ocaml          setlocal makeprg=ocaml\ -init\ %
autocmd FileType java           setlocal makeprg=javac\ -g\ %
autocmd FileType sql            setlocal makeprg=mysql\ --password\ <\ %
autocmd FileType tex            setlocal makeprg=xelatex\ %
autocmd Filetype php            setlocal makeprg=php\ -l\ %
"autocmd FileType cpp            setlocal makeprg=g++\ -Wall\ -Wextra\ -o\ %<\ %
" Ancienne version pour les fichier LaTeX
"autocmd FileType tex setlocal makeprg=latex\ %\ &&\ dvips\ %<.dvi\ &&\ ps2pdf\ %<.ps

" Mappage de la touche de compilation
" Les scripts n'utilisent pas ce raccourci de compilation
" pour des raisons de vitesse de retour à l'édition
autocmd FileType tex,haskell,ocaml,sql,php  map  <buffer> <F5>       :make <CR>
autocmd FileType tex,haskell,ocaml,sql,php  map! <buffer> <F5>  <Esc>:make <CR>

" Redéfinition de la commande d'aide utilisée avec K
autocmd FileType tex setlocal keywordprg=texdoc

" Création d'une page de manuel avec ajout du nom automatiquement
autocmd BufNewFile *.1                  :%substitute?NOMCOMMANDE?\=expand('%:t:r')?

" Active la vérification orthographique pour certains type de fichier seulement
autocmd FileType tex,c,h,ocaml,python,java,html,css,javascript,php,make,vim,sh,nroff,groff,svn,perl,cpp,markdown,gitcommit setlocal spell

" Pour éviter les ralentissement dans les fichiers latex et plugin gundo
"autocmd FileType tex        setlocal nocursorline nocursorcolumn

" Active les replis spécifique pour python
autocmd FileType python,sh setlocal foldmethod=indent

" Ajoute de tags pour l'omnicompletion
" ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f cpp cpp_src
set tags+=~/.vim/tags/cpp
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Active l'omnicompletion
if exists ('+omnifunc') && &omnifunc == ""
    setlocal omnifunc=syntaxcomplete#Complete
endif

setlocal completefunc=syntaxcomplete#Complete
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" Si un makefile existe on utilise la commande de shell make plutôt que celle de vim sinon on utilise l'utilitaire make de vim
" Si il y a un makefile on exécute le fichier compilé du même nom que celui du dossier sans la première majuscule sinon c'est le nom du fichier sans majuscule
" Pour retirer la première majuscule sont équivalent :
" :echo substitute(split(getcwd(), '/')[-1], "\\(\\<\\u\\)", "\\l\\1", "")
" :echo substitute(split(getcwd(), '/')[-1], "\\(\\<\\u\\)", "\\L\\1", "")
" :echo substitute(split(getcwd(), '/')[-1], ".*", "\\l\\0", "")
" :echo substitute(split(getcwd(), '/')[-1], "\\<\\u", "\\L\\0", "")
function! ExistMakeFileC()
    iabbrev <buffer> { {<CR>}<Esc>ka
    if filereadable("makefile") || filereadable("Makefile")
        let $nomFichier = substitute(split(getcwd(), '/')[-1], "\\<\\u", "\\l\\0", "")
        setlocal makeprg=make
        map  <buffer> <F5>          :make<CR>
        map! <buffer> <F5>    <Esc> :make<CR>
        map  <buffer> <S-F9>        :make clean<CR>
        map! <buffer> <S-F9>  <Esc> :make clean<CR>
        map  <buffer> <F10>         :!./$nomFichier<CR>
        map! <buffer> <F10>   <Esc> :!./$nomFichier<CR>
    else
        setlocal makeprg=gcc\ -Wall\ -o\ %<\ %<.c
        map  <buffer> <F5>        :make<CR>
        map! <buffer> <F5>  <Esc> :make<CR>
        map  <buffer> <F10>       :!./%<<CR>
        map! <buffer> <F10> <Esc> :!./%<<CR>
    endif
endfunction

function! MacrosCPP()
    map  <buffer> <F5>         :make<CR>
    map! <buffer> <F5>   <Esc> :make<CR>
    map  <buffer> <F10>        :!./bin/Release/client<CR>
    map! <buffer> <F10>  <Esc> :!./bin/Release/client<CR>
    map  <buffer> <S-F8>       :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q ./src/<CR>
    map! <buffer> <S-F8> <Esc> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q ./src/<CR>
    map  <buffer> <S-F7>       :!doxygen<CR>
    map! <buffer> <S-F7> <Esc> :!doxygen<CR>
    "map! <buffer> <F10> <Esc> :!./bin/Release/%:t:r<CR>
    set path+=src/include
    set path+=src/include/modele
    set path+=src/include/builders
endfunction

"Configuration des nouveaux fichiers en java
function! ConfigurationNouveauFichierJAVA()
    0r ~/.vim/CodeBasique/codeBasique.java
    :%substitute?NOMFICHIER?\=expand('%:t:r')?
    :1substitute?package truc?\= "package ".expand('%:p:.:h')?
    :1substitute?/?\.?ge
    " Permet d'utiliser gf sur les fichiers java.
    set includeexpr=substitute(v:fname,'\\.','/','g')
endfunction

" Fonction pour exécuter les fichiers java compilé selon l'existence ou non d'un makefile
" La première lettre du nom de dossier java est en minuscule pour exécuter le
" fichier java on convertit la première lettre du dossier en majuscule
function! ExistConfigurationJava()
    " Si il existe un fichier d'automatisation dans le dossier courant ou juste au dessus.
    if filereadable("build.xml") || filereadable("../build.xml")
        let $chemin = './'
        while !filereadable($chemin . 'build.xml')
            let $chemin = $chemin . '../'
        endwhile
        map  <buffer> <F5>          :!cd $chemin ; ant compile<CR>
        map! <buffer> <F5>    <Esc> :!cd $chemin ; ant compile<CR>
        map  <buffer> <S-F8>        :!cd $chemin ; ant test<CR>
        map! <buffer> <S-F8>  <Esc> :!cd $chemin ; ant test<CR>
        map  <buffer> <S-F9>        :!cd $chemin ; ant clean<CR>
        map! <buffer> <S-F9>  <Esc> :!cd $chemin ; ant clean<CR>
        map  <buffer> <F10>         :!cd $chemin ; ant run<CR>
        map! <buffer> <F10>   <Esc> :!cd $chemin ; ant run<CR>
        map  <buffer> <S-F11>       :!cd $chemin ; ant javadoc<CR>
        map! <buffer> <S-F11> <Esc> :!cd $chemin ; ant javadoc<CR>
    else
        " Il n'y a pas de fichier d'automatisation, compilation du fichier à la main.
        map  <buffer> <F5>          :make<CR>
        map! <buffer> <F5>    <Esc> :make<CR>
        map  <buffer> <F10>         :!java %<<CR>
        map! <buffer> <F10>   <Esc> :!java %<<CR>
        map  <buffer> <S-F11>       :!javadoc -encoding utf8 -docencoding utf8 -charset utf8 % && firefox %<.html &<CR>
        map! <buffer> <S-F11> <Esc> :!javadoc -encoding utf8 -docencoding utf8 -charset utf8 % && firefox %<.html &<CR>
    endif
    iabbrev <buffer> sopl System.out.println("")<Esc>hi
    iabbrev <buffer> sopf System.out.printf("")<Esc>hi
    iabbrev <buffer> sepl System.err.println("")<Esc>hi
    iabbrev <buffer> sepf System.err.printf("")<Esc>hi
endfunction

" Fonction pour définir les macros Latex ouvrir facilement le fichier pdf généré par xetex avec zathura
" TODO changer par zathura
function! MacrosLatexSpecifique()
    map  <buffer> <S-F8>        :!makeindex %<.idx<CR>
    map! <buffer> <S-F8>  <Esc> :!makeindex %<.idx<CR>
    map  <buffer> <S-F9>        :!rm -f %<.out %<.log %<.aux %<.toc %<.dvi %<.lof %<.lot %<.bbl %<.blg %<.idx %<.ilg %<.ind<CR>
    map! <buffer> <S-F9>  <Esc> :!rm -f %<.out %<.log %<.aux %<.toc %<.dvi %<.lof %<.lot %<.bbl %<.blg %<.idx %<.ilg %<.ind<CR>
    map  <buffer> <F10>         :!evince %<.pdf &<CR>
    map! <buffer> <F10>   <Esc> :!evince %<.pdf &<CR>
    map  <buffer> <S-F10>       :!zathura %<.pdf &<CR>
    map! <buffer> <S-F10> <Esc> :!zathura %<.pdf &<CR>
    if filereadable("bibliographie.bib")
        map  <buffer> <S-F11>       :!bibtex %< <CR>
        map! <buffer> <S-F11> <Esc> :!bibtex %< <CR>
    endif
    iabbrev <buffer> begin \begin{}<CR>\end{}<Esc>k$i
endfunction

inoremap <buffer> ;; ->

" Macros pour le php
function! ProgEnPHP()
    inoremap <buffer> ,, =>
    inoremap <buffer> t<Tab> $this->
endfunction

" Macros pour l'affichage formaté des fichiers groff
" La touche F5 affiche un aperçus dans le terminal pour les me
" La touche F10 affiche un aperçus dans le terminal pour les man
" La touche F12 ouvre le lecteur pdf
" Avec shift compile en pdf au lieu d'afficher sur le terminal
function! AffichageGroff()
    map  <buffer> <F5>         :!groff -Kutf8 -me  -Tutf8 % <CR>
    map! <buffer> <F5>    <Esc>:!groff -Kutf8 -me  -Tutf8 % <CR>
    map  <buffer> <S-F5>       :!groff -Kutf8 -me  -Tpdf  % &> %<.pdf <CR>
    map! <buffer> <S-F5>  <Esc>:!groff -Kutf8 -me  -Tpdf  % &> %<.pdf <CR>
    map  <buffer> <F10>        :!groff -Kutf8 -man -Tutf8 % <CR>
    map! <buffer> <F10>   <Esc>:!groff -Kutf8 -man -Tutf8 % <CR>
    map  <buffer> <S-F10>      :!groff -Kutf8 -man -Tpdf  % &> %.pdf <CR>
    map! <buffer> <S-F10> <Esc>:!groff -Kutf8 -man -Tpdf  % &> %.pdf <CR>
    map  <buffer> <F12>        :!zathura %<.pdf & <CR>
    map! <buffer> <F12>   <Esc>:!zathura %<.pdf & <CR>
    map  <buffer> <S-F12>      :!zathura %.pdf  & <CR>
    map! <buffer> <S-F12> <Esc>:!zathura %.pdf  & <CR>
endfunction

" Macros pour les fichiers bash
function! ScriptBash()
    iabbrev <buffer> if if [[ ]]; then<CR>fi<esc>k0EEa
    iabbrev <buffer> elif elif [[ ]]; then<esc>BBhi
    iabbrev <buffer> while while [[ ]]<CR>do<CR>done<esc>kk0EEa
    iabbrev <buffer> case case in<CR>cas)<CR>;;<CR>esac<esc>kkk0Ea
endfunction

" Macros pour le codage en html/css
function! PagesInternet()
    " Paragraphe html
    iabbrev <buffer> <p> <p><CR></p><esc>k$a
    " Élément d'une liste
    iabbrev <buffer> <li> <li></li><esc>bba
    " Liste ordonnée html
    iabbrev <buffer> <ol> <ol><CR><li></li><CR></ol><esc>k$bba
    " Liste non ordonneé
    iabbrev <buffer> <ul> <ul><CR><li></li><CR></ul><esc>k$bba
    " Image
    iabbrev <buffer> <img> <img src=""/><esc>hhi
    " Lien
    iabbrev <buffer> <a> <a href=""></a><esc>bbla
    " Tableau tr pour les lignes
    iabbrev <buffer> <table> <table><CR><thead><CR><tr><CR><th></th><CR></tr><CR></thead><CR><tbody><CR><tr><CR><td></td><CR></tr><CR><tbody><CR></table><esc>kkkkkkkk$bba
    " Ligne de tableau
    iabbrev <buffer> <tr> <tr><CR><td></td><CR></tr><esc>k$bba
    " Colonne de tableau
    iabbrev <buffer> <td> <td></td><esc>bba
    " Commentaire
    iabbrev <buffer> <!-- <!-- --><esc>bhi
endfunction

" Raccourcis pour les fichiers antlr compile et lance les tests
function! ConfigAntlr()
    map  <buffer> <F5>        :!./runAntlr.sh %< <CR>
    map! <buffer> <F5>  <Esc> :!./runAntlr.sh %< <CR>
    map  <buffer> <F10>       :!./runAntlr.sh %< test.code <CR>
    map! <buffer> <F10> <Esc> :!./runAntlr.sh %< test.code <CR>
endfunction

" Change le caractère pour déclencher le mapping en mode commande.
let mapleader = "ù"
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>b :buffers<CR>

map <leader>sh :SignifyToggleHighlight<CR>
map <leader>st :SignifyToggle<CR>
map <leader>sr :SignifyRefresh<CR>
nmap <leader>sj <plug>(signify-next-hunk)
nmap <leader>sk <plug>(signify-prev-hunk)

"iabbrev { {<CR>}<Esc>k$a
iabbrev /** /**<CR>*/<Esc>ka
iabbrev /* /*<CR>*/<Esc>ka

" Mappage des touches utiles
" Pour inverser une option booléenne utiliser set option!
" Pour afficher la valeur d'une option set option?
" FufBuffer permet de visualiser tout les buffers ouvert et d'y accéder
" FufBufferTagAll permet de chercher parmi tout les tags des fichiers ouvert
map  <F2>           :setlocal number!<CR>:setlocal number?<CR>
map! <F2>     <Esc> :setlocal number!<CR>:setlocal number?<CR>
map  <F3>           :setlocal spell!<CR>:setlocal spell?<CR>
map! <F3>     <Esc> :setlocal spell!<CR>:setlocal spell?<CR>
map  <F4>           :GundoToggle<CR>
map! <F4>     <Esc> :GundoToggle<CR>
map  <S-F5>         :w<CR>
map! <S-F5>   <Esc> :w<CR>
map  <F6>           :NERDTreeToggle<CR>
map! <F6>     <Esc> :NERDTreeToggle<CR>
map  <S-F6>         :UndotreeToggle<CR>
map! <S-F6>   <Esc> :UndotreeToggle<CR>
map  <F7>           :TagbarToggle<CR>
map! <F7>     <Esc> :TagbarToggle<CR>
map  <S-F7>         :nohls<CR>
map! <S-F7>   <Esc> :nohls<CR>
map  <F8>           :FufBuffer<CR>
map! <F8>     <Esc> :FufBuffer<CR>
map  <F9>           :FufBufferTagAll<CR>
map! <F9>     <Esc> :FufBufferTagAll<CR>
map  <S-F12>        :vsp ~/.vim/vimrc<CR>
map! <S-F12>  <Esc> :vsp ~/.vim/vimrc<CR>

" Mappage des touches en fonctions du type de fichier
autocmd FileType html,css,php,javascript    map  <buffer> <F10>      :!firefox % &<CR>
autocmd FileType html,css,php,javascript    map! <buffer> <F10> <Esc>:!firefox % &<CR>
" Recharge le vimrc quand utilise F5
autocmd FileType vim                        map  <buffer> <F5>       :source ~/.vim/vimrc<CR>
autocmd FileType vim                        map! <buffer> <F5>  <Esc>:source ~/.vim/vimrc<CR>
" Execute le script avec F5
autocmd Filetype perl,sh,python             map  <buffer> <F5>       :!./%<CR>
autocmd Filetype perl,sh,python             map! <buffer> <F5>  <Esc>:!./%<CR>

" Mappage selon la présence de makefile
autocmd FileType java,ant               call ExistConfigurationJava()
autocmd FileType tex                    call MacrosLatexSpecifique()
autocmd FileType html,java,xml,ant,php  call PagesInternet()
autocmd FileType php                    call ProgEnPHP()
autocmd FileType sh                     call ScriptBash()
autocmd FileType nroff,groff            call AffichageGroff()
autocmd Filetype antlr                  call ConfigAntlr()
autocmd FileType cpp                    call MacrosCPP()
autocmd FileType c,h                    call ExistMakeFileC()

" Rend le fichier courant exécutable à l'enregistrement si c'est pertinent
au BufWritePost * call ModeChange()

" Définition du colorsheme
" dans ~/.vim/colors/icansee.vim
colorscheme icansee

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.O=)(=O.o=)(=o.o=)(=-.-=)(=@.@=)(=~.~=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
"                           Début des réglages des extensions de Vim                                 "
" -------------------------------------------------------------------------------------------------- "

scriptencoding utf-8

" Pour configurer la compilation.
"./configure --with-features=huge \
"            --enable-multibyte \
"            --enable-rubyinterp \
"            --enable-pythoninterp \
"            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
"            --enable-perlinterp \
"            --enable-luainterp \
"            --enable-gui=gtk3 --with-x --enable-cscope --prefix=/usr \
"            --enable-python3interp=dynamic\
"            --with-python3-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu/ \
"            --with-lua-prefix=/usr/include/lua5.2 \
"            --with-python-config-dir=/usr/lib/ \
"            --enable-fail-if-missing

" :r ! ls ~/.vim/bundle/
" Liste des extension installée

" FuzzyFinder
" gundo.vim
" indentLine
" L9
" neocomplete.vim
" nerdtree
" OmniCppComplete
" python-syntax
" syntastic
" tagbar
" ultisnips
" undotree.vim
" vim-antlr
" vim-autoclose
" vim-fugitive
" vim-gitgutter
" vim-matchit
" vim-surround
" Vundle.vim

" Réglages pour GundoToggle
let g:gundo_width = 45              " Largeur de la fenêtre d'aperçus.
let g:gundo_preview_height = 15     " Hauteur de la fenêtre d'aperçus.
let g:gundo_right = 0               " Ouvre l'arbre à gauche.
let g:gundo_preview_bottom = 1      " Pour que la fenêtre d'aperçus prenne toute la largeur.
let g:gundo_close_on_revert = 1     " Fermer automatiquement après annulation.
let g:gundo_auto_preview = 1        " Désactive l'affichage automatique des différence.
let g:gundo_prefer_python3 = 1
let g:gundo_tree_statusline='%<%t %=| %-10.(%l/%L,C%02c%V%) | %P |'
let g:gundo_preview_statusline='%<%t %=%02B | %-10.(%l/%L,C%02c%V%) | %P |'

" Réglage pour undotree
let g:loaded_undotree = 1
let g:undotree_WindowLayout = 2
let g:undotree_SplitWidth = 45
let g:undotree_DiffpanelHeight = 15
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
"let g:undotree_TreeNodeShape = '|'

" Réglages pour NERDTree
let NERDTreeShowHidden = 1          " Pour afficher les fichiers caché.
let NERDTreeWinSize = 40
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen = 1          " Ferme automatiquement NERDTree quand on ouvre un fichier.

" Réglages pour tagbar
" Installer exuberant-ctags
let g:tagbar_autoclose = 1          " Ferme automatiquement tagbar
let g:tagbar_autofocus = 1          " Place le curseur dans la fenêtre tagbar
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_autopreview = 0
let g:tagbar_autoshowtag = 0
let g:tagbar_width = 50
let g:tagbar_sort = 0
let g:tagbar_systemenc = 'utf-8'

" Réglages pour UltiSnips
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-h>'
let g:UltiSnipsJumpBackwardTrigger = '<c-l>'

" Réglages pour indentLine
let g:indentLine_color_term = 3         " Jaune
let g:indentLine_color_gui = '#CA9700'
let g:indentLine_concealcursor = ''
let g:indentLine_conceallevel = 2
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_char = '✔'
let g:indentLine_faster = 1
let g:indentLine_fileTypeExclude = ['help']

" Réglages pour syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0     " N'effectue pas de vérification à la fermeture du fichier.
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_jump = 2       " Saute à la première erreur trouvée à la sauvegarde.
let g:syntastic_php_checkers = ['php']  " Pour ne pas avoir le checker de style et d'indentation.
let g:syntastic_python_checkers = ['python']  " Pour ne pas avoir le checker de style et d'indentation.
let g:syntastic_cpp_include_dirs = ['src/include/', 'src/include/modele/', 'src/include/builders/' ]
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Wextra'

" Réglages pour neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_multibyte_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1

" Pour que les double quote ne soit pas fermé dans les fichiers type vimrc.
let g:autoclose_vim_commentmode = 1

" Réglages pour signify
let g:signify_cursorhold_insert     = 0
let g:signify_cursorhold_normal     = 0
let g:signify_update_on_bufenter    = 0
let g:signify_update_on_focusgained = 1
let g:signify_sign_delete            = '↓'
let g:signify_sign_delete_first_line = '↑'

" Réglages pour gitgutter
"let g:gitgutter_sign_removed = '━'
"let g:gitgutter_override_sign_column_highlight = 0

" -------------------------------------------------------------------------------------------------- "
"                           Fin des réglages des extensions de Vim                                   "
" (=^.^=)(=O.O=)(=O.o=)(=o.o=)(=-.-=)(=@.@=)(=~.~=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
