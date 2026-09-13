-- Port of ~/.vim_runtime/m3_monochrome.vim (Material 3 monochrome, dark).
-- Static: does NOT track the wallpaper. Edit lua/m3_palette.lua to tweak.
-- NERDTree groups ported to their nvim-tree equivalents.

vim.o.background = "dark"
vim.cmd("highlight clear")
if vim.g.syntax_on then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "m3_monochrome"

local p = require("m3_palette")
local fg_dim = p.secondary
local tertiary = p.fg
local sel = p.panel_hi

local function hi(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

-- Editor UI
hi("Normal", { fg = p.fg, bg = p.bg })
hi("NormalFloat", { fg = p.fg, bg = p.panel })
hi("NormalNC", { fg = p.fg, bg = p.bg })
hi("LineNr", { fg = p.faint })
hi("CursorLineNr", { fg = p.primary, bold = true })
hi("CursorLine", { bg = p.panel })
hi("CursorColumn", { bg = p.panel })
hi("ColorColumn", { bg = p.panel })
hi("SignColumn", { fg = p.muted, bg = p.bg })
hi("Visual", { bg = sel })
hi("VisualNOS", { bg = sel })
hi("VertSplit", { fg = p.faint, bg = p.bg })
hi("WinSeparator", { fg = p.faint, bg = p.bg })
hi("Folded", { fg = p.muted, bg = p.panel, italic = true })
hi("FoldColumn", { fg = p.faint, bg = p.bg })
hi("Cursor", { fg = p.bg, bg = p.primary })
hi("lCursor", { fg = p.bg, bg = p.primary })
hi("MatchParen", { fg = p.primary, bg = p.panel_hi, bold = true })
hi("NonText", { fg = p.faint })
hi("SpecialKey", { fg = p.faint })
hi("Whitespace", { fg = p.faint })
hi("Directory", { fg = p.secondary })
hi("Title", { fg = p.primary, bold = true })
hi("Conceal", { fg = p.muted })
hi("EndOfBuffer", { fg = p.bg, bg = p.bg })

-- Statusline / tabs (fallback when lualine is off)
hi("StatusLine", { fg = p.fg, bg = p.panel_hi })
hi("StatusLineNC", { fg = p.muted, bg = p.panel })
hi("WildMenu", { fg = p.on_pri, bg = p.primary, bold = true })
hi("TabLine", { fg = fg_dim, bg = p.panel })
hi("TabLineSel", { fg = p.on_pri, bg = p.primary, bold = true })
hi("TabLineFill", { fg = p.muted, bg = p.bg })

-- Popup menu
hi("Pmenu", { fg = p.fg, bg = p.panel })
hi("PmenuSel", { fg = p.on_pri, bg = p.primary, bold = true })
hi("PmenuSbar", { bg = p.panel_hi })
hi("PmenuThumb", { bg = p.muted })

-- Search / messages
hi("Search", { fg = p.bg, bg = tertiary })
hi("IncSearch", { fg = p.bg, bg = p.primary, bold = true })
hi("CurSearch", { fg = p.bg, bg = p.primary, bold = true })
hi("ErrorMsg", { fg = p.error, bold = true })
hi("WarningMsg", { fg = tertiary, bold = true })
hi("ModeMsg", { fg = fg_dim, bold = true })
hi("MoreMsg", { fg = p.secondary })
hi("Question", { fg = p.secondary })

-- Syntax (muted accent hues; UI elsewhere stays monochrome)
hi("Comment", { fg = p.muted, italic = true })
hi("Constant", { fg = p.num })
hi("String", { fg = p.str })
hi("Character", { fg = p.str })
hi("Number", { fg = p.num })
hi("Boolean", { fg = p.num })
hi("Float", { fg = p.num })
hi("Identifier", { fg = p.fg })
hi("Function", { fg = p.func })
hi("Statement", { fg = p.kw, bold = true })
hi("Conditional", { fg = p.kw, bold = true })
hi("Repeat", { fg = p.kw, bold = true })
hi("Label", { fg = p.kw })
hi("Operator", { fg = fg_dim })
hi("Keyword", { fg = p.kw, bold = true })
hi("Exception", { fg = p.error, bold = true })
hi("PreProc", { fg = p.pre })
hi("Include", { fg = p.pre })
hi("Define", { fg = p.pre })
hi("Macro", { fg = p.pre })
hi("PreCondit", { fg = p.pre })
hi("Type", { fg = p.ty })
hi("StorageClass", { fg = p.ty })
hi("Structure", { fg = p.ty })
hi("Typedef", { fg = p.ty })
hi("Special", { fg = p.special })
hi("SpecialChar", { fg = p.special })
hi("Tag", { fg = p.special })
hi("Delimiter", { fg = fg_dim })
hi("SpecialComment", { fg = p.muted, italic = true })
hi("Debug", { fg = p.error })
hi("Underlined", { fg = p.func, underline = true })
hi("Ignore", { fg = p.faint })
hi("Error", { fg = p.error, bold = true })
hi("Todo", { fg = p.bg, bg = p.num, bold = true })

-- Diagnostics / spelling
hi("SpellBad", { fg = p.error, undercurl = true })
hi("SpellCap", { fg = tertiary, undercurl = true })
hi("SpellRare", { fg = p.secondary, undercurl = true })
hi("SpellLocal", { fg = p.secondary, undercurl = true })

-- Diff
hi("DiffAdd", { fg = p.str, bg = p.panel })
hi("DiffChange", { fg = p.num, bg = p.panel })
hi("DiffDelete", { fg = p.error, bg = p.panel })
hi("DiffText", { fg = p.bg, bg = p.num, bold = true })

-- LSP diagnostics (coc used its own highlight groups; these are the
-- native-LSP equivalents, kept in the same accent colors)
hi("DiagnosticError", { fg = p.error })
hi("DiagnosticWarn", { fg = p.num })
hi("DiagnosticInfo", { fg = p.func })
hi("DiagnosticHint", { fg = p.ty })
hi("DiagnosticUnderlineError", { undercurl = true, sp = p.error })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = p.num })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = p.func })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = p.ty })
hi("LspReferenceText", { bg = p.panel_hi })
hi("LspReferenceRead", { bg = p.panel_hi })
hi("LspReferenceWrite", { bg = p.panel_hi })

-- nvim-tree (was NERDTree)
hi("NvimTreeFolderName", { fg = p.secondary, bold = true })
hi("NvimTreeOpenedFolderName", { fg = p.secondary, bold = true })
hi("NvimTreeEmptyFolderName", { fg = p.muted })
hi("NvimTreeFolderIcon", { fg = p.muted })
hi("NvimTreeIndentMarker", { fg = p.faint })
hi("NvimTreeNormal", { fg = p.fg, bg = p.panel })
hi("NvimTreeNormalNC", { fg = p.fg, bg = p.panel })
hi("NvimTreeWinSeparator", { fg = p.faint, bg = p.panel })
hi("NvimTreeRootFolder", { fg = p.primary, bold = true })
hi("NvimTreeExecFile", { fg = tertiary })
hi("NvimTreeSpecialFile", { fg = p.special, underline = true })
hi("NvimTreeGitDirty", { fg = p.num })
hi("NvimTreeGitNew", { fg = p.str })
hi("NvimTreeGitDeleted", { fg = p.error })

-- :terminal ANSI palette
vim.g.terminal_color_0 = p.panel
vim.g.terminal_color_1 = p.error
vim.g.terminal_color_2 = p.primary
vim.g.terminal_color_3 = p.secondary
vim.g.terminal_color_4 = p.fg
vim.g.terminal_color_5 = p.secondary
vim.g.terminal_color_6 = p.secondary
vim.g.terminal_color_7 = p.fg
vim.g.terminal_color_8 = p.muted
vim.g.terminal_color_9 = p.error
vim.g.terminal_color_10 = p.primary
vim.g.terminal_color_11 = p.secondary
vim.g.terminal_color_12 = p.fg
vim.g.terminal_color_13 = p.secondary
vim.g.terminal_color_14 = p.secondary
vim.g.terminal_color_15 = p.fg
