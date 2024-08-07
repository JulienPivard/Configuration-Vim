" Dernière modification : Mercredi 07 août[08] 2024

" Définie l'affichage de la ligne de repli.
function! MonFoldText()                                                     "{{{

    let nblignes     = v:foldend - v:foldstart + 1
    let niveau       = printf( '+%-5s', v:folddashes )
    let premiere     = printf( '%5s', v:foldstart )
    let derniere     = printf( '%-5s', v:foldend )
    let nblignes     = printf( '%5s', nblignes )
    let nblignes     = printf( '%-20s', nblignes . ' lignes : ' )

    let partiegauche = niveau . ' │ ' . premiere . '-' . derniere . ' │ ' . nblignes

    let subfold      = substitute( getline( v:foldstart ), '\v^\s*|\{\{\{=', '', 'g' )

    let partiedroite = subfold

    return  partiegauche . ' ' . partiedroite

endfunction

"}}}

" Permet de changer les droits d'un fichier pour le rendre exécutable
function! ModeChange()                                                      "{{{
    if bufname ("%") =~# "fugitive://.*"
        return
    endif

    if getline( 1 ) =~ '^#!.*/bin/'
        silent !chmod u+x "<afile>"
    endif
endfunction

"}}}

" Pour connaitre le groupe de coloration de la zone sous le curseur.
function! MontrerGroupeSyntax()                                             "{{{
    if !exists( '*synstack' )
        return
    endif
    echo map( synstack( line( '.' ), col( '.' ) ), 'synIDattr( v:val, "name" )' )
endfunction

"}}}

" Suppression automatique des espaces superflus
" \s correspond à un espace ou une tab \+ 1 ou plus $ fin de ligne
" /e pour ne pas générer d'erreur si on ne trouve pas de correspondance
function! Nettoyage()                                                       "{{{
    if bufname ("%") =~# "fugitive://.*"
        return
    endif

    " Permet de récupérer la ligne et la colonne ou se trouve le curseur.
    let curcol = col( '.' )
    let curline = line( '.' )
    " Effectue la suppression des espaces en trop en fin de ligne.
    silent execute "normal! " . ':keeppatterns %s/\v\s+$//e' . "\<Return>" . ":nohlsearch\<Return>"
    " On efface les lignes blanches inutiles en fin de fichier.
    if prevnonblank( line( '$' ) ) < line( '$' )
        silent execute "normal! :keeppatterns " . '%s/\v\n+%$//e' . "\<Return>" . ":nohlsearch\<Return>"
    endif
    " On remet le curseur la ou il était avant la suppression.
    call cursor( curline, curcol )
    " On retire les variables.
    unlet curcol
    unlet curline

endfunction

"}}}

" Pour pouvoir ajouter ou modifier la date courante au début du fichier
function! DerniereModification()                                            "{{{

    " Si le fichier est un buffer du plugin fugitive
    if bufname ("%") =~# "fugitive://.*"
        return
    endif

    " Permet de récupérer la ligne et la colonne ou se trouve le curseur.
    let l:curcol = col( '.' )
    let l:curline = line( '.' )
    let l:dateactuel = strftime( '%A %d %B[%m] %Y' )

    " On ne prend que les 20 premières lignes.
    if line( '$' ) > 20
        let l:l = 20
    else
        let l:l = line( '$' )
    endif

    " On cherche si la date de dernière modification existe déjà
    call cursor( 1, 1 )
    " Penser à échapper les caractères spéciaux présent dans la chaine
    " recherché
    let l:lignemodif = search( escape( l:dateactuel, '[]' ), 'nw', l:l )

    let en_tete_fr = 'Dernière modification : '
    let en_tete_en = 'Last Change:  '
    let l:modif_fr = l:en_tete_fr . l:dateactuel
    let l:modif_en = l:en_tete_en . l:dateactuel

    " Met à jours la date dans les 20 premières ligne du fichier si il est
    " présent. Et si ce n'est pas la date du jour.
    if !l:lignemodif
        exe '1,' . l:l . 'substitute/' . l:en_tete_fr . '.*/' . l:modif_fr . '/e'
        exe '1,' . l:l . 'substitute/' . l:en_tete_en . '.*/' . l:modif_en . '/e'
    endif
    " On remet le curseur la ou il était avant la suppression.
    call cursor( l:curline, l:curcol )

endfunction

"}}}

" Execution du make
function! CompilationMacro()                                                "{{{
    if bufname ("%") =~# "fugitive://.*"
        return
    endif

    silent !clear
    make
endfunction

"}}}

" Si il y a un makefile on exécute le fichier compilé du même nom que
"   celui du dossier sans la première majuscule
" sinon c'est le nom du fichier sans majuscule
function! ExistMakeFileC()                                                  "{{{

    let g:load_doxygen_syntax = 1
    setlocal syntax=c.doxygen

    if bufname ("%") =~# "fugitive://.*"
        return
    endif

    if filereadable( 'makefile' ) || filereadable( 'Makefile' )

        setlocal makeprg=make
        noremap  <buffer> <S-F9>        :make clean<Return>
        noremap! <buffer> <S-F9>  <Esc> :make clean<Return>
        if filereadable( 'client' )
            noremap  <buffer> <F10>         :!./client<Space>
            noremap! <buffer> <F10>   <Esc> :!./client<Space>
        elseif filereadable( 'bin/Release/client' )
            noremap  <buffer> <F10>         :!./bin/Release/client<Space>
            noremap! <buffer> <F10>   <Esc> :!./bin/Release/client<Space>
        endif

    else

        setlocal makeprg=gcc\ -Wall\ -o\ %<\ %<.c
        noremap  <buffer> <F10>         :!./%<<Space>
        noremap! <buffer> <F10>   <Esc> :!./%<<Space>

    endif

endfunction

"}}}

" Configuration des raccourcis pour compiler en ada.
function! ExistBuildAda()                                                   "{{{

    if bufname ("%") =~# "fugitive://.*"
        return
    endif

    if filereadable( glob( './[Mm]akefile' ) )

        setlocal makeprg=make
        noremap  <buffer> <F10>         :!make run<Return>
        noremap! <buffer> <F10>   <Esc> :!make run<Return>
        noremap  <buffer> <S-F9>        :!make clean<Return>
        noremap! <buffer> <S-F9>  <Esc> :!make clean<Return>

    elseif filereadable( './build.gpr' )

        setlocal makeprg=gprbuild\ -d\ -Xmode=deb
        call g:gnat.Set_Project_File( './build.gpr' )
        noremap  <buffer> <F10>         :!./bin/debug/client<Space>
        noremap! <buffer> <F10>   <Esc> :!./bin/debug/client<Space>
        noremap  <buffer> <S-F9>        :!gprclean<Return>
        noremap! <buffer> <S-F9>  <Esc> :!gprclean<Return>

    else

        setlocal makeprg=gnatmake\ %
        noremap  <buffer> <F10>         :!./%<<Space>
        noremap! <buffer> <F10>   <Esc> :!./%<<Space>

    endif

    noremap  <silent> <buffer> <S-F8>        :call CreationTags( 'ada' )<Return>
    noremap! <silent> <buffer> <S-F8>  <Esc> :call CreationTags( 'ada' )<Return>

endfunction

"}}}

" Configuration des nouveaux fichiers cpp
function! ConfigurationNouveauFichierCPP()                                  "{{{

    if expand( '%:t' ) != 'client.cpp'
        0r ~/.vim/CodeBasique/codeBasique.cpp
        :%substitute?NOMFICHIER?\=expand( '%:t:r' )?g
    endif

endfunction

"}}}

" Configure les nouveaux fichiers cpp
function! ConfigurationNouveauFichierHPP()                                  "{{{

    0r ~/.vim/CodeBasique/codeBasique.hpp
    :%substitute?MANOUVELLECLASSE?\=expand( '%:t:r' )?g
    :%substitute@VARIABLE_A_CHANGER@\=expand( '%:t:r' ) . '_hpp'@

endfunction

"}}}

" Configuration de la création des tags.
" ctags -R --c++-kinds=+pl --fields=+iaS --extra=+fq --languages=c++ --input-encoding=utf-8 --output-encoding=utf-8 ./src/
function! CreationTags( type )                                              "{{{

    let l:encodage = '--input-encoding=utf-8 --output-encoding=utf-8 '
    let l:source = './src/'

    if a:type ==? 'cpp'
        let l:lang = 'c++'
        let l:options = '-R --c++-kinds=+pl --fields=+iaS --extra=+fq '
    endif

    if a:type ==? 'ada'
        let l:lang = 'ada'
        let l:options = '-R '
    endif

    let l:langage = '--languages=' . l:lang . ' '

    let l:r = system( 'ctags ' . l:options . l:langage . l:encodage . l:source )
    if l:r == ''
        echom "Création des tags réussi."
    else
        echom "Erreur lors de la création des tags."
        echom l:r
    endif

endfunction

"}}}

" Maccros pour le cpp
" Compilation via makeprg
" Exécution via F10 du binaire
" Création des tags et compilation de la documentation.
" Pour trouver la classe correspondante taper :tag nomclasse.cpp
function! MacrosCPP()                                                       "{{{

    let g:load_doxygen_syntax = 1
    setlocal syntax=cpp.doxygen

    if bufname ("%") =~# "fugitive://.*"
        return
    endif

    if filereadable( 'makefile' ) || filereadable( 'Makefile' )

        noremap  <buffer> <F10>         :!./bin/client<Space>
        noremap! <buffer> <F10>   <Esc> :!./bin/client<Space>
        noremap  <buffer> <S-F9>        :make clean<Return>
        noremap! <buffer> <S-F9>  <Esc> :make clean<Return>

    else

        let $nomFichier = substitute( split( getcwd(), '/' )[-1], "\\<\\u", "\\l\\0", "" )
        setlocal makeprg=g++\ -Wall\ -Wextra\ -std=c++11\ -o\ %<\ %
        noremap  <buffer> <F10>         :!./$nomFichier<Space>
        noremap! <buffer> <F10>   <Esc> :!./$nomFichier<Space>

    endif

    noremap  <silent> <buffer> <S-F8>        :call CreationTags( 'cpp' )<Return>
    noremap! <silent> <buffer> <S-F8>  <Esc> :call CreationTags( 'cpp' )<Return>
    noremap  <buffer> <S-F11>       :!doxygen<Return>
    noremap! <buffer> <S-F11> <Esc> :!doxygen<Return>
    " Ajoute de tags pour l'omnicompletion
    " git clone https://github.com/universal-ctags/ctags.git
    " Compiler ctags avec utf-8 support
    " ./configure --enable-iconv
    " ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q
    " --input-encoding=utf-8 --output-encoding=utf-8 --language-force=C++ -f cpp cpp_src
    setlocal tags+=~/.vim/tags/cpp

endfunction

"}}}

"Configuration des nouveaux fichiers en java
function! ConfigurationNouveauFichierJAVA()                                 "{{{

    0r ~/.vim/CodeBasique/codeBasique.java
    :%substitute?NOMFICHIER?\=expand( '%:t:r' )?
    :4substitute?package truc?\= 'package ' . expand( '%:p:.:h' )?e
    :4substitute?/?\.?ge
    " Permet d'utiliser gf sur les fichiers java.
    "set includeexpr=substitute( v:fname,'\\.','/','g' )

endfunction

"}}}

" Fonction pour exécuter les fichiers java compilé selon l'existence ou non d'un makefile
" La première lettre du nom de dossier java est en minuscule pour exécuter le
" fichier java on convertit la première lettre du dossier en majuscule
function! ExistConfigurationJava()                                          "{{{

    if bufname ("%") =~# "fugitive://.*"
        return
    endif

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
        noremap  <buffer> <F10>         :!java %<<Space>
        noremap! <buffer> <F10>   <Esc> :!java %<<Space>
        noremap  <buffer> <S-F11>       :!javadoc -encoding utf8 -docencoding utf8 -charset utf8 % && firefox %<.html &<Return>
        noremap! <buffer> <S-F11> <Esc> :!javadoc -encoding utf8 -docencoding utf8 -charset utf8 % && firefox %<.html &<Return>

    endif

    noremap  <buffer> <S-F5>        :make<Return>
    noremap! <buffer> <S-F5>  <Esc> :make<Return>

endfunction

"}}}

" Fonction pour définir le logiciel à ouvrir selon le système
" d'exploitation utilisé
" Définition de variable global pour ouvrir un pdf                          "{{{
function! NomLecteurPDF()
    let l:systeme_en_cours_dutilisation = system( 'uname' )
    if l:systeme_en_cours_dutilisation =~? 'darwin'
        let l:logiciel_pour_voir_pdf = 'open -n'
    else
        let l:logiciel_pour_voir_pdf = 'evince'
    endif
    return l:logiciel_pour_voir_pdf
endfunction

" }}}


" Fonction pour définir les macros Latex ouvrir facilement
" le fichier pdf généré par xetex
function! MacrosLatexSpecifique()                                           "{{{

    NoMatchParen

    if bufname ("%") =~# "fugitive://.*"
        return
    endif

    if filereadable( 'makefile' ) || filereadable( 'Makefile' )

        setlocal makeprg=make
        noremap  <buffer> <S-F8>        :!make index<Return>
        noremap! <buffer> <S-F8>  <Esc> :!make index<Return>
        noremap  <buffer> <S-F9>        :!make clean<Return>
        noremap! <buffer> <S-F9>  <Esc> :!make clean<Return>
        noremap  <buffer> <F10>         :!make run<Return>
        noremap! <buffer> <F10>   <Esc> :!make run<Return>

    else

        setlocal makeprg=xelatex\ %
        noremap  <buffer> <S-F8>        :!makeindex %<.idx<Return>
        noremap! <buffer> <S-F8>  <Esc> :!makeindex %<.idx<Return>
        noremap  <buffer> <S-F9>        :!rm -f %<.out %<.log %<.aux %<.toc %<.dvi %<.lof %<.lot %<.bbl %<.blg %<.idx %<.ilg %<.ind<Return>
        noremap! <buffer> <S-F9>  <Esc> :!rm -f %<.out %<.log %<.aux %<.toc %<.dvi %<.lof %<.lot %<.bbl %<.blg %<.idx %<.ilg %<.ind<Return>
        noremap  <buffer> <F10>         :call system( NomLecteurPDF() . " " . expand( '%<' ) . '.pdf &' )<Return>
        noremap! <buffer> <F10>   <Esc> :call system( NomLecteurPDF() . " " . expand( '%<' ) . '.pdf &' )<Return>

    endif

    if filereadable( 'bibliographie.bib' )
        noremap  <buffer> <S-F11>       :!bibtex %< <Return>
        noremap! <buffer> <S-F11> <Esc> :!bibtex %< <Return>
    endif

endfunction

"}}}

" On désactive la correction orthographique pour les fichiers de diff
function! FichierEnModeDiff()                                               "{{{
    if bufname ("%") =~# "fugitive://.*"
        setlocal nospell
    endif
endfunction

"}}}

" Macros pour l'affichage formaté des fichiers groff
" La touche F5 affiche un aperçus dans le terminal pour les me
" La touche F10 affiche un aperçus dans le terminal pour les man
" La touche F12 ouvre le lecteur pdf
" Avec shift compile en pdf au lieu d'afficher sur le terminal
function! AffichageGroff()                                                  "{{{

    if bufname ("%") =~# "fugitive://.*"
        return
    endif

    " Compilation pour avoir un aperçus dans un terminal
    noremap  <buffer> <F5>       :!groff -Kutf8 -me  -Tutf8 % <Return>
    noremap! <buffer> <F5>  <Esc>:!groff -Kutf8 -me  -Tutf8 % <Return>
    " Compilation pour faire un pdf
    noremap  <buffer> <S-F5>       :!groff -Kutf8 -me  -Tpdf  % &> %<.pdf <Return>
    noremap! <buffer> <S-F5>  <Esc>:!groff -Kutf8 -me  -Tpdf  % &> %<.pdf <Return>
    " Compilation pour afficher avec l'utilitaire man
    noremap  <buffer> <F10>        :!groff -Kutf8 -man -Tutf8 % <Return>
    noremap! <buffer> <F10>   <Esc>:!groff -Kutf8 -man -Tutf8 % <Return>
    " Compilation du man en pdf
    noremap  <buffer> <S-F10>      :!groff -Kutf8 -man -Tpdf  % &> %.pdf <Return>
    noremap! <buffer> <S-F10> <Esc>:!groff -Kutf8 -man -Tpdf  % &> %.pdf <Return>
    " Affichage du pdf compilé au format me
    noremap  <buffer> <F12>        :call system( NomLecteurPDF() . " " . expand( '%<' ) . '.pdf &' )<Return>
    noremap! <buffer> <F12>   <Esc>:call system( NomLecteurPDF() . " " . expand( '%<' ) . '.pdf &' )<Return>
    " Affichage du pdf compilé au format man
    noremap  <buffer> <S-F12>      :call system( NomLecteurPDF() . " " . expand( '%'  ) . '.pdf &' )<Return>
    noremap! <buffer> <S-F12> <Esc>:call system( NomLecteurPDF() . " " . expand( '%'  ) . '.pdf &' )<Return>

endfunction

"}}}

" Raccourcis pour les fichiers antlr compile et lance les tests
function! ConfigAntlr()                                                     "{{{

    if bufname ("%") =~# "fugitive://.*"
        return
    endif

    noremap  <buffer> <S-F5>       :!./runAntlr.sh %< <Return>
    noremap! <buffer> <S-F5> <Esc> :!./runAntlr.sh %< <Return>
    noremap  <buffer> <F10>        :!./runAntlr.sh %< test.code <Return>
    noremap! <buffer> <F10>  <Esc> :!./runAntlr.sh %< test.code <Return>

endfunction

"}}}

" Fonction pour désactiver les colonnes à gauche
function! ColonneGaucheToggle()                                             "{{{
    if &signcolumn ==# "auto" && &foldcolumn && &number
        setlocal signcolumn=no   foldcolumn=0 nonumber
    else
        setlocal signcolumn=auto foldcolumn=1   number
    endif
endfunction

"}}}

" Fonction pour trouver le fichier correspondant en Ada
function! Nom_Package_Vers_Nom_Fichier ()                                   "{{{
    let l:fichier=v:fname

    " On met le fichier en minuscule
    let l:fichier=substitute (l:fichier, '.*', '\L\0', 'g')

    const chemin_compilateur = ''
    const pos_dossier = ''

    const chemin_lib_std = chemin_compilateur . pos_dossier

    let l:dict_lib_std_ada = {
                \'ada.assertions'                                                : 'a-assert',
                \'ada.asynchronous_task_control'                                 : 'a-astaco',
                \'ada.containers.red_black_trees.generic_bounded_set_operations' : 'a-btgbso',
                \'ada.calendar.arithmetic'                                       : 'a-calari',
                \'ada.calendar.conversions'                                      : 'a-calcon',
                \'ada.calendar.delays'                                           : 'a-caldel',
                \'ada.calendar'                                                  : 'a-calend',
                \'ada.calendar.formatting'                                       : 'a-calfor',
                \'ada.calendar.time_zones'                                       : 'a-catizo',
                \'ada.containers.bounded_doubly_linked_lists'                    : 'a-cbdlli',
                \'ada.containers.bounded_hashed_maps'                            : 'a-cbhama',
                \'ada.containers.bounded_hashed_sets'                            : 'a-cbhase',
                \'ada.containers.bounded_multiway_trees'                         : 'a-cbmutr',
                \'ada.containers.bounded_ordered_maps'                           : 'a-cborma',
                \'ada.containers.bounded_ordered_sets'                           : 'a-cborse',
                \'ada.containers.bounded_priority_queues'                        : 'a-cbprqu',
                \'ada.containers.bounded_synchronized_queues'                    : 'a-cbsyqu',
                \'ada.containers.doubly_linked_lists'                            : 'a-cdlili',
                \'ada.containers.formal_doubly_linked_lists'                     : 'a-cfdlli',
                \'ada.containers.formal_hashed_maps'                             : 'a-cfhama',
                \'ada.containers.formal_hashed_sets'                             : 'a-cfhase',
                \'ada.containers.formal_indefinite_vectors'                      : 'a-cfinve',
                \'ada.containers.formal_ordered_maps'                            : 'a-cforma',
                \'ada.containers.formal_ordered_sets'                            : 'a-cforse',
                \'ada.characters.conversions'                                    : 'a-chacon',
                \'ada.characters.handling'                                       : 'a-chahan',
                \'ada.characters'                                                : 'a-charac',
                \'ada.characters.latin_1'                                        : 'a-chlat1',
                \'ada.characters.latin_9'                                        : 'a-chlat9',
                \'ada.containers.hash_tables.generic_bounded_keys'               : 'a-chtgbk',
                \'ada.containers.hash_tables.generic_bounded_operations'         : 'a-chtgbo',
                \'ada.containers.hash_tables.generic_keys'                       : 'a-chtgke',
                \'ada.containers.hash_tables.generic_operations'                 : 'a-chtgop',
                \'ada.characters.wide_wide_latin_1'                              : 'a-chzla1',
                \'ada.characters.wide_wide_latin_9'                              : 'a-chzla9',
                \'ada.containers.indefinite_doubly_linked_lists'                 : 'a-cidlli',
                \'ada.containers.indefinite_hashed_maps'                         : 'a-cihama',
                \'ada.containers.indefinite_hashed_sets'                         : 'a-cihase',
                \'ada.containers.indefinite_multiway_trees'                      : 'a-cimutr',
                \'ada.containers.indefinite_ordered_maps'                        : 'a-ciorma',
                \'ada.containers.indefinite_ordered_multisets'                   : 'a-ciormu',
                \'ada.containers.indefinite_ordered_sets'                        : 'a-ciorse',
                \'ada.command_line.response_file'                                : 'a-clrefi',
                \'ada.containers.bounded_holders'                                : 'a-coboho',
                \'ada.containers.bounded_vectors'                                : 'a-cobove',
                \'ada.containers.formal_vectors'                                 : 'a-cofove',
                \'ada.containers.functional_base'                                : 'a-cofuba',
                \'ada.containers.functional_maps'                                : 'a-cofuma',
                \'ada.containers.functional_sets'                                : 'a-cofuse',
                \'ada.containers.functional_vectors'                             : 'a-cofuve',
                \'ada.containers.hashed_maps'                                    : 'a-cohama',
                \'ada.containers.hashed_sets'                                    : 'a-cohase',
                \'ada.containers.hash_tables'                                    : 'a-cohata',
                \'ada.containers.indefinite_holders'                             : 'a-coinho',
                \'ada.containers.indefinite_vectors'                             : 'a-coinve',
                \'ada.command_line.environment'                                  : 'a-colien',
                \'ada.command_line.remove'                                       : 'a-colire',
                \'ada.command_line'                                              : 'a-comlin',
                \'ada.containers.multiway_trees'                                 : 'a-comutr',
                \'ada.containers.helpers'                                        : 'a-conhel',
                \'ada.containers'                                                : 'a-contai',
                \'ada.containers.vectors'                                        : 'a-convec',
                \'ada.containers.ordered_maps'                                   : 'a-coorma',
                \'ada.containers.ordered_multisets'                              : 'a-coormu',
                \'ada.containers.ordered_sets'                                   : 'a-coorse',
                \'ada.containers.prime_numbers'                                  : 'a-coprnu',
                \'ada.complex_text_io'                                           : 'a-coteio',
                \'ada.containers.red_black_trees'                                : 'a-crbltr',
                \'ada.containers.red_black_trees.generic_keys'                   : 'a-crbtgk',
                \'ada.containers.red_black_trees.generic_operations'             : 'a-crbtgo',
                \'ada.containers.restricted_doubly_linked_lists'                 : 'a-crdlli',
                \'ada.containers.synchronized_queue_interfaces'                  : 'a-csquin',
                \'ada.containers.unbounded_priority_queues'                      : 'a-cuprqu',
                \'ada.containers.unbounded_synchronized_queues'                  : 'a-cusyqu',
                \'ada.characters.wide_latin_1'                                   : 'a-cwila1',
                \'ada.characters.wide_latin_9'                                   : 'a-cwila9',
                \'ada.decimal'                                                   : 'a-decima',
                \'ada.directories.hierarchical_file_names'                       : 'a-dhfina',
                \'ada.dispatching.non_preemptive'                                : 'a-dinopr',
                \'ada.direct_io.c_streams'                                       : 'a-diocst',
                \'ada.directories'                                               : 'a-direct',
                \'ada.direct_io'                                                 : 'a-direio',
                \'ada.dispatching.round_robin'                                   : 'a-diroro',
                \'ada.dispatching.edf'                                           : 'a-disedf',
                \'ada.dispatching'                                               : 'a-dispat',
                \'ada.dynamic_priorities'                                        : 'a-dynpri',
                \'ada.environment_variables'                                     : 'a-envvar',
                \'ada.execution_time.group_budgets'                              : 'a-etgrbu',
                \'ada.exceptions'                                                : 'a-except',
                \'ada.exceptions.traceback'                                      : 'a-exctra',
                \'ada.execution_time'                                            : 'a-exetim',
                \'ada.execution_time.interrupts'                                 : 'a-extiin',
                \'ada.execution_time.timers'                                     : 'a-extiti',
                \'ada.finalization'                                              : 'a-finali',
                \'ada.float_text_io'                                             : 'a-flteio',
                \'ada.float_wide_text_io'                                        : 'a-fwteio',
                \'ada.float_wide_wide_text_io'                                   : 'a-fzteio',
                \'ada.integer_text_io'                                           : 'a-inteio',
                \'ada.interrupts'                                                : 'a-interr',
                \'ada.interrupts.names'                                          : 'a-intnam',
                \'ada.io_exceptions'                                             : 'a-ioexce',
                \'ada.iterator_interfaces'                                       : 'a-iteint',
                \'ada.integer_wide_text_io'                                      : 'a-iwteio',
                \'ada.integer_wide_wide_text_io'                                 : 'a-izteio',
                \'ada.long_complex_text_io'                                      : 'a-lcteio',
                \'ada.long_float_text_io'                                        : 'a-lfteio',
                \'ada.long_float_wide_text_io'                                   : 'a-lfwtio',
                \'ada.long_float_wide_wide_text_io'                              : 'a-lfztio',
                \'ada.long_integer_text_io'                                      : 'a-liteio',
                \'ada.long_integer_wide_text_io'                                 : 'a-liwtio',
                \'ada.long_integer_wide_wide_text_io'                            : 'a-liztio',
                \'ada.long_long_complex_text_io'                                 : 'a-llctio',
                \'ada.long_long_float_text_io'                                   : 'a-llftio',
                \'ada.long_long_float_wide_text_io'                              : 'a-llfwti',
                \'ada.long_long_float_wide_wide_text_io'                         : 'a-llfzti',
                \'ada.long_long_integer_text_io'                                 : 'a-llitio',
                \'ada.long_long_integer_wide_text_io'                            : 'a-lliwti',
                \'ada.long_long_integer_wide_wide_text_io'                       : 'a-llizti',
                \'ada.locales'                                                   : 'a-locale',
                \'ada.numerics.complex_elementary_functions'                     : 'a-ncelfu',
                \'ada.numerics.generic_complex_elementary_functions'             : 'a-ngcefu',
                \'ada.numerics.generic_complex_arrays'                           : 'a-ngcoar',
                \'ada.numerics.generic_complex_types'                            : 'a-ngcoty',
                \'ada.numerics.generic_elementary_functions'                     : 'a-ngelfu',
                \'ada.numerics.generic_real_arrays'                              : 'a-ngrear',
                \'ada.numerics.long_complex_elementary_functions'                : 'a-nlcefu',
                \'ada.numerics.long_complex_arrays'                              : 'a-nlcoar',
                \'ada.numerics.long_complex_types'                               : 'a-nlcoty',
                \'ada.numerics.long_elementary_functions'                        : 'a-nlelfu',
                \'ada.numerics.long_long_complex_arrays'                         : 'a-nllcar',
                \'ada.numerics.long_long_complex_elementary_functions'           : 'a-nllcef',
                \'ada.numerics.long_long_complex_types'                          : 'a-nllcty',
                \'ada.numerics.long_long_elementary_functions'                   : 'a-nllefu',
                \'ada.numerics.long_long_real_arrays'                            : 'a-nllrar',
                \'ada.numerics.long_real_arrays'                                 : 'a-nlrear',
                \'ada.numerics.short_complex_elementary_functions'               : 'a-nscefu',
                \'ada.numerics.short_complex_types'                              : 'a-nscoty',
                \'ada.numerics.short_elementary_functions'                       : 'a-nselfu',
                \'ada.numerics.complex_arrays'                                   : 'a-nucoar',
                \'ada.numerics.complex_types'                                    : 'a-nucoty',
                \'ada.numerics.discrete_random'                                  : 'a-nudira',
                \'ada.numerics.elementary_functions'                             : 'a-nuelfu',
                \'ada.numerics.float_random'                                     : 'a-nuflra',
                \'ada.numerics.aux'                                              : 'a-numaux',
                \'ada.numerics'                                                  : 'a-numeri',
                \'ada.numerics.real_arrays'                                      : 'a-nurear',
                \'ada.containers.red_black_trees.generic_bounded_keys'           : 'a-rbtgbk',
                \'ada.containers.red_black_trees.generic_bounded_operations'     : 'a-rbtgbo',
                \'ada.containers.red_black_trees.generic_set_operations'         : 'a-rbtgso',
                \'ada.real_time'                                                 : 'a-reatim',
                \'ada.real_time.delays'                                          : 'a-retide',
                \'ada.real_time.timing_events'                                   : 'a-rttiev',
                \'ada.short_complex_text_io'                                     : 'a-scteio',
                \'ada.sequential_io'                                             : 'a-sequio',
                \'ada.short_float_text_io'                                       : 'a-sfteio',
                \'ada.short_float_wide_text_io'                                  : 'a-sfwtio',
                \'ada.short_float_wide_wide_text_io'                             : 'a-sfztio',
                \'ada.sequential_io.c_streams'                                   : 'a-siocst',
                \'ada.short_integer_text_io'                                     : 'a-siteio',
                \'ada.short_integer_wide_text_io'                                : 'a-siwtio',
                \'ada.short_integer_wide_wide_text_io'                           : 'a-siztio',
                \'ada.streams.stream_io.c_streams'                               : 'a-ssicst',
                \'ada.short_short_integer_text_io'                               : 'a-ssitio',
                \'ada.short_short_integer_wide_text_io'                          : 'a-ssiwti',
                \'ada.short_short_integer_wide_wide_text_io'                     : 'a-ssizti',
                \'ada.synchronous_task_control.edf'                              : 'a-stcoed',
                \'ada.strings.maps.constants'                                    : 'a-stmaco',
                \'ada.storage_io'                                                : 'a-storio',
                \'ada.strings.bounded'                                           : 'a-strbou',
                \'ada.streams'                                                   : 'a-stream',
                \'ada.strings.fixed'                                             : 'a-strfix',
                \'ada.strings'                                                   : 'a-string',
                \'ada.strings.maps'                                              : 'a-strmap',
                \'ada.strings.superbounded'                                      : 'a-strsup',
                \'ada.strings.unbounded'                                         : 'a-strunb',
                \'ada.streams.stream_io'                                         : 'a-ststio',
                \'ada.strings.unbounded.aux'                                     : 'a-stunau',
                \'ada.strings.utf_encoding'                                      : 'a-stuten',
                \'ada.strings.wide_bounded'                                      : 'a-stwibo',
                \'ada.strings.wide_fixed'                                        : 'a-stwifi',
                \'ada.strings.wide_maps'                                         : 'a-stwima',
                \'ada.strings.wide_superbounded'                                 : 'a-stwisu',
                \'ada.strings.wide_unbounded'                                    : 'a-stwiun',
                \'ada.strings.wide_wide_bounded'                                 : 'a-stzbou',
                \'ada.strings.wide_wide_fixed'                                   : 'a-stzfix',
                \'ada.strings.wide_wide_maps'                                    : 'a-stzmap',
                \'ada.strings.wide_wide_superbounded'                            : 'a-stzsup',
                \'ada.strings.wide_wide_unbounded'                               : 'a-stzunb',
                \'ada.strings.utf_encoding.conversions'                          : 'a-suenco',
                \'ada.strings.utf_encoding.strings'                              : 'a-suenst',
                \'ada.strings.utf_encoding.wide_strings'                         : 'a-suewst',
                \'ada.strings.utf_encoding.wide_wide_strings'                    : 'a-suezst',
                \'ada.strings.unbounded.text_io'                                 : 'a-suteio',
                \'ada.strings.wide_maps.wide_constants'                          : 'a-swmwco',
                \'ada.strings.wide_unbounded.aux'                                : 'a-swunau',
                \'ada.strings.wide_unbounded.wide_text_io'                       : 'a-swuwti',
                \'ada.synchronous_barriers'                                      : 'a-synbar',
                \'ada.synchronous_task_control'                                  : 'a-sytaco',
                \'ada.strings.wide_wide_maps.wide_wide_constants'                : 'a-szmzco',
                \'ada.strings.wide_wide_unbounded.aux'                           : 'a-szunau',
                \'ada.strings.wide_wide_unbounded.wide_wide_text_io'             : 'a-szuzti',
                \'ada.tags'                                                      : 'a-tags',
                \'ada.task_attributes'                                           : 'a-tasatt',
                \'ada.task_identification'                                       : 'a-taside',
                \'ada.task_termination'                                          : 'a-taster',
                \'ada.text_io.editing'                                           : 'a-teioed',
                \'ada.text_io'                                                   : 'a-textio',
                \'ada.text_io.bounded_io'                                        : 'a-tiboio',
                \'ada.text_io.complex_aux'                                       : 'a-ticoau',
                \'ada.text_io.complex_io'                                        : 'a-ticoio',
                \'ada.text_io.decimal_io'                                        : 'a-tideio',
                \'ada.text_io.enumeration_io'                                    : 'a-tienio',
                \'ada.text_io.fixed_io'                                          : 'a-tifiio',
                \'ada.text_io.float_io'                                          : 'a-tiflio',
                \'ada.text_io.integer_io'                                        : 'a-tiinio',
                \'ada.text_io.modular_io'                                        : 'a-timoio',
                \'ada.text_io.c_streams'                                         : 'a-tiocst',
                \'ada.text_io.text_streams'                                      : 'a-titest',
                \'ada.text_io.unbounded_io'                                      : 'a-tiunio',
                \'ada.wide_characters.handling'                                  : 'a-wichha',
                \'ada.wide_characters.unicode'                                   : 'a-wichun',
                \'ada.wide_characters'                                           : 'a-widcha',
                \'ada.wide_text_io'                                              : 'a-witeio',
                \'ada.wide_text_io.complex_aux'                                  : 'a-wtcoau',
                \'ada.wide_text_io.complex_io'                                   : 'a-wtcoio',
                \'ada.wide_text_io.c_streams'                                    : 'a-wtcstr',
                \'ada.wide_text_io.decimal_io'                                   : 'a-wtdeio',
                \'ada.wide_text_io.editing'                                      : 'a-wtedit',
                \'ada.wide_text_io.enumeration_io'                               : 'a-wtenio',
                \'ada.wide_text_io.fixed_io'                                     : 'a-wtfiio',
                \'ada.wide_text_io.float_io'                                     : 'a-wtflio',
                \'ada.wide_text_io.generic_aux'                                  : 'a-wtgeau',
                \'ada.wide_text_io.integer_io'                                   : 'a-wtinio',
                \'ada.wide_text_io.modular_io'                                   : 'a-wtmoio',
                \'ada.wide_text_io.text_streams'                                 : 'a-wttest',
                \'ada.wide_text_io.wide_bounded_io'                              : 'a-wwboio',
                \'ada.wide_text_io.wide_unbounded_io'                            : 'a-wwunio',
                \'ada.wide_wide_characters'                                      : 'a-zchara',
                \'ada.wide_wide_characters.handling'                             : 'a-zchhan',
                \'ada.wide_wide_characters.unicode'                              : 'a-zchuni',
                \'ada.wide_wide_text_io.complex_aux'                             : 'a-ztcoau',
                \'ada.wide_wide_text_io.complex_io'                              : 'a-ztcoio',
                \'ada.wide_wide_text_io.c_streams'                               : 'a-ztcstr',
                \'ada.wide_wide_text_io.decimal_io'                              : 'a-ztdeio',
                \'ada.wide_wide_text_io.editing'                                 : 'a-ztedit',
                \'ada.wide_wide_text_io.enumeration_io'                          : 'a-ztenio',
                \'ada.wide_wide_text_io'                                         : 'a-ztexio',
                \'ada.wide_wide_text_io.fixed_io'                                : 'a-ztfiio',
                \'ada.wide_wide_text_io.float_io'                                : 'a-ztflio',
                \'ada.wide_wide_text_io.generic_aux'                             : 'a-ztgeau',
                \'ada.wide_wide_text_io.integer_io'                              : 'a-ztinio',
                \'ada.wide_wide_text_io.modular_io'                              : 'a-ztmoio',
                \'ada.wide_wide_text_io.text_streams'                            : 'a-zttest',
                \'ada.wide_wide_text_io.wide_wide_bounded_io'                    : 'a-zzboio',
                \'ada.wide_wide_text_io.wide_wide_unbounded_io'                  : 'a-zzunio',
                \'ada'                                                           : 'ada',
                \'calendar'                                                      : 'calendar',
                \'gnat.altivec.low_level_interface'                              : 'g-allein',
                \'gnat.altivec.low_level_vectors'                                : 'g-alleve',
                \'gnat.altivec.conversions'                                      : 'g-altcon',
                \'gnat.altivec'                                                  : 'g-altive',
                \'gnat.altivec.vector_operations'                                : 'g-alveop',
                \'gnat.altivec.vector_types'                                     : 'g-alvety',
                \'gnat.altivec.vector_views'                                     : 'g-alvevi',
                \'gnat.array_split'                                              : 'g-arrspl',
                \'gnat.awk'                                                      : 'g-awk',
                \'gnat.bind_environment'                                         : 'g-binenv',
                \'gnat.bounded_buffers'                                          : 'g-boubuf',
                \'gnat.bounded_mailboxes'                                        : 'g-boumai',
                \'gnat.branch_prediction'                                        : 'g-brapre',
                \'gnat.bubble_sort'                                              : 'g-bubsor',
                \'gnat.bubble_sort_a'                                            : 'g-busora',
                \'gnat.bubble_sort_g'                                            : 'g-busorg',
                \'gnat.byte_order_mark'                                          : 'g-byorma',
                \'gnat.byte_swapping'                                            : 'g-bytswa',
                \'gnat.calendar'                                                 : 'g-calend',
                \'gnat.case_util'                                                : 'g-casuti',
                \'gnat.calendar.time_io'                                         : 'g-catiio',
                \'gnat.cgi'                                                      : 'g-cgi',
                \'gnat.cgi.cookie'                                               : 'g-cgicoo',
                \'gnat.cgi.debug'                                                : 'g-cgideb',
                \'gnat.command_line'                                             : 'g-comlin',
                \'gnat.compiler_version'                                         : 'g-comver',
                \'gnat.cpp_exceptions'                                           : 'g-cppexc',
                \'gnat.crc32'                                                    : 'g-crc32',
                \'gnat.ctrl_c'                                                   : 'g-ctrl_c',
                \'gnat.current_exception'                                        : 'g-curexc',
                \'gnat.debug_pools'                                              : 'g-debpoo',
                \'gnat.debug_utilities'                                          : 'g-debuti',
                \'gnat.decode_string'                                            : 'g-decstr',
                \'gnat.decode_utf8_string'                                       : 'g-deutst',
                \'gnat.directory_operations.iteration'                           : 'g-diopit',
                \'gnat.directory_operations'                                     : 'g-dirope',
                \'gnat.dynamic_htables'                                          : 'g-dynhta',
                \'gnat.dynamic_tables'                                           : 'g-dyntab',
                \'gnat.encode_string'                                            : 'g-encstr',
                \'gnat.encode_utf8_string'                                       : 'g-enutst',
                \'gnat.exception_actions'                                        : 'g-excact',
                \'gnat.exceptions'                                               : 'g-except',
                \'gnat.exception_traces'                                         : 'g-exctra',
                \'gnat.expect'                                                   : 'g-expect',
                \'gnat.expect.tty'                                               : 'g-exptty',
                \'gnat.float_control'                                            : 'g-flocon',
                \'gnat.formatted_string'                                         : 'g-forstr',
                \'gnat.graphs'                                                   : 'g-graphs',
                \'gnat.heap_sort'                                                : 'g-heasor',
                \'gnat.heap_sort_a'                                              : 'g-hesora',
                \'gnat.heap_sort_g'                                              : 'g-hesorg',
                \'gnat.htable'                                                   : 'g-htable',
                \'gnat.io'                                                       : 'g-io',
                \'gnat.io_aux'                                                   : 'g-io_aux',
                \'gnat.lists'                                                    : 'g-lists',
                \'gnat.lock_files'                                               : 'g-locfil',
                \'gnat.mbbs_discrete_random'                                     : 'g-mbdira',
                \'gnat.mbbs_float_random'                                        : 'g-mbflra',
                \'gnat.md5'                                                      : 'g-md5',
                \'gnat.memory_dump'                                              : 'g-memdum',
                \'gnat.most_recent_exception'                                    : 'g-moreex',
                \'gnat.os_lib'                                                   : 'g-os_lib',
                \'gnat.perfect_hash_generators'                                  : 'g-pehage',
                \'gnat.random_numbers'                                           : 'g-rannum',
                \'gnat.regexp'                                                   : 'g-regexp',
                \'gnat.regpat'                                                   : 'g-regpat',
                \'gnat.rewrite_data'                                             : 'g-rewdat',
                \'gnat.secure_hashes'                                            : 'g-sechas',
                \'gnat.secure_hashes.md5'                                        : 'g-sehamd',
                \'gnat.secure_hashes.sha1'                                       : 'g-sehash',
                \'gnat.semaphores'                                               : 'g-semaph',
                \'gnat.serial_communications'                                    : 'g-sercom',
                \'gnat.secondary_stack_info'                                     : 'g-sestin',
                \'gnat.sets'                                                     : 'g-sets',
                \'gnat.sha1'                                                     : 'g-sha1',
                \'gnat.sha224'                                                   : 'g-sha224',
                \'gnat.sha256'                                                   : 'g-sha256',
                \'gnat.sha384'                                                   : 'g-sha384',
                \'gnat.sha512'                                                   : 'g-sha512',
                \'gnat.secure_hashes.sha2_32'                                    : 'g-shsh32',
                \'gnat.secure_hashes.sha2_64'                                    : 'g-shsh64',
                \'gnat.secure_hashes.sha2_common'                                : 'g-shshco',
                \'gnat.signals'                                                  : 'g-signal',
                \'gnat.sockets.constants'                                        : 'g-soccon',
                \'gnat.sockets'                                                  : 'g-socket',
                \'gnat.sockets.thin'                                             : 'g-socthi',
                \'gnat.sockets.linker_options'                                   : 'g-soliop',
                \'gnat.sockets.thin_common'                                      : 'g-sothco',
                \'gnat.source_info'                                              : 'g-souinf',
                \'gnat.spelling_checker_generic'                                 : 'g-spchge',
                \'gnat.spelling_checker'                                         : 'g-speche',
                \'gnat.spitbol.patterns'                                         : 'g-spipat',
                \'gnat.spitbol'                                                  : 'g-spitbo',
                \'gnat.spitbol.table_boolean'                                    : 'g-sptabo',
                \'gnat.spitbol.table_integer'                                    : 'g-sptain',
                \'gnat.spitbol.table_vstring'                                    : 'g-sptavs',
                \'gnat.sse'                                                      : 'g-sse',
                \'gnat.sse.vector_types'                                         : 'g-ssvety',
                \'gnat.string_hash'                                              : 'g-strhas',
                \'gnat.strings'                                                  : 'g-string',
                \'gnat.string_split'                                             : 'g-strspl',
                \'gnat.table'                                                    : 'g-table',
                \'gnat.task_lock'                                                : 'g-tasloc',
                \'gnat.task_stack_usage'                                         : 'g-tastus',
                \'gnat.threads'                                                  : 'g-thread',
                \'gnat.time_stamp'                                               : 'g-timsta',
                \'gnat.traceback'                                                : 'g-traceb',
                \'gnat.traceback.symbolic'                                       : 'g-trasym',
                \'gnat.tty'                                                      : 'g-tty',
                \'gnat.utf_32_spelling_checker'                                  : 'g-u3spch',
                \'gnat.utf_32'                                                   : 'g-utf_32',
                \'gnat.wide_spelling_checker'                                    : 'g-wispch',
                \'gnat.wide_string_split'                                        : 'g-wistsp',
                \'gnat.wide_wide_spelling_checker'                               : 'g-zspche',
                \'gnat.wide_wide_string_split'                                   : 'g-zstspl',
                \'gnat'                                                          : 'gnat',
                \'interfaces.c'                                                  : 'i-c',
                \'interfaces.c.extensions'                                       : 'i-cexten',
                \'interfaces.cobol'                                              : 'i-cobol',
                \'interfaces.c.pointers'                                         : 'i-cpoint',
                \'interfaces.c_streams'                                          : 'i-cstrea',
                \'interfaces.c.strings'                                          : 'i-cstrin',
                \'interfaces.fortran'                                            : 'i-fortra',
                \'interfaces.packed_decimal'                                     : 'i-pacdec',
                \'interfaces'                                                    : 'interfac',
                \'io_exceptions'                                                 : 'ioexcept',
                \'machine_code'                                                  : 'machcode',
                \'system.address_operations'                                     : 's-addope',
                \'system.arith_64'                                               : 's-arit64',
                \'system.assertions'                                             : 's-assert',
                \'system.address_to_access_conversions'                          : 's-atacco',
                \'system.atomic_counters'                                        : 's-atocou',
                \'system.atomic_primitives'                                      : 's-atopri',
                \'system.aux_dec'                                                : 's-auxdec',
                \'system.bignums'                                                : 's-bignum',
                \'system.bit_ops'                                                : 's-bitops',
                \'system.boolean_array_operations'                               : 's-boarop',
                \'system.bounded_strings'                                        : 's-boustr',
                \'system.byte_swapping'                                          : 's-bytswa',
                \'system.compare_array_signed_8'                                 : 's-carsi8',
                \'system.compare_array_unsigned_8'                               : 's-carun8',
                \'system.compare_array_signed_16'                                : 's-casi16',
                \'system.compare_array_signed_32'                                : 's-casi32',
                \'system.compare_array_signed_64'                                : 's-casi64',
                \'system.case_util'                                              : 's-casuti',
                \'system.compare_array_unsigned_16'                              : 's-caun16',
                \'system.compare_array_unsigned_32'                              : 's-caun32',
                \'system.compare_array_unsigned_64'                              : 's-caun64',
                \'system.checked_pools'                                          : 's-chepoo',
                \'system.communication'                                          : 's-commun',
                \'system.concat_2'                                               : 's-conca2',
                \'system.concat_3'                                               : 's-conca3',
                \'system.concat_4'                                               : 's-conca4',
                \'system.concat_5'                                               : 's-conca5',
                \'system.concat_6'                                               : 's-conca6',
                \'system.concat_7'                                               : 's-conca7',
                \'system.concat_8'                                               : 's-conca8',
                \'system.concat_9'                                               : 's-conca9',
                \'system.crc32'                                                  : 's-crc32',
                \'system.crtl'                                                   : 's-crtl',
                \'system.dim.float_mks_io'                                       : 's-dfmkio',
                \'system.dim.float_mks.other_prefixes'                           : 's-dfmopr',
                \'system.dim.generic_mks.generic_other_prefixes'                 : 's-dgmgop',
                \'system.dim.float_io'                                           : 's-diflio',
                \'system.dim.float_mks'                                          : 's-diflmk',
                \'system.dim.generic_mks'                                        : 's-digemk',
                \'system.dim.integer_io'                                         : 's-diinio',
                \'system.dim.long_mks'                                           : 's-dilomk',
                \'system.dim'                                                    : 's-dim',
                \'system.dim.mks_io'                                             : 's-dimkio',
                \'system.dim.mks'                                                : 's-dimmks',
                \'system.direct_io'                                              : 's-direio',
                \'system.dim.long_mks_io'                                        : 's-dlmkio',
                \'system.dim.long_mks.other_prefixes'                            : 's-dlmopr',
                \'system.dim.mks.other_prefixes'                                 : 's-dmotpr',
                \'system.dsa_services'                                           : 's-dsaser',
                \'system.dwarf_lines'                                            : 's-dwalin',
                \'system.elaboration_allocators'                                 : 's-elaall',
                \'system.exceptions_debug'                                       : 's-excdeb',
                \'system.exceptions'                                             : 's-except',
                \'system.exceptions.machine'                                     : 's-excmac',
                \'system.exception_table'                                        : 's-exctab',
                \'system.exception_traces'                                       : 's-exctra',
                \'system.exn_int'                                                : 's-exnint',
                \'system.exn_llf'                                                : 's-exnllf',
                \'system.exn_lli'                                                : 's-exnlli',
                \'system.exp_int'                                                : 's-expint',
                \'system.exp_lli'                                                : 's-explli',
                \'system.exp_llu'                                                : 's-expllu',
                \'system.exp_mod'                                                : 's-expmod',
                \'system.exp_uns'                                                : 's-expuns',
                \'system.fat_flt'                                                : 's-fatflt',
                \'system.fat_gen'                                                : 's-fatgen',
                \'system.fat_lflt'                                               : 's-fatlfl',
                \'system.fat_llf'                                                : 's-fatllf',
                \'system.fat_sflt'                                               : 's-fatsfl',
                \'system.file_control_block'                                     : 's-ficobl',
                \'system.file_attributes'                                        : 's-filatt',
                \'system.file_io'                                                : 's-fileio',
                \'system.finalization_masters'                                   : 's-finmas',
                \'system.finalization_root'                                      : 's-finroo',
                \'system.float_control'                                          : 's-flocon',
                \'system.fore'                                                   : 's-fore',
                \'system.generic_array_operations'                               : 's-gearop',
                \'system.generic_vector_operations'                              : 's-geveop',
                \'system.global_locks'                                           : 's-gloloc',
                \'system.htable'                                                 : 's-htable',
                \'system.img_enum_new'                                           : 's-imenne',
                \'system.img_biu'                                                : 's-imgbiu',
                \'system.img_bool'                                               : 's-imgboo',
                \'system.img_char'                                               : 's-imgcha',
                \'system.img_dec'                                                : 's-imgdec',
                \'system.img_enum'                                               : 's-imgenu',
                \'system.img_int'                                                : 's-imgint',
                \'system.img_llb'                                                : 's-imgllb',
                \'system.img_lld'                                                : 's-imglld',
                \'system.img_lli'                                                : 's-imglli',
                \'system.img_llu'                                                : 's-imgllu',
                \'system.img_llw'                                                : 's-imgllw',
                \'system.img_real'                                               : 's-imgrea',
                \'system.img_uns'                                                : 's-imguns',
                \'system.img_wchar'                                              : 's-imgwch',
                \'system.img_wiu'                                                : 's-imgwiu',
                \'system.interrupt_management.operations'                        : 's-inmaop',
                \'system.interrupts'                                             : 's-interr',
                \'system.interrupt_management'                                   : 's-intman',
                \'system.io'                                                     : 's-io',
                \'system.long_long_float_expon'                                  : 's-llflex',
                \'system.machine_code'                                           : 's-maccod',
                \'system.mantissa'                                               : 's-mantis',
                \'system.machine_state_operations'                               : 's-mastop',
                \'system.memory_copy'                                            : 's-memcop',
                \'system.memory'                                                 : 's-memory',
                \'system.mmap'                                                   : 's-mmap',
                \'system.multiprocessors.dispatching_domains'                    : 's-mudido',
                \'system.multiprocessors'                                        : 's-multip',
                \'system.object_reader'                                          : 's-objrea',
                \'system.os_lib'                                                 : 's-os_lib',
                \'system.os_constants'                                           : 's-oscons',
                \'system.os_interface'                                           : 's-osinte',
                \'system.os_primitives'                                          : 's-osprim',
                \'system.pack_03'                                                : 's-pack03',
                \'system.pack_05'                                                : 's-pack05',
                \'system.pack_06'                                                : 's-pack06',
                \'system.pack_07'                                                : 's-pack07',
                \'system.pack_09'                                                : 's-pack09',
                \'system.pack_10'                                                : 's-pack10',
                \'system.pack_11'                                                : 's-pack11',
                \'system.pack_12'                                                : 's-pack12',
                \'system.pack_13'                                                : 's-pack13',
                \'system.pack_14'                                                : 's-pack14',
                \'system.pack_15'                                                : 's-pack15',
                \'system.pack_17'                                                : 's-pack17',
                \'system.pack_18'                                                : 's-pack18',
                \'system.pack_19'                                                : 's-pack19',
                \'system.pack_20'                                                : 's-pack20',
                \'system.pack_21'                                                : 's-pack21',
                \'system.pack_22'                                                : 's-pack22',
                \'system.pack_23'                                                : 's-pack23',
                \'system.pack_24'                                                : 's-pack24',
                \'system.pack_25'                                                : 's-pack25',
                \'system.pack_26'                                                : 's-pack26',
                \'system.pack_27'                                                : 's-pack27',
                \'system.pack_28'                                                : 's-pack28',
                \'system.pack_29'                                                : 's-pack29',
                \'system.pack_30'                                                : 's-pack30',
                \'system.pack_31'                                                : 's-pack31',
                \'system.pack_33'                                                : 's-pack33',
                \'system.pack_34'                                                : 's-pack34',
                \'system.pack_35'                                                : 's-pack35',
                \'system.pack_36'                                                : 's-pack36',
                \'system.pack_37'                                                : 's-pack37',
                \'system.pack_38'                                                : 's-pack38',
                \'system.pack_39'                                                : 's-pack39',
                \'system.pack_40'                                                : 's-pack40',
                \'system.pack_41'                                                : 's-pack41',
                \'system.pack_42'                                                : 's-pack42',
                \'system.pack_43'                                                : 's-pack43',
                \'system.pack_44'                                                : 's-pack44',
                \'system.pack_45'                                                : 's-pack45',
                \'system.pack_46'                                                : 's-pack46',
                \'system.pack_47'                                                : 's-pack47',
                \'system.pack_48'                                                : 's-pack48',
                \'system.pack_49'                                                : 's-pack49',
                \'system.pack_50'                                                : 's-pack50',
                \'system.pack_51'                                                : 's-pack51',
                \'system.pack_52'                                                : 's-pack52',
                \'system.pack_53'                                                : 's-pack53',
                \'system.pack_54'                                                : 's-pack54',
                \'system.pack_55'                                                : 's-pack55',
                \'system.pack_56'                                                : 's-pack56',
                \'system.pack_57'                                                : 's-pack57',
                \'system.pack_58'                                                : 's-pack58',
                \'system.pack_59'                                                : 's-pack59',
                \'system.pack_60'                                                : 's-pack60',
                \'system.pack_61'                                                : 's-pack61',
                \'system.pack_62'                                                : 's-pack62',
                \'system.pack_63'                                                : 's-pack63',
                \'system.parameters'                                             : 's-parame',
                \'system.partition_interface'                                    : 's-parint',
                \'system.pool_global'                                            : 's-pooglo',
                \'system.pool_local'                                             : 's-pooloc',
                \'system.pool_size'                                              : 's-poosiz',
                \'system.powten_table'                                           : 's-powtab',
                \'system.program_info'                                           : 's-proinf',
                \'system.pure_exceptions'                                        : 's-purexc',
                \'system.qnx'                                                    : 's-qnx',
                \'system.random_numbers'                                         : 's-rannum',
                \'system.random_seed'                                            : 's-ransee',
                \'system.regexp'                                                 : 's-regexp',
                \'system.regpat'                                                 : 's-regpat',
                \'system.response_file'                                          : 's-resfil',
                \'system.restrictions'                                           : 's-restri',
                \'system.rident'                                                 : 's-rident',
                \'system.rpc'                                                    : 's-rpc',
                \'system.scalar_values'                                          : 's-scaval',
                \'system.secondary_stack'                                        : 's-secsta',
                \'system.sequential_io'                                          : 's-sequio',
                \'system.shared_storage'                                         : 's-shasto',
                \'system.soft_links'                                             : 's-soflin',
                \'system.soft_links.initialize'                                  : 's-soliin',
                \'system.soft_links.tasking'                                     : 's-solita',
                \'system.storage_pools.subpools.finalization'                    : 's-spsufi',
                \'system.stack_checking'                                         : 's-stache',
                \'system.standard_library'                                       : 's-stalib',
                \'system.stack_usage'                                            : 's-stausa',
                \'system.storage_elements'                                       : 's-stoele',
                \'system.storage_pools'                                          : 's-stopoo',
                \'system.storage_pools.subpools'                                 : 's-stposu',
                \'system.stream_attributes'                                      : 's-stratt',
                \'system.string_hash'                                            : 's-strhas',
                \'system.strings'                                                : 's-string',
                \'system.string_ops'                                             : 's-strops',
                \'system.strings.stream_ops'                                     : 's-ststop',
                \'system.stack_usage.tasking'                                    : 's-stusta',
                \'system.tasking.async_delays'                                   : 's-taasde',
                \'system.tasking.entry_calls'                                    : 's-taenca',
                \'system.tasking.protected_objects'                              : 's-taprob',
                \'system.task_primitives.operations'                             : 's-taprop',
                \'system.tasking.restricted.stages'                              : 's-tarest',
                \'system.tasking.debug'                                          : 's-tasdeb',
                \'system.task_info'                                              : 's-tasinf',
                \'system.tasking.initialization'                                 : 's-tasini',
                \'system.tasking'                                                : 's-taskin',
                \'system.task_lock'                                              : 's-tasloc',
                \'system.task_primitives'                                        : 's-taspri',
                \'system.tasking.queuing'                                        : 's-tasque',
                \'system.tasking.rendezvous'                                     : 's-tasren',
                \'system.tasking.restricted'                                     : 's-tasres',
                \'system.tasking.stages'                                         : 's-tassta',
                \'system.tasking.utilities'                                      : 's-tasuti',
                \'system.tasking.task_attributes'                                : 's-tataat',
                \'system.task_primitives.interrupt_operations'                   : 's-tpinop',
                \'system.tasking.protected_objects.entries'                      : 's-tpoben',
                \'system.tasking.protected_objects.multiprocessors'              : 's-tpobmu',
                \'system.tasking.protected_objects.operations'                   : 's-tpobop',
                \'system.tasking.protected_objects.single_entry'                 : 's-tposen',
                \'system.traceback'                                              : 's-traceb',
                \'system.traceback_entries'                                      : 's-traent',
                \'system.traceback.symbolic'                                     : 's-trasym',
                \'system.unsigned_types'                                         : 's-unstyp',
                \'system.utf_32'                                                 : 's-utf_32',
                \'system.val_bool'                                               : 's-valboo',
                \'system.val_char'                                               : 's-valcha',
                \'system.val_dec'                                                : 's-valdec',
                \'system.val_enum'                                               : 's-valenu',
                \'system.val_int'                                                : 's-valint',
                \'system.val_lld'                                                : 's-vallld',
                \'system.val_lli'                                                : 's-vallli',
                \'system.val_llu'                                                : 's-valllu',
                \'system.val_real'                                               : 's-valrea',
                \'system.val_uns'                                                : 's-valuns',
                \'system.val_util'                                               : 's-valuti',
                \'system.val_wchar'                                              : 's-valwch',
                \'system.vectors.boolean_operations'                             : 's-veboop',
                \'system.vectors'                                                : 's-vector',
                \'system.version_control'                                        : 's-vercon',
                \'system.wch_cnv'                                                : 's-wchcnv',
                \'system.wch_con'                                                : 's-wchcon',
                \'system.wch_jis'                                                : 's-wchjis',
                \'system.wch_stw'                                                : 's-wchstw',
                \'system.wch_wts'                                                : 's-wchwts',
                \'system.wid_bool'                                               : 's-widboo',
                \'system.wid_char'                                               : 's-widcha',
                \'system.wid_enum'                                               : 's-widenu',
                \'system.wid_lli'                                                : 's-widlli',
                \'system.wid_llu'                                                : 's-widllu',
                \'system.wid_wchar'                                              : 's-widwch',
                \'system.wwd_char'                                               : 's-wwdcha',
                \'system.wwd_enum'                                               : 's-wwdenu',
                \'system.wwd_wchar'                                              : 's-wwdwch',
                \'system'                                                        : 'system',
                \'text_io'                                                       : 'text_io',
                \'ada.containers.generic_anonymous_array_sort'   : 'a-cgaaso',
                \'ada.containers.generic_array_sort'             : 'a-cgarso',
                \'ada.containers.generic_constrained_array_sort' : 'a-cgcaso',
                \'ada.containers.generic_sort'                   : 'a-cogeso',
                \'ada.exceptions.last_chance_handler'            : 'a-elchha',
                \'ada.text_io.reset_standard_files;'             : 'a-tirsfi',
                \'ada.unchecked_deallocation'                    : 'a-uncdea',
                \'ada.unchecked_deallocate_subpool'              : 'a-undesu',
                \'ada.wide_text_io.reset_standard_files;'        : 'a-wrstfi',
                \'ada.wide_wide_text_io.reset_standard_files;'   : 'a-zrstfi',
                \'unchecked_deallocation'                        : 'unchdeal',
                \'ada.exceptions.is_null_occurrence'              : 'a-einuoc',
                \'ada.strings.bounded.equal_case_insensitive'     : 'a-sbecin',
                \'ada.strings.bounded.hash_case_insensitive'      : 'a-sbhcin',
                \'ada.strings.bounded.less_case_insensitive'      : 'a-sblcin',
                \'ada.strings.equal_case_insensitive'             : 'a-secain',
                \'ada.strings.fixed.equal_case_insensitive'       : 'a-sfecin',
                \'ada.strings.fixed.hash_case_insensitive'        : 'a-sfhcin',
                \'ada.strings.fixed.less_case_insensitive'        : 'a-sflcin',
                \'ada.strings.hash_case_insensitive'              : 'a-shcain',
                \'ada.strings.less_case_insensitive'              : 'a-slcain',
                \'ada.strings.bounded.hash'                       : 'a-stboha',
                \'ada.strings.fixed.hash'                         : 'a-stfiha',
                \'ada.strings.hash'                               : 'a-strhas',
                \'ada.strings.unbounded.hash'                     : 'a-stunha',
                \'ada.strings.wide_hash'                          : 'a-stwiha',
                \'ada.strings.wide_wide_hash'                     : 'a-stzhas',
                \'ada.strings.unbounded.equal_case_insensitive'   : 'a-suecin',
                \'ada.strings.unbounded.hash_case_insensitive'    : 'a-suhcin',
                \'ada.strings.unbounded.less_case_insensitive'    : 'a-sulcin',
                \'ada.strings.wide_bounded.wide_hash'             : 'a-swbwha',
                \'ada.strings.wide_fixed.wide_hash'               : 'a-swfwha',
                \'ada.strings.wide_unbounded.wide_hash'           : 'a-swuwha',
                \'ada.strings.wide_wide_bounded.wide_wide_hash'   : 'a-szbzha',
                \'ada.strings.wide_wide_fixed.wide_wide_hash'     : 'a-szfzha',
                \'ada.strings.wide_wide_unbounded.wide_wide_hash' : 'a-szuzha',
                \'ada.tags.generic_dispatching_constructor'       : 'a-tgdico',
                \'ada.unchecked_conversion'                       : 'a-unccon',
                \'system.address_image'                           : 's-addima',
                \'system.tasking.async_delays.enqueue_calendar'   : 's-tadeca',
                \'system.tasking.async_delays.enqueue_rt'         : 's-tadert',
                \'unchecked_conversion'                           : 'unchconv'}

    if has_key (l:dict_lib_std_ada, l:fichier)
        " Si c'est un package standard du langage
        let l:fichier = chemin_lib_std . l:dict_lib_std_ada[l:fichier]

    else
        " On transforme les "." en "-"
        let l:fichier=tr (l:fichier, '.', '-')
    endif

    return l:fichier
endfunction

"}}}

" vim:foldlevel=0:foldmethod=marker
