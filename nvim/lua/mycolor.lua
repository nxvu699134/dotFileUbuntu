local u = require('utils')

local function make_schema() 
  local colors = {
    none    = 'NONE';
    -- core colors
     orange = '#f79617';
     yellow = '#ffc24b';
     green  = '#84CE5C';
     cyan   = '#50EAFA';
     blue   = '#32b4ff';
     red    = '#ff3c41';
     teal   = '#23D4AC';
     purple = '#a884f3';

     gray0   = '#000111';
     gray1   = '#171831'; --base
     gray2   = '#31324B';
     gray3   = '#4A4B64';
     gray4   = '#64657E';
     gray5   = '#7D7E97';
     gray6   = '#9697B0';
     gray7   = '#B0B1CA';
     gray8   = '#CACBE4';
     gray9   = '#E3E4FD';
     gray10  = '#FCFDFF';

    --extended colors
    red1    = '#ff3b30';
    yellow1 = '#ffcc00';
    blue1   = '#5ac8fa';
  }

  colors.diag = {
    danger  = { fg = colors.red1;    bg = u.rgba_to_rgb(colors.red1, colors.gray1, 0.16) };
    warning = { fg = colors.yellow1; bg = u.rgba_to_rgb(colors.yellow1, colors.gray1, 0.16) };
    info    = { fg = colors.blue1;   bg = u.rgba_to_rgb(colors.blue1, colors.gray1, 0.16) };
    hint    = { fg = colors.blue1;   bg = u.rgba_to_rgb(colors.blue1, colors.gray1, 0.16) };
  };

  colors.bg            = colors.gray1;
  colors.bg_popup      = u.rgba_to_rgb(colors.purple, colors.bg, 0.2);
  colors.bg_popup_sel  = u.rgba_to_rgb(colors.purple, colors.bg_popup, 0.8);
  colors.bg_highlight  = u.rgba_to_rgb(colors.blue, colors.gray1, 0.3);
  colors.bg_visual     = u.rgba_to_rgb(colors.blue, colors.gray1, 0.4);
  colors.fg            = colors.gray9;
  colors.fg_disabled   = colors.gray4;
  colors.fg_invert     = colors.gray0;
  colors.fg_popup      = colors.gray9;

  return colors;
end

local schema = make_schema();


local function must_syntax()
  local syntax = {
    Normal        = { fg=schema.fg,             bg=schema.none };
    Terminal      = { fg=schema.fg,             bg=schema.none };
    SignColumn    = { fg=schema.fg,             bg=schema.none };
    FoldColumn    = { fg=schema.fg_disabled,    bg=schema.none };
    VertSplit     = { fg=schema.gray4,          bg=schema.none };
    Folded        = { fg=schema.gray3,          bg=schema.bg_highlight };
    EndOfBuffer   = { fg=schema.bg,             bg=schema.none};
    IncSearch     = { fg=schema.fg_invert,      bg=schema.orange  };
    Search        = { bg=schema.bg_visual };
    Visual        = { bg=schema.bg_visual};
    VisualNOS     = { bg=schema.bg_visual};
    ColorColumn   = { fg=schema.none,       bg=schema.bg_highlight };
    Conceal       = { fg=schema.gray3,      bg=schema.none};
    Cursor        = { fg=schema.fg_invert,  bg=schema.gray7,        };
    lCursor       = { fg=schema.fg_invert,  bg=schema.gray7,        };
    CursorIM      = { fg=schema.fg_invert,  bg=schema.gray7,        };
    CursorColumn  = { fg=schema.none,       bg=schema.bg_highlight, style='underline' };
    CursorLine    = { fg=schema.none,       bg=schema.bg_highlight };
    LineNr        = { fg=schema.gray2,      bg=schema.none }; 
    CursorLineNr  = { fg=schema.orange,     bg=schema.none, style="bold" };
    DiffAdd       = { fg=schema.fg_invert,    bg=schema.green };
    DiffChange    = { fg=schema.fg_invert,    bg=schema.yellow };
    DiffDelete    = { fg=schema.fg_invert,    bg=schema.red };
    DiffText      = { fg=schema.fg_invert,    bg=schema.fg };
    Directory     = { fg=schema.blue,         bg=schema.none};
    ErrorMsg      = { fg=schema.red,      bg=schema.none,         style='bold'};
    WarningMsg    = { fg=schema.yellow,   bg=schema.none,         style='bold'};
    ModeMsg       = { fg=schema.fg,       bg=schema.none,         style='bold'};
    MatchParen    = { fg=schema.orange,   bg=schema.none,         style='bold'};
    NonText       = { fg=schema.fg_disabled,      bg=schema.none };
    Whitespace    = { fg=schema.gray2,    bg=schema.none };
    SpecialKey    = { fg=schema.fg_disabled,      bg=schema.none };
    Pmenu         = { fg=schema.fg_popup,       bg=schema.bg_popup };
    PmenuSel      = { fg=schema.fg_popup,       bg=schema.bg_popup_sel },
    PmenuSbar     = { bg=schema.bg_popup },
    PmenuThumb    = { bg=schema.bg_popup_sel },
    NormalFloat   = { fg=schema.fg,bg=schema.bg_popup };
    WildMenu      = { fg=schema.fg,       bg=schema.green };
    Question      = { fg=schema.yellow,   bg=schema.none };
    StatusLine    = { fg=schema.fg,       bg=schema.none };-- status line of current window
    StatusLineNC  = { fg=schema.fg,       bg=schema.none };-- status lines of not-current windows
    SpellBad      = { fg=schema.red,      bg=schema.none,         style='undercurl'};
    SpellCap      = { fg=schema.blue,     bg=schema.none,         style='undercurl'};
    SpellLocal    = { fg=schema.cyan,     bg=schema.none,         style='undercurl'};
    SpellRare     = { fg=schema.purple,   bg=schema.none,         style='undercurl'};
    QuickFixLine  = { fg=schema.purple,   bg=schema.none,         style='bold' };
    Debug         = { fg=schema.orange,   bg=schema.none };

    Boolean       = { fg=schema.orange,   bg=schema.none,         style='italic' };
    Number        = { fg=schema.purple,   bg=schema.none };
    Float         = { fg=schema.purple,   bg=schema.none };
    PreProc       = { fg=schema.purple,   bg=schema.none };
    PreCondit     = { fg=schema.purple,   bg=schema.none };
    Include       = { fg=schema.purple,   bg=schema.none };
    Define        = { fg=schema.purple,   bg=schema.none };
    Conditional   = { fg=schema.purple,   bg=schema.none };
    Repeat        = { fg=schema.purple,   bg=schema.none };
    Keyword       = { fg=schema.red,      bg=schema.none };
    Typedef       = { fg=schema.red,      bg=schema.none };
    Exception     = { fg=schema.red,      bg=schema.none };
    Statement     = { fg=schema.red,      bg=schema.none };
    Error         = { fg=schema.red,      bg=schema.none };
    StorageClass  = { fg=schema.orange,   bg=schema.none };
    Tag           = { fg=schema.orange,   bg=schema.none };
    Label         = { fg=schema.orange,   bg=schema.none };
    Structure     = { fg=schema.orange,   bg=schema.none };
    Operator      = { fg=schema.purple,   bg=schema.none };
    Title         = { fg=schema.orange,   bg=schema.none,         style='bold'};
    Special       = { fg=schema.yellow,   bg=schema.none };
    SpecialChar   = { fg=schema.yellow,   bg=schema.none };
    Type          = { fg=schema.teal,     bg=schema.none };
    Function      = { fg=schema.yellow,   bg=schema.none };
    String        = { fg=schema.green,    bg=schema.none };
    Character     = { fg=schema.green,    bg=schema.none };
    Constant      = { fg=schema.cyan,     bg=schema.none };
    Macro         = { fg=schema.cyan,     bg=schema.none };
    Identifier    = { fg=schema.blue,     bg=schema.none };

    Comment       = { fg=schema.fg_disabled,    bg=schema.none,         style='italic'};
    SpecialComment= { fg=schema.gray3,          bg=schema.none};
    Todo          = { fg=schema.cyan,           bg=schema.none};
    Delimiter     = { fg=schema.fg,             bg=schema.none};
    Ignore        = { fg=schema.gray3,          bg=schema.none};
    Underlined    = { fg=schema.none,           bg=schema.none,         style='underline'};

    TSParameter   = { fg=schema.fg,       bg=schema.none };
  }
  return syntax
end

local function addition_syntax()
  local syntax = {
    NvimTreeFolderName    = { fg=schema.blue,     bg=schema.none};
    NvimTreeRootFolder    = { fg=schema.red,      bg=schema.none,         style='bold' };
    NvimTreeOpenedFolderName = { fg=schema.blue,  bg=schema.none,      style='bold' };

    LspReferenceRead      = { fg=schema.none,     bg=schema.bg_highlight, style='bold' };
    LspReferenceWrite     = { fg=schema.none,     bg=schema.bg_highlight, style='bold' };
    LspReferenceText      = { fg=schema.none,     bg=schema.bg_highlight, style='bold' };

    LspDiagnosticsSignError               = { fg=schema.diag.danger.fg,   style='bold'};
    LspDiagnosticsSignWarning             = { fg=schema.diag.warning.fg,  style='bold'};
    LspDiagnosticsSignInformation         = { fg=schema.diag.info.fg,     style='bold'};
    LspDiagnosticsSignHint                = { fg=schema.diag.hint.fg,     style='bold'};

    LspDiagnosticsVirtualTextError        = { fg=schema.diag.danger.fg,   bg=schema.diag.danger.bg,   style='bold'};
    LspDiagnosticsVirtualTextWarning      = { fg=schema.diag.warning.fg,  bg=schema.diag.warning.bg,  style='bold' };
    LspDiagnosticsVirtualTextInfomation   = { fg=schema.diag.info.fg,     bg=schema.diag.info.bg,     style='bold'};
    LspDiagnosticsVirtualTextHint         = { fg=schema.diag.hint.fg,     bg=schema.diag.hint.bg,     style='bold'};

    LspDiagnosticsUnderlineError          = { fg=schema.diag.danger.fg,   bg=schema.diag.danger.bg,   style='undercurl,bold'};
    LspDiagnosticsUnderlineWarning        = { fg=schema.diag.warning.fg,  bg=schema.diag.warning.bg,  style='undercurl,bold'};
    LspDiagnosticsUnderlineInformation    = { fg=schema.diag.info.fg,     bg=schema.diag.info.bg,     style='undercurl,bold'};
    LspDiagnosticsUnderlineHint           = { fg=schema.diag.hint.fg,     bg=schema.diag.hint.bg,     style='undercurl,bold'};

    LspDiagnosticsDefaultError          = { fg=schema.diag.danger.fg, };
    LspDiagnosticsDefaultWarning        = { fg=schema.diag.warning.fg,};
    LspDiagnosticsDefaultInformation    = { fg=schema.diag.info.fg,   };
    LspDiagnosticsDefaultHint           = { fg=schema.diag.hint.fg,   };

    CocErrorHighlight   = { fg=schema.diag.danger.fg,     bg=schema.diag.danger.bg,   style='undercurl,bold'};
    CocWarningHighlight = { fg=schema.diag.warning.fg,    bg=schema.diag.warning.bg,  style='undercurl,bold'};
    CocInfoHighlight    = { fg=schema.diag.info.fg,       bg=schema.diag.info.bg,     style='undercurl,bold'};
    CocHintHighlight    = { fg=schema.diag.hint.fg,       bg=schema.diag.hint.bg,     style='undercurl,bold'};

    CocHighlightRead      = { fg=schema.none,     bg=schema.bg_highlight, style='bold' };
    CocHighlightWrite     = { fg=schema.none,     bg=schema.bg_highlight, style='bold' };
    CocHighlightText      = { fg=schema.none,     bg=schema.bg_highlight, style='bold' };

    CocErrorSign      = { fg=schema.diag.danger.fg,   style='bold'};
    CocWarningSign    = { fg=schema.diag.warning.fg,  style='bold'};
    CocInfoSign       = { fg=schema.diag.info.fg,     style='bold'};
    CocHintSign       = { fg=schema.diag.hint.fg,     style='bold'};

    StartifyPath      = { fg=schema.fg_disabled },

    GitSignsAdd          = { fg=schema.green,    bg=schema.none};
    GitSignsChange       = { fg=schema.blue,     bg=schema.none};
    GitSignsDelete       = { fg=schema.red,      bg=schema.none};

    StatusLineBg                = {bg=schema.gray2 },
    StatusLineMode              = {fg=schema.gray0,  bg=schema.purple, style='bold' },
    StatusLineFileName          = {fg=schema.gray10,  bg=schema.gray3},
    StatusLineLspError          = {fg=schema.diag.danger.fg, bg=schema.gray2 },
    StatusLineLspWarn           = {fg=schema.diag.warning.fg,  bg=schema.gray2},
    StatusLineLspInfo           = {fg=schema.diag.info.fg,  bg=schema.gray2 },
    StatusLineInactiveFileName  = {fg=schema.gray5, bg=schema.gray2 },
  }
  return syntax
end


local async_load
async_load = vim.loop.new_async(
  vim.schedule_wrap(
    function()
      local addition_syntax = addition_syntax()
      for group,colors in pairs(addition_syntax) do
        u.highlight(group, colors)
      end
      async_load:close()
    end
  )
)

local function setup()
  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end
  vim.o.background = 'dark'
  vim.o.termguicolors = true

  local must_syntax = must_syntax()

  for group, colors in pairs(must_syntax) do
    u.highlight(group, colors)
  end

  async_load:send()
end

return { schema = schema; setup = setup; }
