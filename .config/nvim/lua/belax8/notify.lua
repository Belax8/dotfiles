local M = {}

require('notify').setup({
  render = 'default',
  background_colour = '#252137',
  stages = 'slide',
  icons = {
    TRACE = '',
    DEBUG = '',
    INFO = '',
    WARN = '',
    ERROR = ''
  },
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { zindex = 500 })
  end,
})

M.notify = function(msg, lvl, opts)
  lvl = lvl or vim.log.levels.INFO
  local lvls = vim.log.levels
  local keep = function()
    return true
  end
  local _opts = ({
    [lvls.TRACE] = { timeout = 5000, title = 'Trace' },
    ['TRACE'] = { timeout = 5000, title = 'Trace' },

    [lvls.DEBUG] = { timeout = 5000, title = 'Debug' },
    ['DEBUG'] = { timeout = 5000, title = 'Debug' },

    [lvls.INFO] = { timeout = 5000, title = 'Info' },
    ['INFO'] = { timeout = 5000, title = 'Info' },

    [lvls.WARN] = { timeout = 10000, title = 'Warn' },
    ['WARN'] = { timeout = 10000, title = 'Warn' },

    [lvls.ERROR] = { timeout = 10000, title = 'Error' },
    ['ERROR'] = { timeout = 10000, title = 'Error' },
    -- [lvls.ERROR] = { timeout = 10000, keep = keep },
  })[lvl]
  opts = vim.tbl_extend('force', _opts or {}, opts or {})

  if not opts['title'] then
    opts['render'] = 'minimal'
  end

  local ok, notify = pcall(require, 'notify')
  if not ok then
    vim.defer_fn(function()
      vim.notify(msg, lvl, opts)
    end, 100)
    return
  end
  return notify.notify(msg, lvl, opts)
end

return M
