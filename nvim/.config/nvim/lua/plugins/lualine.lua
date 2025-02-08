local colors = {
  bg = '#222436',
  bg_dark = '#1e2030',
  bg_dark1 = '#191B29',
  bg_highlight = '#2f334d',
  blue = '#82aaff',
  blue0 = '#3e68d7',
  blue1 = '#65bcff',
  blue2 = '#0db9d7',
  blue5 = '#89ddff',
  blue6 = '#b4f9f8',
  blue7 = '#394b70',
  comment = '#636da6',
  cyan = '#86e1fc',
  dark3 = '#545c7e',
  dark5 = '#737aa2',
  fg = '#c8d3f5',
  fg_dark = '#828bb8',
  fg_gutter = '#3b4261',
  green = '#c3e88d',
  green1 = '#4fd6be',
  green2 = '#41a6b5',
  magenta = '#c099ff',
  magenta2 = '#ff007c',
  orange = '#ff966c',
  purple = '#fca7ea',
  red = '#ff757f',
  red1 = '#c53b53',
  teal = '#4fd6be',
  terminal_black = '#444a73',
  yellow = '#ffc777',
  git = {
    add = '#b8db87',
    change = '#7ca1f2',
    delete = '#e26a75',
  },
  white = '#D4D4D4',
  steel_grey = '#4c566a',
  grey = '#3b4252',
}
-- define custom theme
local theme = {
  normal = {
    b = { fg = colors.white, bg = colors.steel_grey },
    a = { fg = colors.white, bg = colors.bg_highlight },
    c = { fg = colors.white, guibg = 'none' },
  },
  visual = {
    b = { fg = colors.magenta, bg = colors.steel_grey },
    a = { fg = colors.bg, bg = colors.magenta, gui = 'bold' },
    c = { fg = colors.bg, bg = colors.magenta },
  },
  inactive = {
    b = { fg = colors.white, bg = colors.steel_grey },
    a = { fg = colors.white, bg = colors.steel_grey },
  },
  replace = {
    b = { fg = colors.yellow, bg = colors.steel_grey },
    a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
    c = { fg = colors.bg, bg = colors.yellow },
  },
  insert = {
    b = { fg = colors.orange, bg = colors.steel_grey },
    a = { fg = colors.bg, bg = colors.orange, gui = 'bold' },
    c = { fg = colors.bg, bg = colors.orange },
  },
  command = {
    b = { fg = colors.cyan, bg = colors.steel_grey },
    a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' },
    c = { fg = colors.bg, bg = colors.cyan },
  },
}
local tabline = {
  lualine_a = { 'buffers' },
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = { 'tabs' },
}

local sections = {
  lualine_a = {
    {
      function()
        return 'RECORDING'
      end,
      cond = require('noice').api.status.mode.has,
      color = { fg = colors.bg, bg = colors.red, gui = 'bold' },
    },
    {
      'mode',
    },
  },
  lualine_b = { 'branch', 'diff', 'diagnostics' },
  lualine_c = { 'filename' },
  lualine_x = { 'encoding', 'fileformat', 'filetype' },
  lualine_y = { 'progress' },
  lualine_z = {
    { 'location' },
    {
      function()
        return '●'
      end,
      cond = require('noice').api.status.mode.has,
      color = { fg = colors.bg, bg = colors.red, gui = 'bold' },
    },
  },
}

local inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = { 'filename' },
  lualine_x = { 'location' },
  lualine_y = {},
  lualine_z = {},
}

return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  config = function()
    require('lualine').setup {
      options = {
        theme = theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = sections,
      inactive_sections = inactive_sections,
      tabline = tabline,
    }
  end,
}
