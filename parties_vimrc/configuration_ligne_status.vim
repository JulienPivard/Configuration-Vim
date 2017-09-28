" Dernière modification : jeudi 28 septembre[09] 2017

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
function! MaLigneStatus()                                                   "{{{

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

"}}}

" Affiche les statistiques de modification du fichier courante par rapport à
" la version précédente du fichier.
function! StatWrapperGit()                                                  "{{{
    if exists( '*sy#repo#get_stats()' )
        return sy#repo#get_stats()
    else
        return [0, 0, 0]
    endif
endfunction

"}}}

" Pour connaitre le nombre de lignes ajoutées au fichier courant [git]
function! StatAjout()                                                       "{{{
    let [added, modified, removed] = StatWrapperGit()
    if added > 0
        return '[' . printf( '+%s', added ) . ']'
    else
        return ''
    endif
endfunction

"}}}

" Pour connaitre le nombre de lignes supprimées au fichier courant [git]
function! StatSuppression()                                                 "{{{
    let [added, modified, removed] = StatWrapperGit()
    if removed > 0
        return '[' . printf( '-%s', removed ) . ']'
    else
        return ''
    endif
endfunction

"}}}

" Pour connaitre le nombre de lignes modifiées au fichier courant [git]
function! StatModifications()                                               "{{{
    let [added, modified, removed] = StatWrapperGit()
    if modified > 0
        return '[' . printf( '~%s', modified ) . ']'
    else
        return ''
    endif
endfunction

"}}}
