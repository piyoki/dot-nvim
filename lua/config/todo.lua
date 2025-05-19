local M = {}
local todo = require('checkmate')

local colors = {
  purple = '#b4befe',
  green = '#96de7a',
  yellow = '#f7ffbc',
  darkgray = '#7b838c',
  gray = '#aaaaaa',
}

function M.setup()
  -- Ref: https://github.com/bngarren/checkmate.nvim
  todo.setup({
    files = { 'TODO', 'PLANNING', 'PROPOSAL', '*meeting*' }, -- matches TODO.md, PLANNING.md, PROPOSAL.md, and any file with meeting in the name
    -- Default keymappings
    keys = {
      ['<leader>tc'] = 'create', -- Create todo item
    },
    todo_count_recursive = true,
    todo_count_position = 'eol',
    style = {
      -- Unchecked todo items
      unchecked_marker = { fg = '#bfbfbf', bold = true }, -- The marker itself
      unchecked_main_content = { fg = '#ffffff' }, -- Style settings for main content: typically the first line/paragraph
      unchecked_additional_content = { fg = '#dddddd' }, -- Settings for additional content

      -- Checked todo items
      checked_marker = { fg = colors.green, bold = true }, -- The marker itself
      checked_main_content = { fg = colors.gray, strikethrough = true }, -- Style settings for main content: typically the first line/paragraph
      checked_additional_content = { fg = colors.gray }, -- Settings for additional content
    },
    metadata = {
      priority = { key = '<leader>tp' },
      started = { key = '<leader>ts', style = { fg = colors.yellow } },
      done = {
        key = '<leader>tt',
        on_remove = function(todo_item)
          require('checkmate').set_todo_item(todo_item, 'unchecked')
        end,
      },
      due = {
        aliases = { 'end' },
        -- Define default value function
        get_value = function()
          local t = os.date('*t')
          t.day = t.day + 1
          local tomorrow = os.time(t)
          return os.date('%m/%d/%y %H:%M', tomorrow)
        end,
        key = '<leader>te',
        style = { fg = colors.darkgray },
        -- jump_to_on_insert = 'value', -- Jump the cursor to the value so that you can edit it after insert, if you desire
      },
    },
  })
end

return M
