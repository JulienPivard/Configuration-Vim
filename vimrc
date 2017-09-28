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

" Mappage des touches utiles
" Pour inverser une option booléenne utiliser set option!
" Pour afficher la valeur d'une option set option?
" FufBuffer permet de visualiser tout les buffers ouvert et d'y accéder
" FufBufferTagAll permet de chercher parmi tout les tags des fichiers ouvert

" Les réglages des touches fonctions                                        "{{{
noremap  <F2>           :call ColonneGaucheToggle()<Return>
noremap! <F2>     <Esc> :call ColonneGaucheToggle()<Return>
noremap  <F3>           :setlocal spell!  spell? <Return>
noremap! <F3>     <Esc> :setlocal spell!  spell? <Return>
noremap  <F4>           :GundoToggle<Return>
noremap! <F4>     <Esc> :GundoToggle<Return>
noremap  <F5>           :w<Return>
noremap! <F5>     <Esc> :w<Return>
noremap  <F6>           :NERDTreeToggle <Return>
noremap! <F6>     <Esc> :NERDTreeToggle <Return>
noremap  <S-F6>         :UndotreeToggle <Return>
noremap! <S-F6>   <Esc> :UndotreeToggle <Return>
noremap  <F7>           :TagbarToggle   <Return>
noremap! <F7>     <Esc> :TagbarToggle   <Return>
noremap  <S-F7>         :nohlsearch     <Return>
noremap! <S-F7>   <Esc> :nohlsearch     <Return>
noremap  <F8>           :FufBuffer      <Return>
noremap! <F8>     <Esc> :FufBuffer      <Return>
noremap  <F9>           :FufBufferTagAll<Return>
noremap! <F9>     <Esc> :FufBufferTagAll<Return>
noremap  <S-F11>        :call DerniereModification()<Return>
noremap! <S-F11>  <Esc> :call DerniereModification()<Return>
noremap  <S-F12>        :vsp ~/.vim/vimrc<Return>
noremap! <S-F12>  <Esc> :vsp ~/.vim/vimrc<Return>

"}}}

nnoremap gy :YcmGenerateConfig -f<Return>
nnoremap gh :call MontrerGroupeSyntax()<Return>
nnoremap gp :setlocal paste! paste?<Return>

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>alignTabulation()<Return>a

" Change le caractère pour déclencher le mapping en mode commande.
let mapleader = 'ù'
" Pour changer les caractères autour de la selection                        "{{{
vnoremap <leader>"  <esc>`<i"<esc>`>a"<esc>
vnoremap <leader>'  <esc>`<i'<esc>`>a'<esc>
vnoremap <leader>ac <esc>`<i{<esc>`>a}<esc>
vnoremap <leader>br <esc>`<i[<esc>`>a]<esc>
vnoremap <leader>(  <esc>`<i(<esc>`>a)<esc>

"}}}

nnoremap <leader>w :match Error /\v +$/<Return>
nnoremap <leader>; :execute "normal! mqA;\e`q"<Return>
nnoremap / /\v

" Pour fugitive                                                             "{{{
nnoremap <leader>gs :Gstatus<Return>
nnoremap <leader>gd :Gdiff  <Return>
nnoremap <leader>gv :Gitv   <Return>

"}}}

nnoremap <leader>bs :buffers<Return>
nnoremap <leader>bb :bnext  <Return>

" Pour sygnify                                                              "{{{
nnoremap <leader>sh :SignifyToggleHighlight<Return>
nnoremap <leader>sr :SignifyRefresh<Return>
" Ne pas mettre noremap sinon le mappage ne fonctionne pas.
nmap <leader>sj <plug>(signify-next-hunk)
nmap <leader>sk <plug>(signify-prev-hunk)

"}}}

nnoremap <leader>us :UpdateAndSpellCheck<Return>

nnoremap <leader>sy :SyntasticToggleMode<Return>

" Pour file switch                                                          "{{{
nnoremap <silent> <leader>fff :FSHere<Return>
nnoremap <silent> <leader>fh :FSLeft <Return>
nnoremap <silent> <leader>ffh :FSSplitLeft<Return>
nnoremap <silent> <leader>fl :FSRight<Return>
nnoremap <silent> <leader>ffl :FSSplitRight<Return>
nnoremap <silent> <leader>fk :FSAbove<Return>
nnoremap <silent> <leader>ffk :FSSplitAbove<Return>
nnoremap <silent> <leader>fj :FSBelow<Return>
nnoremap <silent> <leader>ffj :FSSplitBelow<Return>

"}}}

" Pour la gestion de quickfix                                               "{{{
nnoremap <leader>o :copen    <Return>
nnoremap <leader>c :cclose   <Return>
nnoremap <leader>n :cnext    <Return>
nnoremap <leader>p :cprevious<Return>

"}}}

" Pour les tab de airline                                                   "{{{
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

"}}}

" ----------------------------------------------------------------------------- "
" }}}                Fin des réglages des mappages de touches                   "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" {{{                Début des réglages des extensions de Vim                   "
" ----------------------------------------------------------------------------- "

scriptencoding utf-8

" -----------------------
" Réglages pour Gundo                                                       "{{{
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

"}}}

" -----------------------
" Réglages pour syntastic                                                   "{{{
" -----------------------
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0                 " N'effectue pas de vérification à la fermeture du fichier.
let g:syntastic_always_populate_loc_list = 1        " Remplie ll avec les erreurs trouvé.
let g:syntastic_auto_loc_list = 2               " ne pas ouvrir automatiquement ll mais fermer automatiquement.
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_jump = 2                   " Saute à la première erreur trouvée à la sauvegarde.
let g:syntastic_stl_format = '[%E{Err l: %fe #%e}%B{, }%W{Warn l: %fw #%w}]'
let g:syntastic_ignore_files = ['\.*.gpr']
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
" Un exemple de fichier : avec le -I au début
" -Isrc/include/
" -Isrc/include/modele/
" -Isrc/include/builders/
" -Isrc/include/builders/lorraine

"}}}

" -----------------------
" Réglage pour undotree                                                     "{{{
" -----------------------
let g:undotree_WindowLayout = 2
let g:undotree_SplitWidth = 45
let g:undotree_DiffpanelHeight = 10
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1

"}}}

" -----------------------
" Réglages pour NERDTree                                                    "{{{
" -----------------------
let NERDTreeCaseSensitiveSort = 0   " Le tri ne tient pas compte de la casse
let NERDTreeWinPos = 'left'         " Positionne la fenêtre à gauche
let NERDTreeCascadeSingleChildDir = 1
let NERDTreeCascadeOpenSingleChildDir = 1
let NERDTreeShowHidden = 0          " Pour afficher les fichiers caché.
let NERDTreeSortHiddenFirst = 1
let NERDTreeWinSize = 55
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen = 0          " Ferme automatiquement NERDTree quand on ouvre un fichier.

"}}}

" -----------------------
" Réglages pour tagbar                                                      "{{{
" -----------------------
" Installer exuberant-ctags
let g:tagbar_autoclose = 1          " Ferme automatiquement tagbar
let g:tagbar_autofocus = 1          " Place le curseur dans la fenêtre tagbar
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_autopreview = 0
let g:tagbar_autoshowtag = 0
let g:tagbar_width = 55
let g:tagbar_sort = 0
let g:tagbar_systemenc = 'utf-8'
if system( 'uname' ) =~? 'darwin'
    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
endif

"}}}

" -----------------------
" Réglages pour UltiSnips                                                   "{{{
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
let g:ultisnips_java_brace_style = 'nl'

"}}}

" -----------------------
" Réglage pour YouCompleteMe                                                "{{{
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
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1

"}}}

" -----------------------
" Réglages pour signify                                                     "{{{
" -----------------------
let g:signify_disable_by_default     = 0
let g:signify_cursorhold_insert      = 0
let g:signify_cursorhold_normal      = 0
let g:signify_update_on_bufenter     = 0
let g:signify_update_on_focusgained  = 0
let g:signify_line_highlight         = 0
let g:signify_sign_delete            = '↓'
let g:signify_sign_delete_first_line = '↑'
let g:signify_vcs_list               = [ 'git' ]

"}}}

" -----------------------
" Réglages pour SpellCheck                                                  "{{{
" -----------------------
let g:SpellCheck_DefineQuickfixMappings = 1

"}}}

" -----------------------
" Réglages pour gitv                                                        "{{{
" -----------------------
let g:Gitv_OpenHorizontal = 0
let g:Gitv_DoNotMapCtrlKey = 1

"}}}

" -----------------------
" Réglages pour FSwitch                                                     "{{{
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

" }}}

" -----------------------
" Réglage pour OmniCppComplete                                              "{{{
" -----------------------
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " Montre les paramètres des fonctions.
let OmniCpp_MayCompleteDot = 1      " auto complète après .
let OmniCpp_MayCompleteArrow = 1    " auto complète après ->
let OmniCpp_MayCompleteScope = 1    " auto complète après ::

"}}}

" -----------------------
" Réglage pour airline                                                      "{{{
" -----------------------
let g:airline#extensions#whitespace#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'forest'

let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = '····'
let g:airline#extensions#branch#displayed_head_limit = 20

"}}}

" -----------------------
" Réglages pour indent guides                                               "{{{
" -----------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_default_mapping = 1

"}}}

" -----------------------
" Réglage du plugin pour ada                                                "{{{
" -----------------------
let g:ada_standard_types = 1
let g:ada_with_gnat_project_files = 1
let g:ada_omni_with_keywords = 1
let g:ada_extended_completion = 1
let g:ada_gnat_extensions = 1
let g:ada_space_errors = 1
let g:ada_all_tab_usage = 1
let g:ada_default_compiler = 'gnat'

"}}}

" -----------------------
" Réglages pour vim-pencil                                                  "{{{
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

"}}}

" -----------------------
" Réglage pour les curseurs multiples                                       "{{{
" -----------------------
"let g:multi_cursor_start_key = '-'

"}}}

" -----------------------
" Réglage pour auto pairs pas de documentation                              "{{{
" -----------------------
"let b:AutoPairs = {'«': '»'}

"}}}

" -----------------------
" Réglage pour ctrlP                                                        "{{{
" -----------------------
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$',
\ 'file': '\v\.(exe|so|dll)$',
\ }
let g:ctrlp_extensions = [ 'autoignore' ]
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"}}}

" -----------------------
" Réglages pour arpeggio                                                    "{{{
" -----------------------
try
    call arpeggio#load()
    Arpeggio noremap  jk <Esc>
    Arpeggio noremap! jk <Esc>
catch
endtry

"}}}

" -----------------------
" Réglage pour mon thème de couleurs.                                       "{{{
" -----------------------
let g:interstellaire_termcolors = system( 'tput colors' )

"}}}

" ----------------------------------------------------------------------------- "
" }}}                 Fin des réglages des extensions de Vim                    "
" (=^.^=)(=O.o=)(=o.o=)(=-.-=)(=0.0=)(=~.~=)(=@.@=)(=o.o=)(=o.O=)(=O.O=)(=^.^=) "
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% "


" Définition du colorsheme
colorscheme interstellaire

" vim:foldlevel=0:foldmethod=marker
