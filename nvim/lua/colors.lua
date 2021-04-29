local schema = {
  base0         = '#1B2229';
  base1         = '#1c1f24';
  base2         = '#202328';
  base3         = '#23272e';
  base4         = '#3f444a';
  base5         = '#5B6268';
  base6         = '#73797e';
  base7         = '#9ca0a4';
  base8         = '#b1b1b1';

  bg            = '#282c34';
  bg1           = '#504945';
  bg_popup      = '#3E4556';
  bg_highlight  = '#2C323C';
  bg_visual     = '#b3deef';
  fg            = '#c3ccdc';
  currsor_bg    = '#4f5b66';
  none          = 'NONE';

  magenta       = '#d16d9e';
  orange        = '#da8548';
  -- orange        = '#ff7538';
  -- yellow        = '#ffce5c';
  yellow        = '#ffc24b';
  green         = '#98c379';
  cyan          = '#36d0e0';
  blue          = '#61afef';
  violet        = '#c678dd';
  red           = '#e95678';
  teal          = '#1abc9c';
  grey          = '#928374';
  brown         = '#666660';
  purple        = '#ae81ff';
  black         = '#000000';
}
function highlight(group, color)
    local style = color.style and 'gui=' .. color.style or 'gui=NONE'
    local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
    local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
    local sp = color.sp and 'guisp=' .. color.sp or ''
    vim.api.nvim_command('highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg..' '..sp)
end


function load_syntax()
  local syntax = {
    Normal                = { fg=schema.fg,       bg=schema.none };
    Terminal              = { fg=schema.fg,       bg=schema.none };
    SignColumn            = { fg=schema.fg,       bg=schema.none };
    FoldColumn            = { fg=schema.base5,    bg=schema.black };
    VertSplit             = { fg=schema.black,    bg=schema.bg };
    Folded                = { fg=schema.grey,     bg=schema.bg_highlight };
    EndOfBuffer           = { fg=schema.bg,       bg=schema.none};
    IncSearch             = { fg=schema.bg1,      bg=schema.orange,       style=schema.none };
    Search                = { fg=schema.bg,       bg=schema.green };
    ColorColumn           = { fg=schema.none,     bg=schema.bg_highlight };
    Conceal               = { fg=schema.grey,     bg=schema.none};
    Cursor                = { fg=schema.none,     bg=schema.none,         style='reverse'};
    vCursor               = { fg=schema.none,     bg=schema.none,         style='reverse'};
    iCursor               = { fg=schema.none,     bg=schema.none,         style='reverse'};
    lCursor               = { fg=schema.none,     bg=schema.none,         style='reverse'};
    CursorIM              = { fg=schema.none,     bg=schema.none,         style='reverse'};
    CursorColumn          = { fg=schema.none,     bg=schema.bg_highlight, style='underline' };
    CursorLine            = { fg=schema.none,     bg=schema.bg_highlight };
    LineNr                = { fg=schema.base4,    bg=schema.none };
    CursorLineNr          = { fg=schema.blue,     bg=schema.none };
    DiffAdd               = { fg=schema.black,    bg=schema.green };
    DiffChange            = { fg=schema.black,    bg=schema.yellow };
    DiffDelete            = { fg=schema.black,    bg=schema.red };
    DiffText              = { fg=schema.black,    bg=schema.fg };
    Directory             = { fg=schema.bg1,      bg=schema.none};
    -- Directory             = { fg=schema.blue,      bg=schema.none};
    ErrorMsg              = { fg=schema.red,      bg=schema.none,         style='bold'};
    WarningMsg            = { fg=schema.yellow,   bg=schema.none,         style='bold'};
    ModeMsg               = { fg=schema.fg,       bg=schema.none,         style='bold'};
    MatchParen            = { fg=schema.red,      bg=schema.bg_highlight, style='bold,underline'};
    NonText               = { fg=schema.bg1,      bg=schema.none };
    Whitespace            = { fg=schema.base4,    bg=schema.none };
    SpecialKey            = { fg=schema.bg1,      bg=schema.none };
    Pmenu                 = { fg=schema.fg,       bg=schema.bg_popup };
    PmenuSel              = { fg=schema.base0,    bg=schema.blue };
    PmenuSelBold          = { fg=schema.base0,    bg=schema.blue };
    PmenuSbar             = { fg=schema.none,     bg=schema.blue };
    PmenuThumb            = { fg=schema.brown,    bg=schema.brown };
    WildMenu              = { fg=schema.fg,       bg=schema.green };
    Question              = { fg=schema.yellow,   bg=schema.none };
    NormalFloat           = { fg=schema.base8,    bg=schema.bg_highlight };
    TabLineFill           = { fg=schema.none,     bg=schema.none,         style=schema.none};
    TabLineSel            = { fg=schema.blue,     bg=schema.none };
    StatusLine            = { fg=schema.base8,    bg=schema.base2,        style=schema.none};
    StatusLineNC          = { fg=schema.grey,     bg=schema.base2,        style=schema.none};
    SpellBad              = { fg=schema.red,      bg=schema.none,         style='undercurl'};
    SpellCap              = { fg=schema.blue,     bg=schema.none,         style='undercurl'};
    SpellLocal            = { fg=schema.cyan,     bg=schema.none,         style='undercurl'};
    SpellRare             = { fg=schema.violet,   bg=schema.none,         style='undercurl'};
    Visual                = { fg=schema.black,    bg=schema.bg_visual};
    VisualNOS             = { fg=schema.black,    bg=schema.bg_visual};
    QuickFixLine          = { fg=schema.violet,   bg=schema.none,         style='bold' };
    Debug                 = { fg=schema.orange,   bg=schema.none };
    debugBreakpoint       = { fg=schema.bg,       bg=schema.red};

    Boolean               = { fg=schema.orange,   bg=schema.none,         style='italic' };
    Number                = { fg=schema.violet,   bg=schema.none };
    Float                 = { fg=schema.violet,   bg=schema.none };
    PreProc               = { fg=schema.violet,   bg=schema.none };
    PreCondit             = { fg=schema.violet,   bg=schema.none };
    Include               = { fg=schema.purple,   bg=schema.none };
    Define                = { fg=schema.purple,   bg=schema.none };
    Conditional           = { fg=schema.violet,   bg=schema.none };
    Repeat                = { fg=schema.violet,   bg=schema.none };
    Keyword               = { fg=schema.red,      bg=schema.none };
    Typedef               = { fg=schema.red,      bg=schema.none };
    Exception             = { fg=schema.red,      bg=schema.none };
    Statement             = { fg=schema.red,      bg=schema.none };
    Error                 = { fg=schema.red,      bg=schema.none };
    StorageClass          = { fg=schema.orange,   bg=schema.none };
    Tag                   = { fg=schema.orange,   bg=schema.none };
    Label                 = { fg=schema.orange,   bg=schema.none };
    Structure             = { fg=schema.orange,   bg=schema.none };
    Operator              = { fg=schema.magenta,  bg=schema.none };
    Title                 = { fg=schema.orange,   bg=schema.none,         style='bold'};
    Special               = { fg=schema.yellow,   bg=schema.none };
    SpecialChar           = { fg=schema.yellow,   bg=schema.none };
    Type                  = { fg=schema.teal,     bg=schema.none };
    Function              = { fg=schema.yellow,   bg=schema.none };
    String                = { fg=schema.green,    bg=schema.none };
    Character             = { fg=schema.green,    bg=schema.none };
    Constant              = { fg=schema.cyan,     bg=schema.none };
    Macro                 = { fg=schema.cyan,     bg=schema.none };
    Identifier            = { fg=schema.blue,     bg=schema.none };

    Comment               = { fg=schema.base6,    bg=schema.none,         style='italic'};
    SpecialComment        = { fg=schema.grey,     bg=schema.none};
    Todo                  = { fg=schema.violet,   bg=schema.none};
    Delimiter             = { fg=schema.fg,       bg=schema.none};
    Ignore                = { fg=schema.grey,     bg=schema.none};
    Underlined            = { fg=schema.none,     bg=schema.none,         style='underline'};

    GitGutterAdd          = { fg=schema.green,    bg=schema.none};
    GitGutterChange       = { fg=schema.blue,     bg=schema.none};
    GitGutterDelete       = { fg=schema.red,      bg=schema.none};
    GitGutterChangeDelete = { fg=schema.violet,   bg=schema.none};

    NvimTreeFolderName    = { fg=schema.blue,     bg=schema.none};
    NvimTreeRootFolder    = { fg=schema.red,      bg=schema.none,         style='bold' };
    NvimTreeOpenedFolderName = { fg=schema.blue,     bg=schema.none,      style='bold' };

    TSParameter           = { fg=schema.fg,       bg=schema.none };

    -- LspDiagnosticsSignError = {fg=schema.red};
    -- LspDiagnosticsSignWarning = {fg=schema.yellow};
    -- LspDiagnosticsSignInformation = {fg=schema.blue};
    -- LspDiagnosticsSignHint = {fg=schema.cyan};
    --
    -- LspDiagnosticsVirtualTextError = {fg=schema.red};
    -- LspDiagnosticsVirtualTextWarning= {fg=schema.yellow};
    -- LspDiagnosticsVirtualTextInformation = {fg=schema.blue};
    -- LspDiagnosticsVirtualTextHint = {fg=schema.cyan};
    --
    -- LspDiagnosticsUnderlineError = {style="undercurl",sp=schema.red};
    -- LspDiagnosticsUnderlineWarning = {style="undercurl",sp=schema.yellow};
    -- LspDiagnosticsUnderlineInformation = {style="undercurl",sp=schema.blue};
    -- LspDiagnosticsUnderlineHint = {style="undercurl",sp=schema.cyan};
  }
  return syntax
end

function terminal_color() 
  vim.g.terminal_color_0 = schema.bg
  vim.g.terminal_color_1 = schema.red
  vim.g.terminal_color_2 = schema.green
  vim.g.terminal_color_3 = schema.yellow
  vim.g.terminal_color_4 = schema.blue
  vim.g.terminal_color_5 = schema.violet
  vim.g.terminal_color_6 = schema.cyan
  vim.g.terminal_color_7 = schema.bg1
  vim.g.terminal_color_8 = schema.brown
  vim.g.terminal_color_9 = schema.red
  vim.g.terminal_color_10 = schema.green
  vim.g.terminal_color_11 = schema.yellow
  vim.g.terminal_color_12 = schema.blue
  vim.g.terminal_color_13 = schema.violet
  vim.g.terminal_color_14 = schema.cyan
  vim.g.terminal_color_15 = schema.fg
end

function apply()
  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end
  vim.o.background = 'dark'
  vim.o.termguicolors = true

  terminal_color()
  local syntax = load_syntax()

  for group,colors in pairs(syntax) do
    highlight(group,colors)
  end
end

return { apply_colorscheme = apply, schema = schema }
