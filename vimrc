set nocompatible                        " Casser compatible avec vielle version

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.O=)(=O.o=)(=o.o=)(=-.-=)(=@.@=)(=~.~=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
"                                    Début des réglages de Vundle                                    "
" -------------------------------------------------------------------------------------------------- "

filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim       " Ajoute le chemin pour initialiser Vundle au démarrage.
call vundle#begin('~/.vim/bundle/')

" Pour se maintenir à jours.
Plugin 'VundleVim/Vundle.vim'

Plugin 'Shougo/neocomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Yggdroot/indentLine'
Plugin 'easymotion/vim-easymotion'
Plugin 'edsono/vim-matchit'
Plugin 'gregsexton/gitv'
Plugin 'hdima/python-syntax'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'mhinz/vim-signify'
Plugin 'phongnh/vim-antlr'
Plugin 'reedes/vim-pencil'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'spf13/vim-autoclose'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
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

" -------------------------------------------------------------------------------------------------- "
"                                     Fin des réglages de Vundle                                     "
" (=^.^=)(=O.O=)(=O.o=)(=o.o=)(=-.-=)(=@.@=)(=~.~=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "

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
set guifont=Ubuntu\ Mono\ derivative\ powerline

"set patchmode=.original            " Crée une copie de l'original du fichier édité

" ================== Changer la ligne de statut de vim. ==================
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
    let nomFichier = '%f '
    if exists('*fugitive#head()')
        if fugitive#head() == ''
            let fugitLigne = ''
        else
            let fugitLigne = '%6*%{fugitive#head()}:%0*'
        endif
    else
        let fugitLigne = ''
    endif
    if exists('*SyntasticStatuslineFlag()')
        let etatCheckCompil = '%#warningmsg#' . '%{SyntasticStatuslineFlag()}' . '%*'
    else
        let etatCheckCompil = ''
    endif
    let etatDepot = '%3*%{StatAjout()}%0*' . '%4*%{StatSuppression()}%0*' . '%5*%{StatModifications()}%0*'
    let flagStatutLigne = '%h%1*%m%0*%r%w '
    let posiCurseur = '%-10.(%P, %3l/%L, C%02c%)'
    let buffInfos = '%y buf:%n%a'
    let hexaCara = '0x%02B'
    let carSepa = ''
    "let carSepa = '‖'
    return '%<' . fugitLigne . nomFichier . ' ' . flagStatutLigne . '%=' . etatCheckCompil . ' ' . etatDepot . ' ' . carSepa . ' ' . posiCurseur . ' ' . carSepa . ' ' . buffInfos . ' ' . carSepa . ' ' . hexaCara
endfunction

" Affiche les statistiques de modification du fichier courante par rapport à
" la version précédente du fichier.
function! StatWrapperGit()
    if exists('*fugitive#head()')
        return sy#repo#get_stats()
    else
        return [0, 0, 0]
    endif
endfunction

" Pour connaitre le nombre de lignes ajoutées au fichier courant [git]
function! StatAjout()
    let [added, modified, removed] = StatWrapperGit()
    if added > 0
        return '[' . printf('+%s', added ) . ']'
    else
        return ''
    endif
endfunction

" Pour connaitre le nombre de lignes supprimées au fichier courant [git]
function! StatSuppression()
    let [added, modified, removed] = StatWrapperGit()
    if removed > 0
        return '[' . printf('-%s', removed ) . ']'
    else
        return ''
    endif
endfunction

" Pour connaitre le nombre de lignes modifiées au fichier courant [git]
function! StatModifications()
    let [added, modified, removed] = StatWrapperGit()
    if modified > 0
        return '[' . printf('~%s', modified ) . ']'
    else
        return ''
    endif
endfunction

" ================== Fin des fonctions de la ligne de statut de vim. ==================

" Définie l'affichage de la ligne de repli.
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

" Pour connaitre le groupe de coloration de la zone sous le curseur.
function! MontrerGroupeSyntax()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Suppression automatique des espaces superflus
" \s correspond à un espace ou une tab \+ 1 ou plus $ fin de ligne
" /e pour ne pas générer d'erreur si on ne trouve pas de correspondance
function! Nettoyage()
    let curcol = col(".")
    let curline = line(".")
    :%s/\s\+$//e
    call cursor(curline, curcol)
    unlet curcol
    unlet curline
endfunction

" Pour que vim se souvienne de la position du curseur à la fermeture pour la prochaine ouverture
augroup recuperationEtatSessionsPrecedente
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup end

" Pour supprimer les espaces en fin de ligne.
augroup nettoyage
    autocmd!
    autocmd BufWritePre * call Nettoyage()
augroup end

" Active la vérification orthographique pour certains type de fichier seulement
augroup langue
    autocmd!
    autocmd FileType haskell,fuf,gundo,diff,vundle,cmake,gitconfig,ant,tags,bib,conf,vundlelog,git,gitv setlocal nospell
augroup end

" Voir les espaces en fin de lignes
augroup configmake
    autocmd!
    autocmd Filetype make set listchars=nbsp:¤,tab:>-,trail:¤
    autocmd FileType make setlocal list                 " Affiche les caractères non imprimable
    autocmd FileType make setlocal tabstop=8            " Taille des tabulations avec tab
    autocmd FileType make setlocal shiftwidth=8         " Taille des tabulations avec >> ou <<
    autocmd FileType make setlocal softtabstop=8        " Taille des tabulation en édition
augroup end

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
    autocmd BufNewFile *.cpp                0r ~/.vim/CodeBasique/codeBasique.cpp
    autocmd BufNewFile *.hpp                call ConfigurationNouveauFichierHPP()
    autocmd BufNewFile build.xml            0r ~/.vim/CodeBasique/build.xml
    autocmd BufNewFile bibliographie.bib    0r ~/.vim/CodeBasique/bibliographie.bib
    autocmd BufNewFile makefile             0r ~/.vim/CodeBasique/makefileBasique
    autocmd BufNewFile CMakeLists.txt       0r ~/.vim/CodeBasique/CMakeLists.txt
    autocmd BufNewFile Doxyfile             0r ~/.vim/CodeBasique/Doxyfile.base
augroup end

" Pour configurer automatiquement le make de vim selon le type de fichier
augroup reglageMake
    autocmd!
    autocmd FileType haskell    setlocal makeprg=ghci\ %
    autocmd FileType ocaml      setlocal makeprg=ocaml\ -init\ %
    autocmd FileType java       setlocal makeprg=javac\ -g\ %
    autocmd FileType sql        setlocal makeprg=mysql\ --password\ <\ %
    autocmd FileType tex        setlocal makeprg=xelatex\ %
    autocmd Filetype php        setlocal makeprg=php\ -l\ %
augroup end
"autocmd FileType cpp            setlocal makeprg=g++\ -Wall\ -Wextra\ -o\ %<\ %
" Ancienne version pour les fichier LaTeX
"autocmd FileType tex setlocal makeprg=latex\ %\ &&\ dvips\ %<.dvi\ &&\ ps2pdf\ %<.ps

" Mappage de la touche de compilation
" Les scripts n'utilisent pas ce raccourci de compilation
" pour des raisons de vitesse de retour à l'édition
augroup compilation
    autocmd!
    autocmd FileType tex,haskell,ocaml,sql,php  map  <buffer> <F5>       :make <CR>
    autocmd FileType tex,haskell,ocaml,sql,php  map! <buffer> <F5>  <Esc>:make <CR>
    autocmd Filetype perl,sh,python             map  <buffer> <F5>       :!./% <CR>
    autocmd Filetype perl,sh,python             map! <buffer> <F5>  <Esc>:!./% <CR>
augroup end

" Définition de la coloration syntaxique pour les fichier antlr
augroup ficherAntlr
    autocmd!
    autocmd BufRead *.g4    setlocal filetype=antlr
augroup end

" Rend le fichier courant exécutable à l'enregistrement si c'est pertinent
augroup rendreExecuable
    autocmd!
    autocmd BufWritePost * call ModeChange()
augroup end

" Création d'une page de manuel avec ajout du nom automatiquement
augroup manuel
    autocmd!
    autocmd BufNewFile *.1      :%substitute?NOMCOMMANDE?\=expand('%:t:r')?
augroup end

augroup commandesLocale
    autocmd!
    " Redéfinition de la commande d'aide utilisée avec K
    autocmd FileType tex            setlocal keywordprg=texdoc
    " Pour éviter les ralentissement dans les fichiers latex et plugin gundo
    autocmd FileType tex            setlocal nocursorline nocursorcolumn
    " Active les replis en se basant sur l'indentation
    autocmd FileType python,sh,perl setlocal foldmethod=indent
augroup end

" Mappage des touches en fonctions du type de fichier
augroup web
    autocmd!
    autocmd FileType html,css,php,javascript    map  <buffer> <F10>      :!firefox % &<CR>
    autocmd FileType html,css,php,javascript    map! <buffer> <F10> <Esc>:!firefox % &<CR>
augroup end

" Recharge le vimrc quand utilise F5
augroup vimSource
    autocmd!
    autocmd FileType vim    map  <buffer> <F5>       :source ~/.vim/vimrc<CR>
    autocmd FileType vim    map! <buffer> <F5>  <Esc>:source ~/.vim/vimrc<CR>
augroup end

" Mappage selon la présence de makefile
augroup fonctionsConfiguration
    autocmd!
    autocmd FileType java,ant               call ExistConfigurationJava()
    autocmd FileType tex                    call MacrosLatexSpecifique()
    autocmd FileType html,java,xml,ant,php  call PagesInternet()
    autocmd FileType php                    call ProgEnPHP()
    autocmd FileType sh                     call ScriptBash()
    autocmd FileType nroff,groff            call AffichageGroff()
    autocmd Filetype antlr                  call ConfigAntlr()
    autocmd FileType cpp                    call MacrosCPP()
    autocmd FileType c,h                    call ExistMakeFileC()
augroup end

" Active l'omnicompletion
if exists ('+omnifunc') && &omnifunc == ""
    setlocal omnifunc=syntaxcomplete#Complete
    setlocal completefunc=syntaxcomplete#Complete
endif

augroup completion
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
augroup end

augroup menuAutocompletion
    autocmd!
    autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
augroup end

augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
    autocmd FileType text         call pencil#init()
augroup end

" Si un makefile existe on utilise la commande de shell make plutôt que celle de vim sinon on utilise l'utilitaire make de vim
" Si il y a un makefile on exécute le fichier compilé du même nom que celui du dossier sans la première majuscule sinon c'est le nom du fichier sans majuscule
" Pour retirer la première majuscule sont équivalent :
" :echo substitute(split(getcwd(), '/')[-1], "\\(\\<\\u\\)", "\\l\\1", "")
" :echo substitute(split(getcwd(), '/')[-1], "\\(\\<\\u\\)", "\\L\\1", "")
" :echo substitute(split(getcwd(), '/')[-1], ".*", "\\l\\0", "")
" :echo substitute(split(getcwd(), '/')[-1], "\\<\\u", "\\L\\0", "")
function! ExistMakeFileC()
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

" Configure les nouveaux fichiers cpp
function! ConfigurationNouveauFichierHPP()
    0r ~/.vim/CodeBasique/codeBasique.hpp
    :%substitute?MANOUVELLECLASSE?\=expand('%:t:r')?g
    :%substitute@VARIABLE_A_CHANGER@\=expand('%:t:r') . '_hpp'@
endfunction

" Maccros pour le cpp
" Compilation via makeprg
" Exécution via F10 du binaire
" Création des tags et compilation de la documentation.
" Pour trouver la classe correspondante taper :tag nomclasse.cpp
function! MacrosCPP()
    if filereadable("makefile") || filereadable("Makefile")
        map  <buffer> <F10>         :!./bin/Release/client<CR>
        map! <buffer> <F10>   <Esc> :!./bin/Release/client<CR>
        map  <buffer> <S-F9>        :make clean<CR>
        map! <buffer> <S-F9>  <Esc> :make clean<CR>
    else
        let $nomFichier = substitute(split(getcwd(), '/')[-1], "\\<\\u", "\\l\\0", "")
        setlocal makeprg=g++\ -Wall\ -Wextra\ -o\ %<\ %
        map  <buffer> <F10>         :!./$nomFichier<CR>
        map! <buffer> <F10>   <Esc> :!./$nomFichier<CR>
    endif
    map  <buffer> <F5>          :make<CR>
    map! <buffer> <F5>    <Esc> :make<CR>
    map  <buffer> <S-F8>        :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+fq ./src/<CR>
    map! <buffer> <S-F8>  <Esc> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+fq ./src/<CR>
    map  <buffer> <S-F11>       :!doxygen<CR>
    map! <buffer> <S-F11> <Esc> :!doxygen<CR>
    setlocal path=.,src/include,src/include/modele,src/include/builders,src/include/builders/lorraine
	let g:load_doxygen_syntax = 1
    setlocal syntax=cpp.doxygen
    " Ajoute de tags pour l'omnicompletion
    " ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f cpp cpp_src
    setlocal tags+=~/.vim/tags/cpp
    let OmniCpp_NamespaceSearch = 1
    let OmniCpp_GlobalScopeSearch = 1
    let OmniCpp_ShowAccess = 1
    let OmniCpp_ShowPrototypeInAbbr = 1 " Montre les paramètres des fonctions.
    let OmniCpp_MayCompleteDot = 1      " auto complète après .
    let OmniCpp_MayCompleteArrow = 1    " auto complète après ->
    let OmniCpp_MayCompleteScope = 1    " auto complète après ::
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
    " Si il existe un fichier d'automatisation dans le dossier courant.
    if filereadable("build.xml")
        let $chemin = './'
        setlocal makeprg=ant\ compile
        map  <buffer> <S-F8>        :!ant test<CR>
        map! <buffer> <S-F8>  <Esc> :!ant test<CR>
        map  <buffer> <S-F9>        :!ant clean<CR>
        map! <buffer> <S-F9>  <Esc> :!ant clean<CR>
        map  <buffer> <F10>         :!ant run<CR>
        map! <buffer> <F10>   <Esc> :!ant run<CR>
        map  <buffer> <S-F11>       :!ant javadoc<CR>
        map! <buffer> <S-F11> <Esc> :!ant javadoc<CR>
    else
        " Il n'y a pas de fichier d'automatisation, compilation du fichier à la main.
        map  <buffer> <F10>         :!java %<<CR>
        map! <buffer> <F10>   <Esc> :!java %<<CR>
        map  <buffer> <S-F11>       :!javadoc -encoding utf8 -docencoding utf8 -charset utf8 % && firefox %<.html &<CR>
        map! <buffer> <S-F11> <Esc> :!javadoc -encoding utf8 -docencoding utf8 -charset utf8 % && firefox %<.html &<CR>
    endif
    map  <buffer> <F5>          :make<CR>
    map! <buffer> <F5>    <Esc> :make<CR>
    iabbrev <buffer> sopl System.out.println( "" )<Esc>hhi
    iabbrev <buffer> sopf System.out.printf( "" )<Esc>hhi
    iabbrev <buffer> sepl System.err.println( "" )<Esc>hhi
    iabbrev <buffer> sepf System.err.printf( "" )<Esc>hhi
endfunction

" Fonction pour définir les macros Latex ouvrir facilement le fichier pdf généré par xetex avec zathura
function! MacrosLatexSpecifique()
    NoMatchParen
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

" Macros pour le php
function! ProgEnPHP()
    iabbrev <buffer> ,, =>
    iabbrev <buffer> t $this->
endfunction

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
map  <C-F12> 	  	:call MontrerGroupeSyntax()<CR>
map! <C-F12> <Esc>	:call MontrerGroupeSyntax()<CR>

"iabbrev { {<CR>}<Esc>k$a
iabbrev /** /**<CR>*/<Esc>ka
iabbrev /* /*<CR>*/<Esc>ka

iabbrev <buffer> !! ->

" Change le caractère pour déclencher le mapping en mode commande.
let mapleader = 'ù'
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>bs :buffers<CR>
map <leader>bb :bnext<CR>

map <leader>sh :SignifyToggleHighlight<CR>
map <leader>st :SignifyToggle<CR>
map <leader>sr :SignifyRefresh<CR>
map <leader>sj <plug>(signify-next-hunk)
map <leader>sk <plug>(signify-prev-hunk)

map <leader>us :UpdateAndSpellCheck<CR>

map <leader>sy :SyntasticToggleMode<CR>

map <leader>o :copen 20<CR>
map <leader>c :cclose<CR>
map <leader>n :cnext<CR>
map <leader>p :cprevious<CR>

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
"            --enable-cscope \
"            --enable-gui=gtk3 --with-x --prefix=/usr \
"            --enable-python3interp=dynamic\
"            --with-python3-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu/ \
"            --with-lua-prefix=/usr/include/lua5.2 \
"            --with-python-config-dir=/usr/lib/ \
"            --enable-fail-if-missing

" :r ! ls ~/.vim/bundle/
" Liste des extension installée

" -----------------------
" Réglages pour GundoToggle
" -----------------------
let g:gundo_width = 45              " Largeur de la fenêtre d'aperçus.
let g:gundo_preview_height = 15     " Hauteur de la fenêtre d'aperçus.
let g:gundo_right = 0               " Ouvre l'arbre à gauche.
let g:gundo_preview_bottom = 1      " Pour que la fenêtre d'aperçus prenne toute la largeur.
let g:gundo_close_on_revert = 1     " Fermer automatiquement après annulation.
let g:gundo_auto_preview = 0        " Désactive l'affichage automatique des différence.
let g:gundo_prefer_python3 = 1
let g:gundo_tree_statusline='%<%t %=| %-10.(%l/%L,C%02c%V%) | %P |'
let g:gundo_preview_statusline='%<%t %=%02B | %-10.(%l/%L,C%02c%V%) | %P |'

" -----------------------
" Réglages pour syntastic
" -----------------------
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0     " N'effectue pas de vérification à la fermeture du fichier.
let g:syntastic_always_populate_loc_list = 1        " Remplie ll avec les erreurs trouvé.
let g:syntastic_auto_loc_list = 2       " ne pas ouvrir automatiquement ll mais fermer automatiquement.
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_jump = 2       " Saute à la première erreur trouvée à la sauvegarde.
" php
let g:syntastic_php_checkers = ['php']  " Pour ne pas avoir le checker de style et d'indentation.
" perl
let g:syntastic_enable_perl_checker = 1     " À désactiver si on travail sur des perl écrit par d'autres.
let g:syntastic_perl_checkers = ['perl', 'podchecker']
" python
let g:syntastic_python_checkers = ['python']  " Pour ne pas avoir le checker de style et d'indentation.
" cpp
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Wextra'
let g:syntastic_stl_format = '[%E{Err ligne: %fe #%e}%B{, }%W{Warn ligne: %fw #%w}]'
let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
" Les fichiers doivent être de la forme -Ichemin/du/dossier
"let g:syntastic_cpp_include_dirs = ['src/include/', 'src/include/modele/', 'src/include/builders/', 'src/include/builders/lorraine' ]

" -----------------------
" Réglage pour undotree
" -----------------------
let g:undotree_WindowLayout = 2
let g:undotree_SplitWidth = 45
let g:undotree_DiffpanelHeight = 15
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

" -----------------------
" Réglages pour UltiSnips
" -----------------------
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-h>'
let g:UltiSnipsJumpBackwardTrigger = '<c-l>'

" -----------------------
" Réglages pour indentLine
" -----------------------
let g:indentLine_color_term = 3         " Jaune
let g:indentLine_color_gui = '#CA9700'
let g:indentLine_concealcursor = ''
let g:indentLine_conceallevel = 2
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_char = '✔'
let g:indentLine_faster = 0
let g:indentLine_fileTypeExclude = ['help', 'text', '']

" -----------------------
" Réglages pour neocomplete
" -----------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 15
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_multibyte_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1

" -----------------------
" Réglages pour autoclose
" -----------------------
" Pour que les double quotte ne soit pas fermé dans les fichiers type vimrc.
let g:autoclose_vim_commentmode = 1

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
let g:Gitv_OpenHorizontal = 1
let g:Gitv_DoNotMapCtrlKey = 1

" -----------------------
" Réglage pour mon thème de couleurs.
" -----------------------
let g:interstellaire_termcolors = 256

" -------------------------------------------------------------------------------------------------- "
"                           Fin des réglages des extensions de Vim                                   "
" (=^.^=)(=O.O=)(=O.o=)(=o.o=)(=-.-=)(=@.@=)(=~.~=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "

" Définition du colorsheme
colorscheme interstellaire
