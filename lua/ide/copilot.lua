local M = {}

function M.setup()
  require('CopilotChat').setup({
    model = 'claude-sonnet-4',
    window = {
      layout = 'float', -- 'float' or 'vertical', 'horizontal'
      width = 0.95,
      height = 0.9,
    },
    mappings = {
      complete = {
        insert = '<S-Tab>',
      },
    },
  })
end

return M
