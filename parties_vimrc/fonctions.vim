" Dernière modification : jeudi 28 septembre[09] 2017

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

    " Permet de récupérer la ligne et la colonne ou se trouve le curseur.
    let curcol = col( '.' )
    let curline = line( '.' )
    " Effectue la suppression des espaces en trop en fin de ligne.
    silent execute "normal! " . ':%s/\v\s+$//e' . "\<Return>" . ":nohlsearch\<Return>"
    " On efface les lignes blanches inutiles en fin de fichier.
    if prevnonblank( line( '$' ) ) < line( '$' )
        silent execute "normal! :" . prevnonblank( line( '$' ) ) . '+s/\v^\n\n+//e' . "\<Return>" . ":nohlsearch\<Return>"
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
    silent !clear
    make
endfunction

"}}}

" Si il y a un makefile on exécute le fichier compilé du même nom que celui du dossier sans la première majuscule
" sinon c'est le nom du fichier sans majuscule
function! ExistMakeFileC()                                                  "{{{

    if filereadable( 'makefile' ) || filereadable( 'Makefile' )

        let $nomFichier = substitute( split( getcwd(), '/' )[-1], "\\<\\u", "\\l\\0", "" )
        setlocal makeprg=make
        noremap  <buffer> <S-F9>        :make clean<Return>
        noremap! <buffer> <S-F9>  <Esc> :make clean<Return>
        noremap  <buffer> <F10>         :!./$nomFichier<Space>
        noremap! <buffer> <F10>   <Esc> :!./$nomFichier<Space>

    else

        setlocal makeprg=gcc\ -Wall\ -o\ %<\ %<.c
        noremap  <buffer> <F10>         :!./%<<Space>
        noremap! <buffer> <F10>   <Esc> :!./%<<Space>

    endif

endfunction

"}}}

" Configuration des raccourcis pour compiler en ada.
function! ExistBuildAda()                                                   "{{{

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
    let g:load_doxygen_syntax = 1
    setlocal syntax=cpp.doxygen
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

" Fonction pour définir le logiciel à ouvrir selon le système d'exploitation
" utilisé
" Définition de variable global pour ouvrir un pdf                      "{{{
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


" Fonction pour définir les macros Latex ouvrir facilement le fichier pdf généré par xetex
function! MacrosLatexSpecifique()                                           "{{{

    NoMatchParen
    if filereadable( 'makefile' ) || filereadable( 'Makefile' )

        setlocal makeprg=make
        noremap  <buffer> <S-F8>        :!make index<Return>
        noremap! <buffer> <S-F8>  <Esc> :!make index<Return>
        noremap  <buffer> <S-F9>        :!make clean<Return>
        noremap! <buffer> <S-F9>  <Esc> :!make clean<Return>

    else

        setlocal makeprg=xelatex\ %
        noremap  <buffer> <S-F8>        :!makeindex %<.idx<Return>
        noremap! <buffer> <S-F8>  <Esc> :!makeindex %<.idx<Return>
        noremap  <buffer> <S-F9>        :!rm -f %<.out %<.log %<.aux %<.toc %<.dvi %<.lof %<.lot %<.bbl %<.blg %<.idx %<.ilg %<.ind<Return>
        noremap! <buffer> <S-F9>  <Esc> :!rm -f %<.out %<.log %<.aux %<.toc %<.dvi %<.lof %<.lot %<.bbl %<.blg %<.idx %<.ilg %<.ind<Return>

    endif

    noremap  <buffer> <F10>         :call system( NomLecteurPDF() . " " . expand( '%<' ) . '.pdf &' )<Return>
    noremap! <buffer> <F10>   <Esc> :call system( NomLecteurPDF() . " " . expand( '%<' ) . '.pdf &' )<Return>

    if filereadable( 'bibliographie.bib' )
        noremap  <buffer> <S-F11>       :!bibtex %< <Return>
        noremap! <buffer> <S-F11> <Esc> :!bibtex %< <Return>
    endif

endfunction

"}}}

" Macros pour l'affichage formaté des fichiers groff
" La touche F5 affiche un aperçus dans le terminal pour les me
" La touche F10 affiche un aperçus dans le terminal pour les man
" La touche F12 ouvre le lecteur pdf
" Avec shift compile en pdf au lieu d'afficher sur le terminal
function! AffichageGroff()                                                  "{{{

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

    noremap  <buffer> <S-F5>       :!./runAntlr.sh %< <Return>
    noremap! <buffer> <S-F5> <Esc> :!./runAntlr.sh %< <Return>
    noremap  <buffer> <F10>        :!./runAntlr.sh %< test.code <Return>
    noremap! <buffer> <F10>  <Esc> :!./runAntlr.sh %< test.code <Return>

endfunction

"}}}

" Fonction pour aligner automatiquement les lignes avec le caractère |
function! s:alignTabulation()                                               "{{{
    let p = '^\s*|\s.*\s|\s*$'
    if exists( ':Tabularize' ) && getline( '.' ) =~# '^\s*|' && ( getline( line( '.' )-1 ) =~# p || getline( line( '.' )+1 ) =~# p )
        let column = strlen( substitute( getline( '.' )[0:col( '.' )], '[^|]', '', 'g' ) )
        let position = strlen( matchstr( getline( '.' )[0:col( '.' )], '.*|\s*\zs.*' ) )
        Tabularize/|/l1
        normal! 0
        call search( repeat( '[^|]*|', column ).'\s\{-\}'.repeat( '.', position ), 'ce', line( '.' ) )
    endif
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
