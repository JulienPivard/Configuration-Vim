set nocompatible                        " Casser compatible avec vielle version

" Dernière modification : jeudi 28 septembre[09] 2017
" Voir : http://learnvimscriptthehardway.stevelosh.com/
" Pour apprendre à écrire des scripts vim.

" Définie les conditions de compilation de YCM                              "{{{
" info est un dictionnaire avec 3 champs.
" - name:   Le nom du plugin
" - status: 'installed', 'updated', ou 'unchanged'
" - force:  Mis à vrais si PlugInstall! ou PlugUpdate!
function! BuildYCM( info )
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
  endif
endfunction

" }}}

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" {{{                      Début des réglages de Vim-Plug                       "
" ----------------------------------------------------------------------------- "

source ~/.vim/parties_vimrc/plugins_vim_plug.vim

" Pense bête
" :PlugList       - Liste les extensions configuré
" :PlugInstall    - Installer
" :PlugUpdate     - Mettre à jours
" :PlugSearch foo - Cherche foo
" :PlugClean      - Supprime les extensions inutilisée

" ----------------------------------------------------------------------------- "
" }}}                       Fin des réglages de Vim-Plug                        "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "

" {{{                       Les options générales de vim                        "

syntax on

" Option globales de vim                                                    "{{{
set noautochdir                         " Pour ne pas se changer automatiquement de répertoire
set   autoindent                        " Adapte l'indentation automatiquement
set   autoread                          " Permet de relire les fichiers modifié à l'extérieur
set   autowrite                         " Sauvegarde automatiquement le document
set noautowriteall                      " Sauvegarde automatiquement le document dans plus de cas
set   background=dark                   " Fixe la valeur du fond en sombre pour les thèmes
set   backspace=indent,eol,start        " Fixe le comportement de la touche backspace
set   backup                            " Conserve une copie de tous les fichiers édités
set   backupdir=$HOME/.vim/backup       " Définit le dossier de backup, sauvegarde le fichier avant de le modifier
if exists( '+breakindent' )
    set   breakindent                       " La ligne ne commence plus collée à gauche
    set   breakindentopt=min:55,shift:0     " Pour afficher les caractères de showbreak collé à gauche ajoutez sbr
endif
set   colorcolumn=80,150                " Affiche une colonne avec une couleur de fond
set   completeopt=menuone,longest       " Options pour le menu de l'omnicompletion
set   concealcursor=c                   " Quand le curseur est sur un caractère conceal il reste en conceal
set   conceallevel=2                    " Change les combinaison de caractère en leur équivalent utf-8
set noconfirm                           " Affiche une ligne de dialogue pour choisir une action
set   copyindent                        " Adapte l'indentation des lignes collées
set   cryptmethod=blowfish              " Change l'algorithme de cryptage
set nocursorcolumn                      " Surligne la colonne ou se situe le curseur
set nocursorline                        " Surligne la ligne ou se situe le curseur
set   diffopt+=vertical                 " Permet d'ouvrir les fichiers de diff à la vertical
set nodigraph                           " seul i_ctl-k suivit de deux lettres permet d'écrire des caractères spéciaux
set   display=lastline,uhex             " Les lignes trop longues ne sont plus remplacées par @
set   encoding=utf-8                    " Encodage des fichiers en utf-8
set noexrc                              " Bloque la lecture de vimrc locaux
set   expandtab                         " Change les tabulations en espaces
set noerrorbells                        " Pas de beep lors des erreurs
set   foldclose=all                     " Ferme le replis si le curseur en sort et level>foldlevel
set   foldcolumn=1                      " Taille de la colonne qui indique les marques
set   foldenable                        " Activer les replis
set   foldlevel=1                       " Ferme tous les replis de niveau supérieur
set   foldmethod=syntax                 " Génère des replis automatiquement selon le type de fichier
set   foldmarker={{{,}}}                " Si on utilise des marqueurs utilisent ce codage
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
set   scrolloff=7                       " Affiche au minimum les 7 lignes autour du curseur
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

" }}}

" Thésaurus de synonyme français
set thesaurus+=~/.vim/spell/Thesaurus/thesaurus_fr_FR.txt

" Pour activer cscope dans vim pour les sources qui peuvent en tirer parti. "{{{
if has( 'cscope' )
    set   cscopeprg=/usr/bin/cscope
    set   cscopetagorder=0
    set   cscopetag
    set nocscopeverbose
    " Ajoute la base de donnée cscope qui se trouve dans le dossier courant.
    if filereadable( 'cscope.out' )
        cscope add cscope.out
    " sinon pointe la base définie par une variable d'environnement.
    elseif $CSCOPE_DB != ""
        cscope add $CSCOPE_DB
    endif
    set   cscopeverbose
endif

"}}}

" Pour gvim
set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10

" }}}

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" {{{                Début des réglages de la ligne de statut                   "
" ----------------------------------------------------------------------------- "

source ~/.vim/parties_vimrc/configuration_ligne_status.vim

" ----------------------------------------------------------------------------- "
" }}}                 Fin des réglages de la ligne de statut                    "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" {{{                          Début des fonctions                              "
" ----------------------------------------------------------------------------- "

source ~/.vim/parties_vimrc/fonctions.vim

" ----------------------------------------------------------------------------- "
" }}}                           Fin des fonctions                               "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" {{{                Début des réglages des groupes d'actions                   "
" ----------------------------------------------------------------------------- "

source ~/.vim/parties_vimrc/groupes_actions.vim

" ----------------------------------------------------------------------------- "
" }}}                Fin des réglages des groupes d'actions                     "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" {{{               Début des réglages des mappages de touches                  "
" ----------------------------------------------------------------------------- "

source ~/.vim/parties_vimrc/mappage_touches.vim

" ----------------------------------------------------------------------------- "
" }}}                Fin des réglages des mappages de touches                   "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" {{{                Début des réglages des extensions de Vim                   "
" ----------------------------------------------------------------------------- "

source ~/.vim/parties_vimrc/reglages_extensions.vim

" ----------------------------------------------------------------------------- "
" }}}                 Fin des réglages des extensions de Vim                    "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "


" Définition du colorsheme
colorscheme interstellaire

" vim:foldlevel=0:foldmethod=marker
