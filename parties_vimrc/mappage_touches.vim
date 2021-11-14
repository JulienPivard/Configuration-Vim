" Dernière modification : Dimanche 14 novembre[11] 2021

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
nnoremap <leader>gs  :Git               <Return>
nnoremap <leader>gcc :Git commit        <Return>
nnoremap <leader>gca :Git commit --amend<Return>
nnoremap <leader>gd  :Gdiffsplit        <Return>
nnoremap <leader>gv  :Gitv              <Return>

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

" vim:foldlevel=0:foldmethod=marker
