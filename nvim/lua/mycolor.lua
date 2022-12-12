local u = require('utils')

function reverse(t)
  local ret = {}
  local n = #t
  local i = 1
  for i = 0, n-1 do
    ret[i+1] = t[n-i]
  end
  return ret
end

local function make_schema(light)
  local base_gray = {
    u.hsl_to_hex(236, 41, 8),
    u.hsl_to_hex(238, 44, 14), --base
    u.hsl_to_hex(236, 39, 23),
    u.hsl_to_hex(237, 34, 30),
    u.hsl_to_hex(235, 28, 39),
    u.hsl_to_hex(236, 22, 49),
    u.hsl_to_hex(235, 23, 60),
    u.hsl_to_hex(235, 27, 70),
    u.hsl_to_hex(237, 31, 80),
    u.hsl_to_hex(235, 33, 89),
    u.hsl_to_hex(235, 36, 96),
  }

  local colors = {
    none    = 'NONE',
    -- core colors
    orange = light and u.hsl_to_hex(32 , 98, 42) or u.hsl_to_hex(34 , 93, 53),
    yellow = light and u.hsl_to_hex(42 , 80, 28) or u.hsl_to_hex(40 , 99, 65),
    green  = light and u.hsl_to_hex(102, 74, 32) or u.hsl_to_hex(99 , 54, 58),
    cyan   = light and u.hsl_to_hex(184, 81, 36) or u.hsl_to_hex(186, 94, 65),
    blue   = light and u.hsl_to_hex(205, 76, 46) or u.hsl_to_hex(202, 99, 60),
    red    = light and u.hsl_to_hex(350, 84, 42) or u.hsl_to_hex(358, 92, 62),
    teal   = light and u.hsl_to_hex(168, 80, 30) or u.hsl_to_hex(166, 72, 48),
    purple = light and u.hsl_to_hex(259, 70, 54) or u.hsl_to_hex(259, 82, 74),

    gray = light and reverse(base_gray) or base_gray
  }

  colors.bg            =  colors.gray[2]
  colors.bg_popup      =  colors.gray[3]
  colors.bg_popup_sel  =  colors.gray[5]
  colors.bg_highlight  =  u.rgba_to_rgb(colors.blue,    colors.bg,     0.3)
  colors.bg_visual     =  u.rgba_to_rgb(colors.blue,    colors.bg,     0.4)
  colors.fg            =  colors.gray[10]
  colors.fg_disabled   =  colors.gray[5]
  colors.fg_invert     =  colors.gray[1]
  colors.fg_popup      =  colors.gray[10]

  colors.diag = {
    danger   =  {  fg  =  colors.red,     bg  =  u.rgba_to_rgb(colors.red,     colors.bg,  0.16)  },
    warning  =  {  fg  =  colors.yellow,  bg  =  u.rgba_to_rgb(colors.yellow,  colors.bg,  0.16)  },
    info     =  {  fg  =  colors.blue,    bg  =  u.rgba_to_rgb(colors.blue,    colors.bg,  0.16)  },
    hint     =  {  fg  =  colors.gray[10],    bg  =  u.rgba_to_rgb(colors.gray[10], colors.bg,  0.16)  },
  };


  return colors;
end

local schema = make_schema(false);


local function syntax()
  local syntax = {
    Normal                      =  {  fg=schema.fg,                    bg=schema.none              },
    Terminal                    =  {  fg=schema.fg,                    bg=schema.none              },
    SignColumn                  =  {  fg=schema.fg,                    bg=schema.none              },
    FoldColumn                  =  {  fg=schema.fg_disabled,           bg=schema.none              },
    VertSplit                   =  {  fg=schema.gray[5],               bg=schema.none              },
    Folded                      =  {  fg=schema.gray[4],               bg=schema.bg_highlight      },
    EndOfBuffer                 =  {  fg=schema.bg,                    bg=schema.none              },
    IncSearch                   =  {  fg=schema.fg_invert,             bg=schema.orange            },
    Search                      =  {  bg=schema.bg_visual              },
    Visual                      =  {  bg=schema.bg_visual              },
    VisualNOS                   =  {  bg=schema.bg_visual              },
    ColorColumn                 =  {  fg=schema.none,                  bg=schema.bg_highlight      },
    Conceal                     =  {  fg=schema.gray[4],               bg=schema.none              },
    Cursor                      =  {  fg=schema.fg_invert,             bg=schema.gray[8],            },
    lCursor                     =  {  fg=schema.fg_invert,             bg=schema.gray[8],            },
    CursorIM                    =  {  fg=schema.fg_invert,             bg=schema.gray[8],            },
    CursorColumn                =  {  fg=schema.none,                  bg=schema.bg_highlight,     style='underline'       },
    CursorLine                  =  {  fg=schema.none,                  bg=schema.bg_highlight      },
    LineNr                      =  {  fg=schema.gray[3],               bg=schema.none              },
    CursorLineNr                =  {  fg=schema.orange,                bg=schema.none,             style="bold"            },
    DiffAdd                     =  {  fg=schema.fg_invert,             bg=schema.green             },
    DiffChange                  =  {  fg=schema.fg_invert,             bg=schema.yellow            },
    DiffDelete                  =  {  fg=schema.fg_invert,             bg=schema.red               },
    DiffText                    =  {  fg=schema.fg_invert,             bg=schema.fg                },
    Directory                   =  {  fg=schema.blue,                  bg=schema.none              },
    ErrorMsg                    =  {  fg=schema.red,                   bg=schema.none,             style='bold'            };
    WarningMsg                  =  {  fg=schema.yellow,                bg=schema.none,             style='bold'            };
    ModeMsg                     =  {  fg=schema.fg,                    bg=schema.none,             style='bold'            };
    MatchParen                  =  {  fg=schema.orange,                bg=schema.none,             style='bold'            };
    NonText                     =  {  fg=schema.fg_disabled,           bg=schema.none              };
    Whitespace                  =  {  fg=schema.gray[3],               bg=schema.none              };
    SpecialKey                  =  {  fg=schema.fg_disabled,           bg=schema.none              };
    Pmenu                       =  {  fg=schema.fg_popup,              bg=schema.bg_popup          };
    PmenuSel                    =  {  fg=schema.fg_popup,              bg=schema.bg_popup_sel      },
    PmenuSbar                   =  {  bg=schema.bg_popup               },
    PmenuThumb                  =  {  bg=schema.bg_popup_sel           },
    NormalFloat                 =  {  fg=schema.fg,bg=schema.bg_popup  };
    WildMenu                    =  {  fg=schema.fg,                    bg=schema.green             };
    Question                    =  {  fg=schema.yellow,                bg=schema.none              };
    StatusLine                  =  {  fg=schema.fg,                    bg=schema.none,             style='bold'            };--  status  line   of  current      window
    StatusLineNC                =  {  fg=schema.fg,                    bg=schema.bg,             style='bold'            };--  status  lines  of  not-current  windows
    SpellBad                    =  {  fg=schema.red,                   bg=schema.none,             style='undercurl'       };
    SpellCap                    =  {  fg=schema.blue,                  bg=schema.none,             style='undercurl'       };
    SpellLocal                  =  {  fg=schema.cyan,                  bg=schema.none,             style='undercurl'       };
    SpellRare                   =  {  fg=schema.purple,                bg=schema.none,             style='undercurl'       };
    QuickFixLine                =  {  fg=schema.purple,                bg=schema.none,             style='bold'            };
    Debug                       =  {  fg=schema.orange,                bg=schema.none              };

    Boolean                     =  {  fg=schema.orange,                bg=schema.none,             style='italic'          };
    Number                      =  {  fg=schema.purple,                bg=schema.none              };
    Float                       =  {  fg=schema.purple,                bg=schema.none              };
    PreProc                     =  {  fg=schema.purple,                bg=schema.none              };
    PreCondit                   =  {  fg=schema.purple,                bg=schema.none              };
    Include                     =  {  fg=schema.purple,                bg=schema.none              };
    Define                      =  {  fg=schema.purple,                bg=schema.none              };
    Conditional                 =  {  fg=schema.purple,                bg=schema.none              };
    Repeat                      =  {  fg=schema.purple,                bg=schema.none              };
    Keyword                     =  {  fg=schema.red,                   bg=schema.none,             style='italic'          };
    Typedef                     =  {  fg=schema.red,                   bg=schema.none              };
    Exception                   =  {  fg=schema.red,                   bg=schema.none              };
    Statement                   =  {  fg=schema.red,                   bg=schema.none              };
    Error                       =  {  fg=schema.red,                   bg=schema.none              };
    StorageClass                =  {  fg=schema.orange,                bg=schema.none              };
    Tag                         =  {  fg=schema.orange,                bg=schema.none              };
    Label                       =  {  fg=schema.orange,                bg=schema.none              };
    Structure                   =  {  fg=schema.orange,                bg=schema.none              };
    Operator                    =  {  fg=schema.purple,                bg=schema.none              };
    Title                       =  {  fg=schema.orange,                bg=schema.none,             style='bold'            };
    Special                     =  {  fg=schema.yellow,                bg=schema.none              };
    SpecialChar                 =  {  fg=schema.yellow,                bg=schema.none              };
    Type                        =  {  fg=schema.teal,                  bg=schema.none              };
    Function                    =  {  fg=schema.yellow,                bg=schema.none              };
    String                      =  {  fg=schema.green,                 bg=schema.none              };
    Character                   =  {  fg=schema.green,                 bg=schema.none              };
    Constant                    =  {  fg=schema.cyan,                  bg=schema.none              };
    Macro                       =  {  fg=schema.cyan,                  bg=schema.none              };
    Identifier                  =  {  fg=schema.blue,                  bg=schema.none              };
    Comment                     =  {  fg=schema.fg_disabled,           bg=schema.none,             style='italic'          };
    SpecialComment              =  {  fg=schema.gray[4],               bg=schema.none              };
    Todo                        =  {  fg=schema.cyan,                  bg=schema.none              };
    Delimiter                   =  {  fg=schema.fg,                    bg=schema.none              };
    Ignore                      =  {  fg=schema.gray[4],                 bg=schema.none              };
    Underlined                  =  {  fg=schema.none,                  bg=schema.none,             style='underline'       };

    NvimTreeFolderName          =  {  fg=schema.blue,                  bg=schema.none};
    NvimTreeRootFolder          =  {  fg=schema.red,                   bg=schema.none,             style='bold'            };
    NvimTreeOpenedFolderName    =  {  fg=schema.blue,                  bg=schema.none,             style='bold'            };

    LspReferenceRead            =  {  fg=schema.none,                  bg=schema.bg_highlight,     style='bold'            };
    LspReferenceWrite           =  {  fg=schema.none,                  bg=schema.bg_highlight,     style='bold'            };
    LspReferenceText            =  {  fg=schema.none,                  bg=schema.bg_highlight,     style='bold'            };

    DiagnosticSignError         =  {  fg=schema.diag.danger.fg,        style='bold'                };
    DiagnosticSignWarn          =  {  fg=schema.diag.warning.fg,       style='bold'                };
    DiagnosticSignInfo          =  {  fg=schema.diag.info.fg,          style='bold'                };
    DiagnosticSignHint          =  {  fg=schema.diag.hint.fg,          style='bold'                };

    DiagnosticVirtualTextError  =  {  fg=schema.diag.danger.fg,        bg=schema.diag.danger.bg,   style='bold'            };
    DiagnosticVirtualTextWarn   =  {  fg=schema.diag.warning.fg,       bg=schema.diag.warning.bg,  style='bold'            };
    DiagnosticVirtualTextInfo   =  {  fg=schema.diag.info.fg,          bg=schema.diag.info.bg,     style='bold'            };
    DiagnosticVirtualTextHint   =  {  fg=schema.diag.hint.fg,          bg=schema.diag.hint.bg,     style='bold'            };

    DiagnosticUnderlineError    =  {  fg=schema.diag.danger.fg,        bg=schema.diag.danger.bg,   style='undercurl,bold'  };
    DiagnosticUnderlineWarn     =  {  fg=schema.diag.warning.fg,       bg=schema.diag.warning.bg,  style='undercurl,bold'  };
    DiagnosticUnderlineInfo     =  {  fg=schema.diag.info.fg,          bg=schema.diag.info.bg,     style='undercurl,bold'  };
    DiagnosticUnderlineHint     =  {  fg=schema.diag.hint.fg,          bg=schema.diag.hint.bg,     style='undercurl,bold'  };

    DiagnosticError             =  {  fg=schema.diag.danger.fg,        };
    DiagnosticWarn              =  {  fg=schema.diag.warning.fg,       };
    DiagnosticInfo              =  {  fg=schema.diag.info.fg,          };
    DiagnosticHint              =  {  fg=schema.diag.hint.fg,          };

    StartifyPath                =  {  fg=schema.fg_disabled            },

    GitSignsAdd                 =  {  fg=schema.green,                 bg=schema.none              };
    GitSignsChange              =  {  fg=schema.blue,                  bg=schema.none              };
    GitSignsDelete              =  {  fg=schema.red,                   bg=schema.none              };

    StatusLineBg                =  {  bg=schema.gray[3]                  },
    StatusLineMode              =  {  fg=schema.gray[1],               bg=schema.purple            },
    StatusLineFileName          =  {  fg=schema.gray[11],              bg=schema.gray[4]             },
    StatusLineLspError          =  {  fg=schema.diag.danger.fg,        bg=schema.gray[3]             },
    StatusLineLspWarn           =  {  fg=schema.diag.warning.fg,       bg=schema.gray[3]             },
    StatusLineLspInfo           =  {  fg=schema.diag.info.fg,          bg=schema.gray[3]             },
    StatusLineInactiveFileName  =  {  fg=schema.gray[6],               bg=schema.gray[3]             },
    StatusLineRightSub          =  {  fg=schema.gray[11],              bg=schema.gray[2]             },
    StatusLineSepMode_0         =  {  fg=schema.purple,                },
    StatusLineSep1_Bg           =  {  fg=schema.gray[4],               bg=schema.gray[3]             },
    StatusLineSepInactive       =  {  fg=schema.gray[3],                 },

    CmpItemAbbr                 =  {  fg=schema.fg,                    bg=schema.none,             };
    CmpItemAbbrMatch            =  {  fg=schema.blue,                  bg=schema.none,             style='bold'};
    CmpItemAbbrMatchFuzzy       =  {  fg=schema.blue,                  bg=schema.none,             style='bold'};
    CmpItemAbbrDeprecated       =  {  fg=schema.fg_disabled,           bg=schema.none,             style='strikethrough'};
    CmpItemKindFunction         =  {  fg=schema.yellow,                bg=schema.none              };
    CmpItemKindMethod           =  {  fg=schema.yellow,                bg=schema.none              };
    CmpItemKindInterface        =  {  fg=schema.yellow,                bg=schema.none              };
    CmpItemKindModule           =  {  fg=schema.yellow,                bg=schema.none              };
    CmpItemKindDefault          =  {  fg=schema.fg,                    bg=schema.none              };

  -- CocErrorHighlight   = { fg=schema.diag.danger.fg,     bg=schema.diag.danger.bg,   style='undercurl,bold'};
  -- CocWarningHighlight = { fg=schema.diag.warning.fg,    bg=schema.diag.warning.bg,  style='undercurl,bold'};
  -- CocInfoHighlight    = { fg=schema.diag.info.fg,       bg=schema.diag.info.bg,     style='undercurl,bold'};
  -- CocHintHighlight    = { fg=schema.diag.hint.fg,       bg=schema.diag.hint.bg,     style='undercurl,bold'};

  -- CocHighlightRead      = { fg=schema.none,     bg=schema.bg_highlight, style='bold' };
  -- CocHighlightWrite     = { fg=schema.none,     bg=schema.bg_highlight, style='bold' };
  -- CocHighlightText      = { fg=schema.none,     bg=schema.bg_highlight, style='bold' };

  -- CocErrorSign      = { fg=schema.diag.danger.fg,   style='bold'};
  -- CocWarningSign    = { fg=schema.diag.warning.fg,  style='bold'};
  -- CocInfoSign       = { fg=schema.diag.info.fg,     style='bold'};
  -- CocHintSign       = { fg=schema.diag.hint.fg,     style='bold'};
}
return syntax
end

local function setup()
  -- vim.api.nvim_command('hi clear')
  -- if vim.fn.exists('syntax_on') then
  --   vim.api.nvim_command('syntax reset')
  -- end
  vim.o.background = 'dark'
  vim.o.termguicolors = true

  local syntax = syntax()

  for group, colors in pairs(syntax) do
    u.nvim_hl(group, colors)
  end
end

return { schema = schema; setup = setup; }
