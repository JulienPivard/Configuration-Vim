" Each theme is contained in its own file and declares variables scoped to the
" file.  These variables represent the possible "modes" that airline can
" detect.  The mode is the return value of mode(), which gets converted to a
" readable string.  The following is a list currently supported modes: normal,
" insert, replace, visual, and inactive.
"
" Each mode can also have overrides.  These are small changes to the mode that
" don't require a completely different look.  "modified" and "paste" are two
" such supported overrides.  These are simply suffixed to the major mode,
" separated by an underscore.  For example, "normal_modified" would be normal
" mode where the current buffer is modified.
"
" The theming algorithm is a 2-pass system where the mode will draw over all
" parts of the statusline, and then the override is applied after.  This means
" it is possible to specify a subset of the theme in overrides, as it will
" simply overwrite the previous colors.  If you want simultaneous overrides,
" then they will need to change different parts of the statusline so they do
" not conflict with each other.
"
" First, let's define an empty dictionary and assign it to the "palette"
" variable. The # is a separator that maps with the directory structure. If
" you get this wrong, Vim will complain loudly.
let g:airline#themes#forest#palette = {}

" First let's define some arrays. The s: is just a VimL thing for scoping the
" variables to the current script. Without this, these variables would be
" declared globally. Now let's declare some colors for normal mode and add it
" to the dictionary.  The array is in the format:
" [ guifg, guibg, ctermfg, ctermbg, opts ]. See "help attr-list" for valid
" values for the "opt" value.
let s:N1   = [ '#00005f' , '#00dd00' , 17  , 34  , 'bold' ]
let s:N2   = [ '#ffffff' , '#333333' , 255 , 236 , '' ]
let s:N3   = [ '#9cffd3' , '#005500' , 85  , 22  , '' ]
let g:airline#themes#forest#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:NM1  = [ '#ffffff' , '#cc0000' , 255 , 160 , '' ]
let g:airline#themes#forest#palette.normal_modified = {
      \ 'airline_b': s:NM1 ,
      \ 'airline_c': [ '#ccaa00' , '#005500' , 184 , 22  , 'bold' ] ,
      \ 'airline_y': s:NM1 ,
      \ }


let s:I1 = [ '#00005f' , '#ffff00' , 17  , 190 , 'bold' ]
let s:I2 = [ '#ffffff' , '#333333' , 255 , 236 , '' ]
let s:I3 = [ '#9cffd3' , '#888800' , 19  , 142 , '' ]
let g:airline#themes#forest#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#forest#palette.insert_modified = {
      \ 'airline_b': s:NM1 ,
      \ 'airline_c': [ '#9cffd3' , '#888800' , 19  , 142 , 'bold' ] ,
      \ 'airline_y': s:NM1 ,
      \ }
let g:airline#themes#forest#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0]   , '#d78700' , s:I1[2] , 208     , ''     ] ,
      \ 'airline_z': [ s:I1[0]   , '#d78700' , s:I1[2] , 208     , ''     ] ,
      \ }


let g:airline#themes#forest#palette.replace = copy(g:airline#themes#forest#palette.insert)
let g:airline#themes#forest#palette.replace.airline_a = [ s:I2[0]   , '#990099' , s:I2[2] , 90      , ''     ]
let g:airline#themes#forest#palette.replace_modified = g:airline#themes#forest#palette.insert_modified


let s:V1 = [ '#00005f' , '#00aaff' , 17  , 36  , 'bold' ]
let s:V2 = [ '#ffffff' , '#333333' , 255 , 236 , '' ]
let s:V3 = [ '#9cffd3' , '#0066aa' , 85  , 25  , '' ]
let g:airline#themes#forest#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#forest#palette.visual_modified = {
      \ 'airline_b': s:NM1 ,
      \ 'airline_c': [ '#ccaa00' , '#0066aa' , 184 , 25  , 'bold' ] ,
      \ 'airline_y': s:NM1 ,
      \ }


let s:IA1 = [ '#9e9e9e' , '#0f0f0f' , 246 , 232 , 'bold' ]
let s:IA2 = [ '#9e9e9e' , '#1c1c1c' , 246 , 233 , '' ]
let s:IA3 = [ '#9e9e9e' , '#2a2a2a' , 246 , 234 , '' ]
let g:airline#themes#forest#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#forest#palette.inactive_modified = {
      \ 'airline_c': [ '#ccaa00' , '#9e9e9e' , 184 , 240 , 'bold' ] ,
      \ }

" Pour la ligne de buffers en haut.
let g:airline#themes#forest#palette.tabline = {
      \ 'airline_tab':          ['#c8c8c8' , '#005500' , 188 , 22  , '' ],
      \ 'airline_tabsel':       ['#00005f' , '#00cc00' , 17  , 34  , 'bold' ],
      \ 'airline_tabtype':      ['#00005f' , '#00aaff' , 17  , 25  , 'bold' ],
      \ 'airline_tabfill':      ['#c8c8c8' , '#1e1e1e' , 188 , 234 , '' ],
      \ 'airline_tabmod':       ['#1e1e1e' , '#dddd00' , 235 , 220 , 'bold' ],
      \ 'airline_tabhid':       ['#ffffff' , '#444444' , 255 , 238 , '' ],
      \ 'airline_tabmod_unsel': ['#1e1e1e' , '#eeee00' , 235 , 221 , '' ],
      \ }

" Accents are used to give parts within a section a slightly different look or
" color. Here we are defining a "red" accent, which is used by the 'readonly'
" part by default. Only the foreground colors are specified, so the background
" colors are automatically extracted from the underlying section colors. What
" this means is that regardless of which section the part is defined in, it
" will be red instead of the section's foreground color. You can also have
" multiple parts with accents within a section.
let g:airline#themes#forest#palette.accents = {
      \ 'red': [ '#ff0000' , '' , 160 , ''  ]
      \ }


" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded iff the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#forest#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ '#d7d7ff' , '#5f00af' , 189 , 55  , ''     ],
      \ [ '#ffffff' , '#875fd7' , 231 , 98  , ''     ],
      \ [ '#5f00af' , '#ffffff' , 55  , 231 , 'bold' ])
