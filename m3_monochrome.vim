" ============================================================================
" m3_monochrome  —  hardcoded Material 3 monochrome (dark) colorscheme.
" Static: does NOT track the wallpaper. Edit the hex values below to tweak.
" Sourced from ~/.vim_runtime/my_configs.vim.
" ============================================================================

" --- Palette (hardcoded M3 monochrome tones) --------------------------------
let s:bg       = '#131313'
let s:panel    = '#1f1f1f'
let s:panel_hi = '#2a2a2a'
let s:float    = '#353535'
let s:faint    = '#474747'
let s:muted    = '#919191'
let s:secondary= '#c6c6c6'
let s:fg       = '#e2e2e2'
let s:primary  = '#ffffff'
let s:on_pri   = '#1b1b1b'
let s:error    = '#ffb4ab'
let s:fg_dim   = s:secondary
let s:accent   = s:secondary
let s:tertiary = s:fg
let s:sel      = s:panel_hi
let s:bg_dim   = s:bg

" --- Muted accent hues for syntax (UI stays monochrome; only tokens coloured) -
let s:kw       = '#b3a0d0'   " keywords    - muted purple
let s:func     = '#8fb0d0'   " functions   - soft blue
let s:str      = '#9fc0a0'   " strings     - soft green
let s:num      = '#d0bd90'   " numbers/consts - soft amber
let s:type     = '#90c4c0'   " types       - soft teal
let s:special  = '#c9a5c8'   " special     - muted mauve
let s:pre      = '#d0a898'   " preproc     - soft terracotta

" --- Boilerplate ------------------------------------------------------------
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'm3_monochrome'

function! s:hi(group, fg, bg, attr) abort
  let l:cmd = 'hi ' . a:group
  let l:cmd .= ' guifg=' . (empty(a:fg) ? 'NONE' : a:fg)
  let l:cmd .= ' guibg=' . (empty(a:bg) ? 'NONE' : a:bg)
  let l:cmd .= ' gui='   . (empty(a:attr) ? 'NONE' : a:attr)
  let l:cmd .= ' cterm=' . (empty(a:attr) ? 'NONE' : a:attr)
  execute l:cmd
endfunction

" --- Editor UI --------------------------------------------------------------
call s:hi('Normal',        s:fg,       s:bg,       '')
call s:hi('NormalFloat',   s:fg,       s:panel,    '')
call s:hi('NormalNC',      s:fg,       s:bg,       '')
call s:hi('LineNr',        s:faint,    '',         '')
call s:hi('CursorLineNr',  s:primary,  '',         'bold')
call s:hi('CursorLine',    '',         s:panel,    '')
call s:hi('CursorColumn',  '',         s:panel,    '')
call s:hi('ColorColumn',   '',         s:panel,    '')
call s:hi('SignColumn',    s:muted,    s:bg,       '')
call s:hi('Visual',        '',         s:sel,      '')
call s:hi('VisualNOS',     '',         s:sel,      '')
call s:hi('VertSplit',     s:faint,    s:bg,       '')
call s:hi('WinSeparator',  s:faint,    s:bg,       '')
call s:hi('Folded',        s:muted,    s:panel,    'italic')
call s:hi('FoldColumn',    s:faint,    s:bg,       '')
call s:hi('Cursor',        s:bg,       s:primary,  '')
call s:hi('lCursor',       s:bg,       s:primary,  '')
call s:hi('MatchParen',    s:primary,  s:panel_hi, 'bold')
call s:hi('NonText',       s:faint,    '',         '')
call s:hi('SpecialKey',    s:faint,    '',         '')
call s:hi('Whitespace',    s:faint,    '',         '')
call s:hi('Directory',     s:secondary,'',         '')
call s:hi('Title',         s:primary,  '',         'bold')
call s:hi('Conceal',       s:muted,    '',         '')
call s:hi('EndOfBuffer',   s:bg,       s:bg,       '')

" --- Statusline / tabs (fallback when lightline is off) ---------------------
call s:hi('StatusLine',    s:fg,       s:panel_hi, '')
call s:hi('StatusLineNC',  s:muted,    s:panel,    '')
call s:hi('WildMenu',      s:on_pri,   s:primary,  'bold')
call s:hi('TabLine',       s:fg_dim,   s:panel,    '')
call s:hi('TabLineSel',    s:on_pri,   s:primary,  'bold')
call s:hi('TabLineFill',   s:muted,    s:bg_dim,   '')

" --- Popup menu -------------------------------------------------------------
call s:hi('Pmenu',         s:fg,       s:panel,    '')
call s:hi('PmenuSel',      s:on_pri,   s:primary,  'bold')
call s:hi('PmenuSbar',     '',         s:panel_hi, '')
call s:hi('PmenuThumb',    '',         s:muted,    '')

" --- Search / messages ------------------------------------------------------
call s:hi('Search',        s:bg,       s:tertiary, '')
call s:hi('IncSearch',     s:bg,       s:primary,  'bold')
call s:hi('CurSearch',     s:bg,       s:primary,  'bold')
call s:hi('ErrorMsg',      s:error,    '',         'bold')
call s:hi('WarningMsg',    s:tertiary, '',         'bold')
call s:hi('ModeMsg',       s:fg_dim,   '',         'bold')
call s:hi('MoreMsg',       s:secondary,'',         '')
call s:hi('Question',      s:secondary,'',         '')

" --- Syntax (muted accent hues; UI elsewhere stays monochrome) --------------
call s:hi('Comment',       s:muted,    '',         'italic')
call s:hi('Constant',      s:num,      '',         '')
call s:hi('String',        s:str,      '',         '')
call s:hi('Character',     s:str,      '',         '')
call s:hi('Number',        s:num,      '',         '')
call s:hi('Boolean',       s:num,      '',         '')
call s:hi('Float',         s:num,      '',         '')
call s:hi('Identifier',    s:fg,       '',         '')
call s:hi('Function',      s:func,     '',         '')
call s:hi('Statement',     s:kw,       '',         'bold')
call s:hi('Conditional',   s:kw,       '',         'bold')
call s:hi('Repeat',        s:kw,       '',         'bold')
call s:hi('Label',         s:kw,       '',         '')
call s:hi('Operator',      s:fg_dim,   '',         '')
call s:hi('Keyword',       s:kw,       '',         'bold')
call s:hi('Exception',     s:error,    '',         'bold')
call s:hi('PreProc',       s:pre,      '',         '')
call s:hi('Include',       s:pre,      '',         '')
call s:hi('Define',        s:pre,      '',         '')
call s:hi('Macro',         s:pre,      '',         '')
call s:hi('PreCondit',     s:pre,      '',         '')
call s:hi('Type',          s:type,     '',         '')
call s:hi('StorageClass',  s:type,     '',         '')
call s:hi('Structure',     s:type,     '',         '')
call s:hi('Typedef',       s:type,     '',         '')
call s:hi('Special',       s:special,  '',         '')
call s:hi('SpecialChar',   s:special,  '',         '')
call s:hi('Tag',           s:special,  '',         '')
call s:hi('Delimiter',     s:fg_dim,   '',         '')
call s:hi('SpecialComment',s:muted,    '',         'italic')
call s:hi('Debug',         s:error,    '',         '')
call s:hi('Underlined',    s:func,     '',         'underline')
call s:hi('Ignore',        s:faint,    '',         '')
call s:hi('Error',         s:error,    '',         'bold')
call s:hi('Todo',          s:bg,       s:num,      'bold')

" --- Diagnostics / spelling -------------------------------------------------
call s:hi('SpellBad',      s:error,    '',         'undercurl')
call s:hi('SpellCap',      s:tertiary, '',         'undercurl')
call s:hi('SpellRare',     s:secondary,'',         'undercurl')
call s:hi('SpellLocal',    s:secondary,'',         'undercurl')

" --- Diff -------------------------------------------------------------------
call s:hi('DiffAdd',       s:str,      s:panel,    '')
call s:hi('DiffChange',    s:num,      s:panel,    '')
call s:hi('DiffDelete',    s:error,    s:panel,    '')
call s:hi('DiffText',      s:bg,       s:num,      'bold')

" --- NERDTree ---------------------------------------------------------------
call s:hi('NERDTreeDir',       s:secondary, '', 'bold')
call s:hi('NERDTreeDirSlash',  s:muted,     '', '')
call s:hi('NERDTreeOpenable',  s:muted,     '', '')
call s:hi('NERDTreeClosable',  s:muted,     '', '')
call s:hi('NERDTreeFile',      s:fg,        '', '')
call s:hi('NERDTreeExecFile',  s:tertiary,  '', '')
call s:hi('NERDTreeCWD',       s:primary,   '', 'bold')

" --- :terminal ANSI palette -------------------------------------------------
let g:terminal_ansi_colors = [
      \ s:panel,   s:error,    s:primary,  s:secondary,
      \ s:fg,      s:secondary,s:secondary,s:fg,
      \ s:muted,   s:error,    s:primary,  s:secondary,
      \ s:fg,      s:secondary,s:secondary,s:fg ]

" --- lightline palette ------------------------------------------------------
" Each color is a [gui_hex, cterm_number] pair; each cell is [fg_pair, bg_pair].
" (This is the format lightline#colorscheme#flatten expects.)
let g:lightline = get(g:, 'lightline', {})
let g:lightline.colorscheme = 'm3_monochrome'
try
  let s:c_bg     = [ s:bg,        233 ]
  let s:c_panel  = [ s:panel,     234 ]
  let s:c_panelh = [ s:panel_hi,  235 ]
  let s:c_muted  = [ s:muted,     246 ]
  let s:c_sec    = [ s:secondary, 251 ]
  let s:c_fg     = [ s:fg,        253 ]
  let s:c_pri    = [ s:primary,   231 ]
  let s:c_onpri  = [ s:on_pri,    234 ]
  let s:c_err    = [ s:error,     210 ]
  let s:pal = {'normal':{}, 'inactive':{}, 'insert':{}, 'replace':{}, 'visual':{}, 'tabline':{}}
  let s:pal.normal.left     = [ [ s:c_onpri, s:c_pri ], [ s:c_fg, s:c_panel ] ]
  let s:pal.normal.right    = [ [ s:c_fg, s:c_panelh ], [ s:c_muted, s:c_panel ] ]
  let s:pal.normal.middle   = [ [ s:c_muted, s:c_panel ] ]
  let s:pal.normal.error    = [ [ s:c_onpri, s:c_err ] ]
  let s:pal.normal.warning  = [ [ s:c_bg, s:c_fg ] ]
  let s:pal.insert.left     = [ [ s:c_bg, s:c_fg ], [ s:c_fg, s:c_panel ] ]
  let s:pal.insert.right    = [ [ s:c_fg, s:c_panelh ], [ s:c_muted, s:c_panel ] ]
  let s:pal.insert.middle   = [ [ s:c_muted, s:c_panel ] ]
  let s:pal.replace.left    = [ [ s:c_onpri, s:c_err ], [ s:c_fg, s:c_panel ] ]
  let s:pal.replace.right   = [ [ s:c_fg, s:c_panelh ], [ s:c_muted, s:c_panel ] ]
  let s:pal.replace.middle  = [ [ s:c_muted, s:c_panel ] ]
  let s:pal.visual.left     = [ [ s:c_bg, s:c_sec ], [ s:c_fg, s:c_panel ] ]
  let s:pal.visual.right    = [ [ s:c_fg, s:c_panelh ], [ s:c_muted, s:c_panel ] ]
  let s:pal.visual.middle   = [ [ s:c_muted, s:c_panel ] ]
  let s:pal.inactive.left   = [ [ s:c_muted, s:c_panel ], [ s:c_muted, s:c_panel ] ]
  let s:pal.inactive.right  = [ [ s:c_muted, s:c_panel ], [ s:c_muted, s:c_panel ] ]
  let s:pal.inactive.middle = [ [ s:c_muted, s:c_panel ] ]
  let s:pal.tabline.left    = [ [ s:c_muted, s:c_panel ] ]
  let s:pal.tabline.tabsel  = [ [ s:c_onpri, s:c_pri ] ]
  let s:pal.tabline.middle  = [ [ s:c_muted, s:c_panel ] ]
  let s:pal.tabline.right   = [ [ s:c_muted, s:c_panel ] ]
  let g:lightline#colorscheme#m3_monochrome#palette = lightline#colorscheme#flatten(s:pal)
  if exists('*lightline#init')
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  endif
catch
  " lightline unavailable — editor colors still apply.
endtry
