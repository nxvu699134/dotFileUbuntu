local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')
local diagnostic = require('galaxyline.provider_diagnostic')

gl.short_line_list = {'NvimTree','vista','dbui','packer', 'startify'}

local colors = {
  bg = '#2e3440',
  fg = '#f8f8f2',
  section_bg = '#3D434F',
  -- section_bg = '#484E5A',
  grey = "#545454",

  blue = '#8be9fd',
  yellow = '#ffc44c',
  orange = '#ffae57',
  red = '#ff5555',
  magenta = '#ff79c6',
  cyan = '#59c2ff',
  green = '#83c746',
}

local mode_color = function()
  local mode_colors = {
    n = colors.cyan,
    i = colors.green,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
  }

  return mode_colors[vim.fn.mode()]
end

local icons = {
    sep = {
        right = "",
        left = ""
    },
    diagnostic = {
        error = " ",
        warn = " ",
        info = " "
    },
    diff = {
        add = " ",
        modified = " ",
        remove = " "
    },
    git = "",
}

local white_space = function() return ' ' end

-- --------------------------------------Left side-----------------------------------------------------------
gls.left[1] = {
  FirstElement = {
    provider = function() return icons.sep.right end,
    highlight = { colors.cyan, colors.bg }
  },
}

gls.left[2] = {
  Logo = {
    provider = function() return '   ' end,
    highlight = { colors.bg, colors.cyan }
  },
}

gls.left[3] = {
  ViMode = {
    provider = function()
      local alias = {
        n       = 'NORMAL ',
        i       = 'INSERT ',
        c       = 'COMMAND',
        V       = 'VISUAL ',
        ['']  = 'VISUAL ',
        v       = 'VISUAL ',
        R       = 'REPLACE',
      }
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color()..' gui=bold')
      return '  ' .. alias[vim.fn.mode()]
    end,
    highlight = { colors.bg, colors.bg },
    separator = icons.sep.left,
    separator_highlight = {colors.bg, colors.section_bg},
  },
}

gls.left[4] ={
  FileIcon = {
    provider = {white_space, 'FileIcon'},
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
  },
}

gls.left[5] = {
  FileName = {
    provider = 'FileName',
    highlight = { colors.fg, colors.section_bg },
    separator = icons.sep.left .. ' ',
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

gls.left[6] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = icons.diagnostic.error,
    highlight = {colors.red,colors.bg}
  }
}

gls.left[7] = {
  Space = {
    provider = white_space,
    highlight = {colors.bg,colors.bg},
  }
}

gls.left[8] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = icons.diagnostic.warn,
    highlight = {colors.orange,colors.bg},
  }
}

gls.left[9] = {
  Space = {
    provider = white_space,
    highlight = {colors.bg,colors.bg},
  }
}

gls.left[10] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = icons.diagnostic.info,
    highlight = {colors.blue, colors.bg},
  }
}

-- ------------------------------------Right side-----------------------------------------------------
gls.right[1] = {
  FirstSeparator = {
    provider = function() return icons.sep.right end,
    highlight = { colors.section_bg, colors.bg },
  }
}

-- gls.right[2] = {
--   FileSize = {
--     provider = {function() return icons.git .. ' ' end, 'FileSize'},
--     condition = condition.hide_in_width,
--     highlight = { colors.fg,colors.section_bg },
--     separator = ' ',
--     separator_highlight = { colors.cyan, colors.section_bg },
--   }
-- }

gls.right[2] = {
  LineInfo = {
    provider = 'LineColumn',
    highlight = { colors.fg, colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.cyan, colors.section_bg },
  },
}

gls.right[3] = {
  LastElement = {
    provider = function() return icons.sep.left end,
    highlight = { colors.cyan, colors.bg }
  },
}

-- -------------------------Short status line---------------------------------------
gls.short_line_left[1] = {
  SFirstElement = {
    provider = function() return icons.sep.right end,
    highlight = { colors.grey, colors.bg },
    separator = icons.sep.left,
    separator_highlight = {colors.bg, colors.bg},
  },
}

gls.short_line_left[2] ={
  SFileIcon = {
    provider = 'FileIcon',
    highlight = { colors.grey, colors.bg },
  },
}

gls.short_line_left[3] = {
  SFileName = {
    provider = 'FileName',
    highlight = {colors.grey, colors.bg},
    separator = icons.sep.left,
    separator_highlight = {colors.bg, colors.bg}
  }
}

gls.short_line_right[4] = {
  SLastElement = {
    provider = function() return icons.sep.left end,
    highlight = { colors.grey, colors.bg }
  },
}
