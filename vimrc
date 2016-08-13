set nocompatible                        " Casser compatible avec vielle version

" Dernière modification : Samedi 13 août[08] 2016

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
"                          Début des réglages de Vundle                         "
" ----------------------------------------------------------------------------- "

filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim       " Ajoute le chemin pour initialiser Vundle au démarrage.
call vundle#begin( '~/.vim/bundle/' )

" Pour retrouver le dépôt git exact ajouter au début https://github.com
" Pour se maintenir à jours.
Plugin 'VundleVim/Vundle.vim'

Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'easymotion/vim-easymotion'
Plugin 'edsono/vim-matchit'
Plugin 'godlygeek/tabular'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'gregsexton/gitv'
Plugin 'hdima/python-syntax'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'mhinz/vim-signify'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'phongnh/vim-antlr'
Plugin 'rdnetto/YCM-Generator'
Plugin 'reedes/vim-pencil'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/FSwitch'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'vim-scripts/SpellCheck'
Plugin 'vim-scripts/ingo-library'

" Plugin pour gvim.
Plugin 'vim-scripts/hexHighlight.vim'

call vundle#end()
filetype plugin indent on
" Pense bête
" :PluginList       - Liste les extensions configuré
" :PluginInstall    - Installer
" :PluginUpdate     - Mettre à jours
" :PluginSearch foo - Cherche foo
" :PluginClean      - Supprime les extensions inutilisée

" ----------------------------------------------------------------------------- "
"                           Fin des réglages de Vundle                          "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "


syntax on

set noautochdir                         " Pour ne pas se changer automatiquement de répertoire
set   autoindent                        " Adapte l'indentation automatiquement
set   autoread                          " Permet de relire les fichiers modifié à l'extérieur
set   autowrite                         " Sauvegarde automatiquement le document
set noautowriteall                      " Sauvegarde automatiquement le document dans plus de cas
set   background=dark                   " Fixe la valeur du fond en sombre pour les thèmes
set   backspace=indent,eol,start        " Fixe le comportement de la touche backspace
set   backup                            " Conserve une copie de tout les fichiers édité
set   backupdir=$HOME/.vim/backup       " Définit le dossier de backup, sauvegarde le fichier avant de le modifier
if exists( '+breakindent' )
    set   breakindent                       " La ligne ne commence plus collée à gauche
    set   breakindentopt=min:55,shift:0     " Pour afficher les caractères de showbreak collé à gauche ajoutez sbr
endif
set   colorcolumn=81,151                " Affiche une colonne avec une couleur de fond
set   completeopt=menuone,longest       " Options pour le menu de l'omnicompletion
set   concealcursor=c                   " Quand le curseur est sur un caractère conceal il reste en conceal
set   conceallevel=2                    " Change les combinaison de caractère en leur équivalent utf-8
set noconfirm                           " Affiche une ligne de dialogue pour choisir une action
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
set   matchpairs=(:),{:},[:],«:»        " Trouver la paire correspondante"
set   modeline                          " Options spécifiques à vim dans les premières lignes
set   modelines=3                       " Nombres de lignes vérifiées à l'ouverture
set   nrformats=alpha,octal,hex         " Pour utiliser ctrl-a/ctrl-x avec les lettres les octaux(0) et les hexadécimaux(0x)
set   number                            " Affiche les numéros de ligne
set   printencoding=utf-8               " Fixe l'encodage pour l'impression
set   printoptions=paper:A4             " Permet de régler plusieurs options dont la taille du papier
set norelativenumber                    " Affiche le nombre de ligne relatif à la position
set   report=0                          " Affiche toujours le nombre de lignes modifié
set   scrolloff=7                       " Affiche au minimum les 3 lignes autour du curseur
set   shell=/bin/bash                   " Règle le shell à utiliser pour exécuter des commandes
set   shiftround                        " Indentation arrondie à un multiple de shiftwidth
set   shiftwidth=4                      " Taille des tabulations avec >> ou <<
set   showmatch                         " Affiche la parenthèse correspondante
set   showcmd                           " Affiche la commande quand elle est tapé
set   showbreak=―――>                    " Affiche un caractère au début d'une ligne enroulée
set   smartcase                         " Casse intelligente
set   smartindent                       " Indentation intelligente
set   smarttab                          " Suppression de tabulation intelligente
set   softtabstop=4                     " Taille des tabulation en édition
set   spell                             " Désactive la vérification orthographique
set   spelllang=fr                      " Dictionnaire en français
set   statusline=%!MaLigneStatus()      " La ligne de statut du buffer.
set   tabstop=4                         " Taille des tabulations avec tab
set   textwidth=0                       " Pour ne pas avoir de limite à la longueur des lignes
set   title                             " Modifier le titre du terminal
set   titlelen=255                      " Taille de la string dans le titre de la fenêtre d'application
set   undodir=~/.vim/undodir            " Définit le dossier d'annulation
set   undofile                          " Historique d'annulation persistant
set   undolevels=500                    " Fixe le nombre de changements conservé
set   wildmenu                          " Affiche le menu de complétion pour les commandes dans la barre de statut
set   wildmode=longest:full,full        " Complète d'abord avec la correspondance la plus longue sans ambigüité

" Thésaurus de synonyme français
set thesaurus+=~/.vim/spell/Thesaurus/thesaurus_fr_FR.txt

" Pour gvim
set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10


" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
"                    Début des réglages de la ligne de statut                   "
" ----------------------------------------------------------------------------- "

" Couper si la ligne est trop longue %<
" Le nom du chemin complet %f
" le tag d'aide %h
" la coloration utilisateur %1* ... %0*
" Si le fichier à été modifié %m
" Si le fichier est readonly %r
" Si la fenêtre est une preview %w
" Séparation entre gauche est droite %=
" Taille minimum de 10 caractères %-10
" Le numéro de la ligne %l. Le nombre de lignes %L
" Le numéro du caractère %c.
" Groupe %(%) . Formatage de nombre de caractères minimum %02 %3
" Le type du fichier %y. Le numéro du buffer actuel %n. Si plusieurs fichiers
" ouverts en même temps %a.
" Le code hexadécimal du caractère sous le curseur %B.
" La position dans le fichier en pourcentage %P
function! MaLigneStatus()

    if exists( '*fugitive#head()' )
        if fugitive#head() == ''
            let fugitLigne = ''
        else
            let fugitLigne = '%6*%{ fugitive#head() }:%0*'
        endif
        let etatDepot      = '%3*%{ StatAjout() }%0*' . '%4*%{ StatSuppression() }%0*' . '%5*%{ StatModifications() }%0*'
    else
        let fugitLigne     = ''
        let etatDepot      = ''
    endif

    if exists( '*SyntasticStatuslineFlag()' )
        let etatCheckCompil = '%#warningmsg#' . '%{ SyntasticStatuslineFlag() }' . '%*'
    else
        let etatCheckCompil = ''
    endif

    let nomFichier          = '%f'
    let flagStatutLigne     = ' %h%1*%m%0*%r%w '
    let posiCurseur         = '%-10.(%P, %3l/%L, C%02c%)'
    let buffInfos           = '%y buf:%n%a'
    let hexaCara            = '0x%02B'
    let encodageCara        = '%{ strlen( &fileencoding )? &fileencoding : &enc }'
    let typeFinLigne        = '%{ &fileformat }'
    let carSepaPGauche      = '  '
    let carSepaPDroit       = '  '
    "let carSepaPDroit      = '│'

    let ficEtBranche        = fugitLigne . nomFichier
    let ficFormat           = typeFinLigne . carSepaPGauche . encodageCara
    let gauche              = '%<' . ficEtBranche . carSepaPGauche . ficFormat . flagStatutLigne

    let posDansFic          = carSepaPDroit . posiCurseur
    let resumeErreur        = etatCheckCompil . ' ' . etatDepot
    let droite              = resumeErreur . posDansFic . carSepaPDroit . buffInfos . carSepaPDroit . hexaCara

    return gauche . '%=' . droite

endfunction

" Affiche les statistiques de modification du fichier courante par rapport à
" la version précédente du fichier.
function! StatWrapperGit()
    if exists( '*sy#repo#get_stats()' )
        return sy#repo#get_stats()
    else
        return [0, 0, 0]
    endif
endfunction

" Pour connaitre le nombre de lignes ajoutées au fichier courant [git]
function! StatAjout()
    let [added, modified, removed] = StatWrapperGit()
    if added > 0
        return '[' . printf( '+%s', added ) . ']'
    else
        return ''
    endif
endfunction

" Pour connaitre le nombre de lignes supprimées au fichier courant [git]
function! StatSuppression()
    let [added, modified, removed] = StatWrapperGit()
    if removed > 0
        return '[' . printf( '-%s', removed ) . ']'
    else
        return ''
    endif
endfunction

" Pour connaitre le nombre de lignes modifiées au fichier courant [git]
function! StatModifications()
    let [added, modified, removed] = StatWrapperGit()
    if modified > 0
        return '[' . printf( '~%s', modified ) . ']'
    else
        return ''
    endif
endfunction

" ----------------------------------------------------------------------------- "
"                     Fin des réglages de la ligne de statut                    "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "



" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
"                              Début des fonctions                              "
" ----------------------------------------------------------------------------- "

" Définie l'affichage de la ligne de repli.
function! MonFoldText()

    let line = getline( v:foldstart )
    let lignes = v:foldend - v:foldstart + 1
    let subFold = substitute( line, '^\s*\|(((\=', '', 'g' )
    let debut = '+' . v:folddashes . ' | ' . v:foldstart . '-' . v:foldend . ' |  '
    let nbLignes = printf( '%12s', lignes . ' lignes : ' )
    return  debut . nbLignes . subFold

endfunction

" Permet de changer les droits d'un fichier pour le rendre exécutable
function! ModeChange()
    if getline( 1 ) =~ '^#!.*/bin/'
        silent !chmod u+x <afile>
    endif
endfunction

" Pour connaitre le groupe de coloration de la zone sous le curseur.
function! MontrerGroupeSyntax()
    if !exists( '*synstack' )
        return
    endif
    echo map( synstack( line('.'), col('.') ), 'synIDattr( v:val, "name" )' )
endfunc

" Suppression automatique des espaces superflus
" \s correspond à un espace ou une tab \+ 1 ou plus $ fin de ligne
" /e pour ne pas générer d'erreur si on ne trouve pas de correspondance
function! Nettoyage()

    " Permet de récupérer la ligne et la colonne ou se trouve le curseur.
    let curcol = col( '.' )
    let curline = line( '.' )
    " Effectue la suppression des espaces en trop en fin de ligne.
    :%substitute/\s\+$//e
    " On remet le curseur la ou il était avant la suppression.
    call cursor( curline, curcol )
    " On retire les variables.
    unlet curcol
    unlet curline

endfunction

" Pour pouvoir ajouter ou modifier la date courante au début du fichier
function! DerniereModification()

    " Permet de récupérer la ligne et la colonne ou se trouve le curseur.
    let curcol = col( '.' )
    let curline = line( '.' )
    " On ne prend que les 20 premières lignes.
    if line( '$' ) > 20
        let l = 20
    else
        let l = line( '$' )
    endif
    " Met à jours la date dans les 20 premières ligne du fichier si il est
    " présent.
    exe '1,' . l . 'substitute/Dernière modification : .*/Dernière modification : ' . strftime( '%A %d %B[%m] %Y' ) . '/e'
    exe '1,' . l . 'substitute/Last Change:  .*/Last Change:  ' . strftime( '%A %d %B[%m] %Y' ) . '/e'
    " On remet le curseur la ou il était avant la suppression.
    call cursor( curline, curcol )
    unlet curcol
    unlet curline

endfun

" Si il y a un makefile on exécute le fichier compilé du même nom que celui du dossier sans la première majuscule
" sinon c'est le nom du fichier sans majuscule
function! ExistMakeFileC()

    if filereadable( 'makefile' ) || filereadable( 'Makefile' )

        let $nomFichier = substitute( split( getcwd(), '/' )[-1], "\\<\\u", "\\l\\0", "" )
        setlocal makeprg=make
        noremap  <buffer> <S-F9>        :make clean<Return>
        noremap! <buffer> <S-F9>  <Esc> :make clean<Return>
        noremap  <buffer> <F10>         :!./$nomFichier<Return>
        noremap! <buffer> <F10>   <Esc> :!./$nomFichier<Return>

    else

        setlocal makeprg=gcc\ -Wall\ -o\ %<\ %<.c
        noremap  <buffer> <F10>         :!./%<<Return>
        noremap! <buffer> <F10>   <Esc> :!./%<<Return>

    endif

endfunction

" Configuration des raccourcis pour compiler en ada.
function! ExistBuildAda()

    if filereadable( './build.gpr' )

        setlocal makeprg=gprbuild\ -d\ -Xmode=deb
        call g:gnat.Set_Project_File( './build.gpr' )
        noremap  <buffer> <F10>         :!./bin/debug/client<Return>
        noremap! <buffer> <F10>   <Esc> :!./bin/debug/client<Return>
        noremap  <buffer> <S-F9>        :!gprclean<Return>
        noremap! <buffer> <S-F9>  <Esc> :!gprclean<Return>

    else

        setlocal makeprg=gnatmake\ %
        noremap  <buffer> <F10>         :!./%<<Return>
        noremap! <buffer> <F10>   <Esc> :!./%<<Return>

    endif

    noremap  <buffer> <S-F8>        :!ctags -R --languages=ada --input-encoding=utf-8 --output-encoding=utf-8 ./src/<Return>
    noremap! <buffer> <S-F8>  <Esc> :!ctags -R --languages=ada --input-encoding=utf-8 --output-encoding=utf-8 ./src/<Return>

endfunction

" Configuration des nouveaux fichiers cpp
function! ConfigurationNouveauFichierCPP()

    0r ~/.vim/CodeBasique/codeBasique.cpp
    :%substitute?NOMFICHIER?\=expand( '%:t:r' )?g

endfunc

" Configure les nouveaux fichiers cpp
function! ConfigurationNouveauFichierHPP()

    0r ~/.vim/CodeBasique/codeBasique.hpp
    :%substitute?MANOUVELLECLASSE?\=expand( '%:t:r' )?g
    :%substitute@VARIABLE_A_CHANGER@\=expand( '%:t:r' ) . '_hpp'@

endfunction

" Maccros pour le cpp
" Compilation via makeprg
" Exécution via F10 du binaire
" Création des tags et compilation de la documentation.
" Pour trouver la classe correspondante taper :tag nomclasse.cpp
function! MacrosCPP()

    if filereadable( 'makefile' ) || filereadable( 'Makefile' )

        noremap  <buffer> <F10>         :!./bin/Release/client<Return>
        noremap! <buffer> <F10>   <Esc> :!./bin/Release/client<Return>
        noremap  <buffer> <S-F9>        :make clean<Return>
        noremap! <buffer> <S-F9>  <Esc> :make clean<Return>

    else

        let $nomFichier = substitute( split( getcwd(), '/' )[-1], "\\<\\u", "\\l\\0", "" )
        setlocal makeprg=g++\ -Wall\ -Wextra\ -std=c++11\ -o\ %<\ %
        noremap  <buffer> <F10>         :!./$nomFichier<Return>
        noremap! <buffer> <F10>   <Esc> :!./$nomFichier<Return>

    endif

    noremap  <buffer> <S-F8>        :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+fq --languages=c++ --input-encoding=utf-8 --output-encoding=utf-8 ./src/<Return>
    noremap! <buffer> <S-F8>  <Esc> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+fq --languages=c++ --input-encoding=utf-8 --output-encoding=utf-8 ./src/<Return>
    noremap  <buffer> <S-F11>       :!doxygen<Return>
    noremap! <buffer> <S-F11> <Esc> :!doxygen<Return>
    let g:load_doxygen_syntax = 1
    setlocal syntax=cpp.doxygen
    " Ajoute de tags pour l'omnicompletion
    " git clone https://github.com/universal-ctags/ctags.git
    " Compiler ctags avec utf-8 support
    " ./configure --enable-iconv
    " ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --input-encoding=utf-8 --output-encoding=utf-8 --language-force=C++ -f cpp cpp_src
    setlocal tags+=~/.vim/tags/cpp

endfunction

"Configuration des nouveaux fichiers en java
function! ConfigurationNouveauFichierJAVA()

    0r ~/.vim/CodeBasique/codeBasique.java
    :%substitute?NOMFICHIER?\=expand( '%:t:r' )?
    :1substitute?package truc?\= "package ".expand( '%:p:.:h' )?
    :1substitute?/?\.?ge
    " Permet d'utiliser gf sur les fichiers java.
    set includeexpr=substitute( v:fname,'\\.','/','g' )

endfunction

" Fonction pour exécuter les fichiers java compilé selon l'existence ou non d'un makefile
" La première lettre du nom de dossier java est en minuscule pour exécuter le
" fichier java on convertit la première lettre du dossier en majuscule
function! ExistConfigurationJava()

    " Si il existe un fichier d'automatisation dans le dossier courant.
    if filereadable( 'build.xml' )

        let $chemin = './'
        setlocal makeprg=ant\ compile
        noremap  <buffer> <S-F8>        :!ant test<Return>
        noremap! <buffer> <S-F8>  <Esc> :!ant test<Return>
        noremap  <buffer> <S-F9>        :!ant clean<Return>
        noremap! <buffer> <S-F9>  <Esc> :!ant clean<Return>
        noremap  <buffer> <F10>         :!ant run<Return>
        noremap! <buffer> <F10>   <Esc> :!ant run<Return>
        noremap  <buffer> <S-F11>       :!ant javadoc<Return>
        noremap! <buffer> <S-F11> <Esc> :!ant javadoc<Return>

    else

        " Il n'y a pas de fichier d'automatisation, compilation du fichier à la main.
        noremap  <buffer> <F10>         :!java %<<Return>
        noremap! <buffer> <F10>   <Esc> :!java %<<Return>
        noremap  <buffer> <S-F11>       :!javadoc -encoding utf8 -docencoding utf8 -charset utf8 % && firefox %<.html &<Return>
        noremap! <buffer> <S-F11> <Esc> :!javadoc -encoding utf8 -docencoding utf8 -charset utf8 % && firefox %<.html &<Return>

    endif

    noremap  <buffer> <S-F5>        :make<Return>
    noremap! <buffer> <S-F5>  <Esc> :make<Return>

endfunction

" Fonction pour définir les macros Latex ouvrir facilement le fichier pdf généré par xetex avec zathura
function! MacrosLatexSpecifique()

    NoMatchParen
    noremap  <buffer> <S-F8>        :!makeindex %<.idx<Return>
    noremap! <buffer> <S-F8>  <Esc> :!makeindex %<.idx<Return>
    noremap  <buffer> <S-F9>        :!rm -f %<.out %<.log %<.aux %<.toc %<.dvi %<.lof %<.lot %<.bbl %<.blg %<.idx %<.ilg %<.ind<Return>
    noremap! <buffer> <S-F9>  <Esc> :!rm -f %<.out %<.log %<.aux %<.toc %<.dvi %<.lof %<.lot %<.bbl %<.blg %<.idx %<.ilg %<.ind<Return>
    noremap  <buffer> <F10>         :!evince %<.pdf &<Return>
    noremap! <buffer> <F10>   <Esc> :!evince %<.pdf &<Return>
    noremap  <buffer> <S-F10>       :!zathura %<.pdf &<Return>
    noremap! <buffer> <S-F10> <Esc> :!zathura %<.pdf &<Return>

    if filereadable( 'bibliographie.bib' )
        noremap  <buffer> <S-F11>       :!bibtex %< <Return>
        noremap! <buffer> <S-F11> <Esc> :!bibtex %< <Return>
    endif

endfunction

" Macros pour l'affichage formaté des fichiers groff
" La touche F5 affiche un aperçus dans le terminal pour les me
" La touche F10 affiche un aperçus dans le terminal pour les man
" La touche F12 ouvre le lecteur pdf
" Avec shift compile en pdf au lieu d'afficher sur le terminal
function! AffichageGroff()

    noremap  <buffer> <S-F5>       :!groff -Kutf8 -me  -Tutf8 % <Return>
    noremap! <buffer> <S-F5>  <Esc>:!groff -Kutf8 -me  -Tutf8 % <Return>
    noremap  <buffer> <S-F5>       :!groff -Kutf8 -me  -Tpdf  % &> %<.pdf <Return>
    noremap! <buffer> <S-F5>  <Esc>:!groff -Kutf8 -me  -Tpdf  % &> %<.pdf <Return>
    noremap  <buffer> <F10>        :!groff -Kutf8 -man -Tutf8 % <Return>
    noremap! <buffer> <F10>   <Esc>:!groff -Kutf8 -man -Tutf8 % <Return>
    noremap  <buffer> <S-F10>      :!groff -Kutf8 -man -Tpdf  % &> %.pdf <Return>
    noremap! <buffer> <S-F10> <Esc>:!groff -Kutf8 -man -Tpdf  % &> %.pdf <Return>
    noremap  <buffer> <F12>        :!evince %<.pdf & <Return>
    noremap! <buffer> <F12>   <Esc>:!evince %<.pdf & <Return>
    noremap  <buffer> <S-F12>      :!evince %.pdf  & <Return>
    noremap! <buffer> <S-F12> <Esc>:!evince %.pdf  & <Return>

endfunction

" Raccourcis pour les fichiers antlr compile et lance les tests
function! ConfigAntlr()

    noremap  <buffer> <S-F5>       :!./runAntlr.sh %< <Return>
    noremap! <buffer> <S-F5> <Esc> :!./runAntlr.sh %< <Return>
    noremap  <buffer> <F10>        :!./runAntlr.sh %< test.code <Return>
    noremap! <buffer> <F10>  <Esc> :!./runAntlr.sh %< test.code <Return>

endfunction

" Macros pour le php
function! ProgEnPHP()

    inoremap <buffer>,, =>
    inoremap <buffer>t $this->

endfunction

" Fonction pour aligner automatiquement les lignes avec le caractère |
function! s:alignTabulation()
    let p = '^\s*|\s.*\s|\s*$'
    if exists( ':Tabularize' ) && getline( '.' ) =~# '^\s*|' && ( getline( line( '.' )-1 ) =~# p || getline( line( '.' )+1 ) =~# p )
        let column = strlen( substitute( getline( '.' )[0:col( '.' )], '[^|]', '', 'g' ) )
        let position = strlen( matchstr( getline( '.' )[0:col( '.' )], '.*|\s*\zs.*' ) )
        Tabularize/|/l1
        normal! 0
        call search( repeat( '[^|]*|', column ).'\s\{-\}'.repeat( '.', position ), 'ce', line( '.' ) )
    endif
endfunction

" ----------------------------------------------------------------------------- "
"                               Fin des fonctions                               "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "



" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
"                    Début des réglages des groupes d'actions                   "
" ----------------------------------------------------------------------------- "

" Pour activer cscope dans vim pour les sources qui peuvent en tirer parti.
if has( 'cscope' )

    set   cscopeprg=/usr/bin/cscope
    set   cscopetagorder=0
    set   cscopetag
    set nocscopeverbose
    " Ajoute la base de donnée cscope qui se trouve dans le dossier courant.
    if filereadable( 'cscope.out' )
        cs add cscope.out
    " sinon pointe la base définie par une variable d'environnement.
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set   cscopeverbose

endif

" Pour éviter les colonnes de limite de 80 et 150 caractères dans les quickfix
augroup fichierQuickfix
    autocmd!
    autocmd Filetype qf setlocal colorcolumn=0
    autocmd Filetype qf setlocal nospell
augroup END

" Pour l'ada permet de voir si on dépasse la colonne des 80 caractères
augroup codeSourceAda
    autocmd!
    autocmd Filetype ada setlocal textwidth=150
augroup END

" Pour que vim se souvienne de la position du curseur à la fermeture pour la prochaine ouverture
augroup recuperationEtatSessionsPrecedente
    autocmd!
    autocmd BufReadPost * if line( "'\"" ) > 1 && line( "'\"" ) <= line( '$' ) | exe "normal! g'\"" | endif
augroup END

" Pour supprimer les espaces en fin de ligne.
augroup nettoyage
    autocmd!
    autocmd BufWritePre * call Nettoyage()
augroup END

" Active la vérification orthographique pour certains type de fichier seulement
augroup langue
    autocmd!
    autocmd FileType haskell,fuf,gundo,diff,vundle,cmake,gitconfig,ant,tags,bib,conf,vundlelog,git,gitv setlocal nospell
augroup END

" Voir les espaces en fin de lignes
augroup configmake
    autocmd!
    autocmd Filetype make set listchars=nbsp:¤,tab:>-,trail:¤
    autocmd FileType make setlocal list                 " Affiche les caractères non imprimable
    autocmd FileType make setlocal tabstop=8            " Taille des tabulations avec tab
    autocmd FileType make setlocal shiftwidth=8         " Taille des tabulations avec >> ou <<
    autocmd FileType make setlocal softtabstop=8        " Taille des tabulation en édition
augroup END

" Permet de changer la date de dernière modification si elle existe
augroup datecreation
    autocmd!
    autocmd BufWritePre *       call DerniereModification()
augroup END

" Avoir squelette de base à la création d'un fichier
augroup squelette
    autocmd!
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
    autocmd BufNewFile *.cpp                call ConfigurationNouveauFichierCPP()
    autocmd BufNewFile *.hpp                call ConfigurationNouveauFichierHPP()
    autocmd BufNewFile build.xml            0r ~/.vim/CodeBasique/build.xml
    autocmd BufNewFile build.gpr            0r ~/.vim/CodeBasique/build.gpr
    autocmd BufNewFile bibliographie.bib    0r ~/.vim/CodeBasique/bibliographie.bib
    autocmd BufNewFile makefile             0r ~/.vim/CodeBasique/makefileBasique
    autocmd BufNewFile CMakeLists.txt       0r ~/.vim/CodeBasique/CMakeLists.txt
    autocmd BufNewFile Doxyfile             0r ~/.vim/CodeBasique/Doxyfile.base
augroup END

" Pour configurer automatiquement le make de vim selon le type de fichier
augroup reglageMake
    autocmd!
    autocmd FileType haskell    setlocal makeprg=ghci\ %
    autocmd FileType ocaml      setlocal makeprg=ocaml\ -init\ %
    autocmd FileType java       setlocal makeprg=javac\ -g\ %
    autocmd FileType sql        setlocal makeprg=mysql\ --password\ <\ %
    autocmd FileType tex        setlocal makeprg=xelatex\ %
    autocmd Filetype php        setlocal makeprg=php\ -l\ %
augroup END

" Mappage de la touche de compilation
" Les scripts n'utilisent pas ce raccourci de compilation
" pour des raisons de vitesse de retour à l'édition
augroup compilation
    autocmd!
    autocmd FileType tex,haskell,ocaml,sql,php,c,cpp,ada    noremap  <buffer> <S-F5>       :make <Return>
    autocmd FileType tex,haskell,ocaml,sql,php,c,cpp,ada    noremap! <buffer> <S-F5>  <Esc>:make <Return>
    autocmd Filetype perl,sh,python                         noremap  <buffer> <F10>        :!./% <Return>
    autocmd Filetype perl,sh,python                         noremap! <buffer> <F10>   <Esc>:!./% <Return>
augroup END

" Définition de la coloration syntaxique pour les fichier antlr
augroup ficherAntlr
    autocmd!
    autocmd BufRead *.g4        setlocal filetype=antlr
augroup END

" Rend le fichier courant exécutable à l'enregistrement si c'est pertinent
augroup rendreExecuable
    autocmd!
    autocmd BufWritePost *      call ModeChange()
augroup END

" Création d'une page de manuel avec ajout du nom automatiquement
augroup manuel
    autocmd!
    autocmd BufNewFile *.1      :%substitute?NOMCOMMANDE?\=expand( '%:t:r' )?
    autocmd BufNewFile *.1      :exe '%substitute/DATE/' . strftime( '%d %B %Y' ) . '/e'
augroup END

augroup commandesLocale
    autocmd!
    " Redéfinition de la commande d'aide utilisée avec K
    autocmd FileType tex                setlocal keywordprg=texdoc
    " Pour éviter les ralentissement dans les fichiers latex et plugin gundo
    autocmd FileType tex                setlocal nocursorline nocursorcolumn
    " Active les replis en se basant sur l'indentation
    autocmd FileType python,sh,perl,vim setlocal foldmethod=indent
    autocmd FileType gitcommit          setlocal cursorline nocursorcolumn
augroup END

" Recharge le vimrc quand utilise F5
augroup vimSource
    autocmd!
    autocmd FileType vim    noremap  <buffer> <S-F5>       :source ~/.vim/vimrc<Return>
    autocmd FileType vim    noremap! <buffer> <S-F5>  <Esc>:source ~/.vim/vimrc<Return>
augroup END

" Mappage selon la présence de makefile
augroup fonctionsConfiguration
    autocmd!
    autocmd FileType java,ant               call ExistConfigurationJava()
    autocmd FileType tex                    call MacrosLatexSpecifique()
    autocmd FileType php                    call ProgEnPHP()
    autocmd FileType nroff,groff            call AffichageGroff()
    autocmd Filetype antlr                  call ConfigAntlr()
    autocmd FileType cpp                    call MacrosCPP()
    autocmd FileType c,h                    call ExistMakeFileC()
    autocmd Filetype ada                    call ExistBuildAda()
augroup END

augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
"    autocmd FileType text         call pencil#init()
augroup END

" ----------------------------------------------------------------------------- "
"                    Fin des réglages des groupes d'actions                     "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "


" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
"                   Début des réglages des mappages de touches                  "
" ----------------------------------------------------------------------------- "

" Mappage des touches utiles
" Pour inverser une option booléenne utiliser set option!
" Pour afficher la valeur d'une option set option?
" FufBuffer permet de visualiser tout les buffers ouvert et d'y accéder
" FufBufferTagAll permet de chercher parmi tout les tags des fichiers ouvert

noremap  <F2>           :setlocal number!<Return>:setlocal number?<Return>
noremap! <F2>     <Esc> :setlocal number!<Return>:setlocal number?<Return>
noremap  <F3>           :setlocal spell!<Return>:setlocal spell?<Return>
noremap! <F3>     <Esc> :setlocal spell!<Return>:setlocal spell?<Return>
noremap  <F4>           :GundoToggle<Return>
noremap! <F4>     <Esc> :GundoToggle<Return>
noremap  <F5>           :w<Return>
noremap! <F5>     <Esc> :w<Return>
noremap  <F6>           :NERDTreeToggle<Return>
noremap! <F6>     <Esc> :NERDTreeToggle<Return>
noremap  <S-F6>         :UndotreeToggle<Return>
noremap! <S-F6>   <Esc> :UndotreeToggle<Return>
noremap  <F7>           :TagbarToggle<Return>
noremap! <F7>     <Esc> :TagbarToggle<Return>
noremap  <S-F7>         :nohls<Return>
noremap! <S-F7>   <Esc> :nohls<Return>
noremap  <F8>           :FufBuffer<Return>
noremap! <F8>     <Esc> :FufBuffer<Return>
noremap  <F9>           :FufBufferTagAll<Return>
noremap! <F9>     <Esc> :FufBufferTagAll<Return>
noremap  <S-F11>        :call DerniereModification()<Return>
noremap! <S-F11>  <Esc> :call DerniereModification()<Return>
noremap  <S-F12>        :vsp ~/.vim/vimrc<Return>
noremap! <S-F12>  <Esc> :vsp ~/.vim/vimrc<Return>

nnoremap gy :YcmGenerateConfig -f<Return>
nnoremap gh :call MontrerGroupeSyntax()<Return>
nnoremap gp :setlocal paste!<Return>:setlocal paste?<Return>

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>alignTabulation()<Return>a

" Change le caractère pour déclencher le mapping en mode commande.
let mapleader = 'ù'
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>
vnoremap <leader>ac <esc>`<i{<esc>`>a}<esc>
vnoremap <leader>br <esc>`<i[<esc>`>a]<esc>
vnoremap <leader>th <esc>`<i(<esc>`>a)<esc>

nnoremap <leader>gs :Gstatus<Return>
nnoremap <leader>gd :Gdiff<Return>
nnoremap <leader>gv :Gitv<Return>

nnoremap <leader>bs :buffers<Return>
nnoremap <leader>bb :bnext<Return>

nnoremap <leader>sh :SignifyToggleHighlight<Return>
nnoremap <leader>sr :SignifyRefresh<Return>
" Ne pas mettre noremap sinon le mappage ne fonctionne pas.
nmap <leader>sj <plug>(signify-next-hunk)
nmap <leader>sk <plug>(signify-prev-hunk)

nnoremap <leader>us :UpdateAndSpellCheck<Return>

nnoremap <leader>sy :SyntasticToggleMode<Return>

nnoremap <silent> <Leader>fff :FSHere<Return>
nnoremap <silent> <Leader>fh :FSLeft<Return>
nnoremap <silent> <Leader>ffh :FSSplitLeft<Return>
nnoremap <silent> <Leader>fl :FSRight<Return>
nnoremap <silent> <Leader>ffl :FSSplitRight<Return>
nnoremap <silent> <Leader>fk :FSAbove<Return>
nnoremap <silent> <Leader>ffk :FSSplitAbove<Return>
nnoremap <silent> <Leader>fj :FSBelow<Return>
nnoremap <silent> <Leader>ffj :FSSplitBelow<Return>

nnoremap <leader>o :copen<Return>
nnoremap <leader>c :cclose<Return>
nnoremap <leader>n :cnext<Return>
nnoremap <leader>p :cprevious<Return>

nnoremap <leader>1 <Plug>AirlineSelectTab1
nnoremap <leader>2 <Plug>AirlineSelectTab2
nnoremap <leader>3 <Plug>AirlineSelectTab3
nnoremap <leader>4 <Plug>AirlineSelectTab4
nnoremap <leader>5 <Plug>AirlineSelectTab5
nnoremap <leader>6 <Plug>AirlineSelectTab6
nnoremap <leader>7 <Plug>AirlineSelectTab7
nnoremap <leader>8 <Plug>AirlineSelectTab8
nnoremap <leader>9 <Plug>AirlineSelectTab9
nnoremap <leader>- <Plug>AirlineSelectPrevTab
nnoremap <leader>+ <Plug>AirlineSelectNextTab

if exists( ':Tabularize' )
    nnoremap <Leader>a= :Tabularize /=<Return>
    vnoremap <Leader>a= :Tabularize /=<Return>
    nnoremap <Leader>a: :Tabularize /:\zs<Return>
    vnoremap <Leader>a: :Tabularize /:\zs<Return>
endif

" ----------------------------------------------------------------------------- "
"                    Fin des réglages des mappages de touches                   "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "


" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
"                    Début des réglages des extensions de Vim                   "
" ----------------------------------------------------------------------------- "

scriptencoding utf-8

" -----------------------
" Réglages pour Gundo
" -----------------------
let g:gundo_width = 45              " Largeur de la fenêtre d'aperçus.
let g:gundo_preview_height = 15     " Hauteur de la fenêtre d'aperçus.
let g:gundo_right = 0               " Ouvre l'arbre à gauche.
let g:gundo_preview_bottom = 1      " Pour que la fenêtre d'aperçus prenne toute la largeur.
let g:gundo_close_on_revert = 1     " Fermer automatiquement après annulation.
let g:gundo_auto_preview = 0        " Désactive l'affichage automatique des différence.
let g:gundo_prefer_python3 = 0
let g:gundo_tree_statusline = '%<%t %=| %-10.(%l/%L,C%02c%V%) | %P |'
let g:gundo_preview_statusline = '%<%t %=%02B | %-10.(%l/%L,C%02c%V%) | %P |'

" -----------------------
" Réglages pour syntastic
" -----------------------
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0                 " N'effectue pas de vérification à la fermeture du fichier.
let g:syntastic_always_populate_loc_list = 1        " Remplie ll avec les erreurs trouvé.
let g:syntastic_auto_loc_list = 2               " ne pas ouvrir automatiquement ll mais fermer automatiquement.
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_jump = 2                   " Saute à la première erreur trouvée à la sauvegarde.
let g:syntastic_stl_format = '[%E{Err l: %fe #%e}%B{, }%W{Warn l: %fw #%w}]'
let g:syntastic_ignore_files = ['build.gpr']
" php
let g:syntastic_php_checkers = ['php']          " Pour ne pas avoir le checker de style et d'indentation.
" perl
let g:syntastic_enable_perl_checker = 1         " À désactiver si on travail sur des perl écrit par d'autres.
let g:syntastic_perl_checkers = ['perl', 'podchecker']
" python
let g:syntastic_python_checkers = ['python']    " Pour ne pas avoir le checker de style et d'indentation.
" LaTeX
let g:syntastic_tex_checkers = ['lacheck']      " Pour ne pas avoir le checker d'accent.
" cpp
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Wextra'
let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
" Les fichiers doivent être de la forme -Ichemin/du/dossier

" -----------------------
" Réglage pour undotree
" -----------------------
let g:undotree_WindowLayout = 2
let g:undotree_SplitWidth = 45
let g:undotree_DiffpanelHeight = 10
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1

" -----------------------
" Réglages pour NERDTree
" -----------------------
let NERDTreeShowHidden = 1          " Pour afficher les fichiers caché.
let NERDTreeWinSize = 40
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen = 1          " Ferme automatiquement NERDTree quand on ouvre un fichier.

" -----------------------
" Réglages pour tagbar
" -----------------------
" Installer exuberant-ctags
let g:tagbar_autoclose = 1          " Ferme automatiquement tagbar
let g:tagbar_autofocus = 1          " Place le curseur dans la fenêtre tagbar
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_autopreview = 0
let g:tagbar_autoshowtag = 0
let g:tagbar_width = 50
let g:tagbar_sort = 0
let g:tagbar_systemenc = 'utf-8'
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_type_ada = {
    \ 'ctagstype': 'ada',
    \ 'kinds' : [
        \'P:package specs',
        \'p:packages',
        \'t:type',
        \'u:subtypes',
        \'c:record type components',
        \'l:enum type literals',
        \'v:variables',
        \'f:formal parameters',
        \'n:constants',
        \'x:exceptions',
        \'R:subprogram specs',
        \'r:subprograms',
        \'K:task specs',
        \'k:tasks',
        \'O:protected data specs',
        \'o:protected data',
        \'e:entries',
        \'b:labels',
        \'i:identifiers'
    \]
    \}

" -----------------------
" Réglages pour UltiSnips
" -----------------------
if has( 'python3' )
    let g:UltiSnipsUsePythonVersion = 3
else
    let g:UltiSnipsUsePythonVersion = 2
endif
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-h>'
let g:UltiSnipsJumpBackwardTrigger = '<c-l>'

" -----------------------
" Réglage pour YouCompleteMe
" -----------------------
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_complete_in_comments = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_confirm_extra_conf = 0            " À changer dés que possible.
let g:ycm_allow_changing_updatetime = 0
let g:ycm_extra_conf_globlist = []

" -----------------------
" Réglages pour signify
" -----------------------
let g:signify_disable_by_default     = 0
let g:signify_cursorhold_insert      = 0
let g:signify_cursorhold_normal      = 0
let g:signify_update_on_bufenter     = 0
let g:signify_update_on_focusgained  = 1
let g:signify_sign_delete            = '↓'
let g:signify_sign_delete_first_line = '↑'

" -----------------------
" Réglages pour SpellCheck
" -----------------------
let g:SpellCheck_DefineQuickfixMappings = 1

" -----------------------
" Réglages pour gitv
" -----------------------
let g:Gitv_OpenHorizontal = 0
let g:Gitv_DoNotMapCtrlKey = 1

" -----------------------
" Réglages pour FSwitch
" -----------------------
let g:fsnonewfiles = 1
" Réglages de FSwitch pour les hpp
augroup fichierHppHeader
    autocmd!
    autocmd BufEnter *.hpp let b:fswitchdst  = 'cpp'
    autocmd BufEnter *.hpp let b:fswitchlocs = 'reg:|src/include|src|'
augroup END
" Réglages de FSwitch pour les cpp
augroup fichierCppCode
    autocmd!
    autocmd BufEnter *.cpp let b:fswitchdst  = 'hpp'
    autocmd BufEnter *.cpp let b:fswitchlocs = 'reg:|src|src/include|'
augroup END
" Réglage de FSwitch pour les adb
augroup fichierCorpAda
    autocmd!
    autocmd BufEnter *.adb let b:fswitchdst  = 'ads'
    autocmd BufEnter *.adb let b:fswitchlocs = 'rel:./spec/'
augroup END
" Réglage de FSwitch pour les ads
augroup fichierSpecAda
    autocmd!
    autocmd BufEnter *.ads let b:fswitchdst  = 'adb'
    autocmd BufEnter *.ads let b:fswitchlocs = 'rel:./../'
augroup END
" -----------------------

" -----------------------
" Réglage pour OmniCppComplete
" -----------------------
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " Montre les paramètres des fonctions.
let OmniCpp_MayCompleteDot = 1      " auto complète après .
let OmniCpp_MayCompleteArrow = 1    " auto complète après ->
let OmniCpp_MayCompleteScope = 1    " auto complète après ::

" -----------------------
" Réglage pour airline
" -----------------------
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'newDark'

let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = '····'
let g:airline#extensions#branch#displayed_head_limit = 10

" -----------------------
" Réglages pour indent guides
" -----------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_default_mapping = 1

" -----------------------
" Réglage du plugin pour ada
" -----------------------
let g:ada_standard_types = 1
let g:ada_with_gnat_project_files = 1
let g:ada_omni_with_keywords = 1
let g:ada_extended_completion = 1
let g:ada_gnat_extensions = 1
let g:ada_space_errors = 1
let g:ada_all_tab_usage = 1
let g:ada_default_compiler = 'gnat'

" -----------------------
" Réglages pour tabular
" -----------------------
"let g:tabular_loaded = 1

" -----------------------
" Réglages pour vim-pencil
" -----------------------
let g:pencil#autoformat_config = {
            \ 'markdown': {
            \     'black' : [
            \         'htmlH[0-9]',
            \         'markdown(Code|H[0-9]|Url|IdDeclaration|Link|Rule|Highlight[A-Za-z0-9]+)',
            \         'markdown(FencedCodeBlock|InlineCode)',
            \         'mkd(Code|Rule|Delimiter|Link|ListItem|IndentCode)',
            \         'mmdTable[A-Za-z0-9]*',
            \         ],
            \     'white': [
            \         'markdown(Code|Link)',
            \         ],
            \     },
            \ }

" -----------------------
" Réglage pour mon thème de couleurs.
" -----------------------
let g:interstellaire_termcolors = 256

" ----------------------------------------------------------------------------- "
"                     Fin des réglages des extensions de Vim                    "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "

" Définition du colorsheme
colorscheme interstellaire
