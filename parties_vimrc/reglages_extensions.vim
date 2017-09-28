" Dernière modification : jeudi 28 septembre[09] 2017

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

" vim:foldlevel=0:foldmethod=marker
