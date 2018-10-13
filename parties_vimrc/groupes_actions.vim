" Dernière modification : Samedi 13 octobre[10] 2018

" Pour éviter les colonnes de limite de 80 et 150 caractères dans les quickfix
augroup fichierQuickfix                                                     "{{{
    autocmd!
    autocmd Filetype qf,vim-plug    setlocal colorcolumn=0
    autocmd Filetype qf,vim-plug    setlocal nospell
augroup END

"}}}

" Pour l'ada permet de voir si on dépasse la colonne des 80 caractères
augroup codeSourceAda                                                       "{{{
    autocmd!
    autocmd Filetype ada setlocal textwidth=79
    autocmd Filetype ada setlocal colorcolumn=80
    autocmd Filetype ada setlocal softtabstop=3
    autocmd Filetype ada setlocal tabstop=3
    autocmd Filetype ada setlocal shiftwidth=3
    autocmd Filetype ada setlocal errorformat=%-G%f:%s:,
                \%-G%f:%l:\ %#error:\ %#(Each\ undeclared\ identifier\ is\ reported\ only%.%#,
                \%-G%f:%l:\ %#error:\ %#for\ each\ function\ it\ appears%.%#,
                \%-GIn\ file\ included%.%#,
                \%-G\ %#from\ %f:%l\,,
                \%-Gmake:\ %#%s,
                \%-Gcompleted%s,
                \%-Ggnatcheck%s,
                \%-Ggprbuild%s,
                \%-GSetup,
                \%-GCompile,
                \%-GBind,
                \%-GLink,
                \%-G\ %s,
                \%f:%l:%c:\ instance\ at\ %m,
                \%f:%l:%c:\ %trror:\ %m,
                \%f:%l:%c:\ %tarning:\ %m,
                \%f:%l:%c:\ %theck:\ %m,
                \%f:%l:%c:\ %m,
                \%f:%l:\ %trror:\ %m,
                \%f:%l:\ %tarning:\ %m,
                \%f:%l:\ %m
augroup END

"}}}

" Pour que vim se souvienne de la position du curseur à la fermeture pour la prochaine ouverture
augroup recuperationEtatSessionsPrecedente                                  "{{{
    autocmd!
    autocmd BufReadPost * if line( "'\"" ) > 1 && line( "'\"" ) <= line( '$' ) | exe "normal! g'\"" | endif
augroup END

"}}}

" Pour supprimer les espaces en fin de ligne.
augroup nettoyage                                                           "{{{
    autocmd!
    autocmd BufWritePre *               call Nettoyage()
    autocmd BufWritePre,FileWritePre *  call DerniereModification()
augroup END

"}}}

" Active la vérification orthographique pour certains type de fichier seulement
augroup langue                                                              "{{{
    autocmd!
    autocmd FileType haskell,fuf,gundo,diff,vundle,cmake,gitconfig,ant,tags,bib,conf,vundlelog,git,gitv setlocal nospell
augroup END

"}}}

" Voir les espaces en fin de lignes
augroup configmake                                                          "{{{
    autocmd!
    autocmd Filetype make setlocal listchars=nbsp:¤,tab:>-,trail:¤
    autocmd FileType make setlocal list                 " Affiche les caractères non imprimable
    autocmd FileType make setlocal tabstop=8            " Taille des tabulations avec tab
    autocmd FileType make setlocal shiftwidth=8         " Taille des tabulations avec >> ou <<
    autocmd FileType make setlocal softtabstop=8        " Taille des tabulation en édition
    autocmd FileType make noremap  <buffer> <F10>         :!make<Return>
    autocmd FileType make noremap! <buffer> <F10>   <Esc> :!make<Return>
augroup END

"}}}

" Avoir squelette de base à la création d'un fichier
augroup squelette                                                           "{{{
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
    autocmd BufNewFile *.roff               0r ~/.vim/CodeBasique/codeBasique.1
    autocmd BufNewFile *.pl                 0r ~/.vim/CodeBasique/codeBasique.pl
    autocmd BufNewFile client.cpp           0r ~/.vim/CodeBasique/client.cpp
    autocmd BufNewFile *.cpp                call ConfigurationNouveauFichierCPP()
    autocmd BufNewFile *.hpp                call ConfigurationNouveauFichierHPP()
    autocmd BufNewFile build.xml            0r ~/.vim/CodeBasique/build.xml
    autocmd BufNewFile build.gpr            0r ~/.vim/CodeBasique/build.gpr
    autocmd BufNewFile Dockerfile           0r ~/.vim/CodeBasique/Dockerfile
    autocmd BufNewFile bibliographie.bib    0r ~/.vim/CodeBasique/bibliographie.bib
    autocmd BufNewFile makefile             0r ~/.vim/CodeBasique/makefileBasique
    autocmd BufNewFile CMakeLists.txt       0r ~/.vim/CodeBasique/CMakeLists.txt
    autocmd BufNewFile Doxyfile             0r ~/.vim/CodeBasique/Doxyfile.base
augroup END

"}}}

" Pour configurer automatiquement le make de vim selon le type de fichier
augroup reglageMake                                                         "{{{
    autocmd!
    autocmd FileType haskell    setlocal makeprg=ghci\ %
    autocmd FileType ocaml      setlocal makeprg=ocaml\ -init\ %
    autocmd FileType java       setlocal makeprg=javac\ -g\ %
    autocmd FileType sql        setlocal makeprg=mysql\ --password\ <\ %
    autocmd Filetype php        setlocal makeprg=php\ -l\ %
augroup END

"}}}

" Mappage de la touche de compilation
" Les scripts n'utilisent pas ce raccourci de compilation
" pour des raisons de vitesse de retour à l'édition
augroup compilation                                                         "{{{
    autocmd!
    autocmd FileType tex,haskell,ocaml,sql,php,c,cpp,ada    noremap  <buffer> <S-F5>       :call CompilationMacro()<Return>
    autocmd FileType tex,haskell,ocaml,sql,php,c,cpp,ada    noremap! <buffer> <S-F5>  <Esc>:call CompilationMacro()<Return>
    autocmd Filetype perl,sh,python,zsh                     noremap  <buffer> <F10>        :!./"%"<Space>
    autocmd Filetype perl,sh,python,zsh                     noremap! <buffer> <F10>   <Esc>:!./"%"<Space>
augroup END

"}}}

" Définition de la coloration syntaxique pour les fichier antlr
augroup ficherAntlr                                                         "{{{
    autocmd!
    autocmd BufRead *.g4        setlocal filetype=antlr
augroup END

"}}}

" Rend le fichier courant exécutable à l'enregistrement si c'est pertinent
augroup rendreExecuable                                                     "{{{
    autocmd!
    autocmd BufWritePost *      call ModeChange()
augroup END

"}}}

" Désactive l'historique d'annulation persistant pour les fichiers temporaires
augroup gestionUndofie                                                      "{{{
    autocmd!
    autocmd BufWritePre /tmp/* setlocal noundofile
    autocmd BufWritePre /private/tmp/* setlocal noundofile
    autocmd BufWritePre /private/var/folders/* setlocal noundofile
    autocmd BufWritePre /private/var/tmp/* setlocal noundofile
augroup END

"}}}

" Création d'une page de manuel avec ajout du nom automatiquement
augroup manuel                                                              "{{{
    autocmd!
    autocmd BufNewFile *.roff   :%substitute?NOMCOMMANDE?\=expand( '%:t:r' )?
    autocmd BufNewFile *.roff   :exe '%substitute/DATE/' . strftime( '%d %B %Y' ) . '/e'
augroup END

"}}}

augroup commandesLocale                                                     "{{{
    autocmd!
    " Redéfinition de la commande d'aide utilisée avec K
    autocmd FileType tex                setlocal keywordprg=texdoc
    " Pour éviter les ralentissement dans les fichiers latex et plugin gundo
    autocmd FileType tex                setlocal nocursorline nocursorcolumn
    " Active les replis en se basant sur l'indentation
    autocmd FileType python,sh,perl     setlocal foldmethod=indent
    autocmd FileType gitcommit          setlocal cursorline nocursorcolumn
augroup END

"}}}

" Recharge le vimrc quand utilise F5
augroup vimSource                                                           "{{{
    autocmd!
    autocmd FileType vim    noremap  <buffer> <S-F5>       :source %<Return>
    autocmd FileType vim    noremap! <buffer> <S-F5>  <Esc>:source %<Return>
    autocmd Filetype vim    setlocal foldmethod=marker
augroup END

"}}}

" Désactive la correction orthographique en mode diff                       "{{{

augroup diffMode
    autocmd!
    autocmd BufEnter,BufNew * if &diff | set nospell | endif
augroup END

"}}}

" Mappage selon la présence de makefile
augroup fonctionsConfiguration                                              "{{{
    autocmd!
    autocmd FileType java,ant,jsp           call ExistConfigurationJava()
    autocmd FileType tex                    call MacrosLatexSpecifique()
    autocmd FileType nroff,groff            call AffichageGroff()
    autocmd Filetype antlr                  call ConfigAntlr()
    autocmd FileType cpp                    call MacrosCPP()
    autocmd FileType c,h                    call ExistMakeFileC()
    autocmd Filetype ada                    call ExistBuildAda()
augroup END

"}}}

augroup pencil                                                              "{{{
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
"    autocmd FileType text         call pencil#init()
augroup END

"}}}

" vim:foldlevel=0:foldmethod=marker
