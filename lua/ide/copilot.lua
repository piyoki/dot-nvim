local M = {}

function M.setup()
  require('CopilotChat').setup({})
  -- Registers copilot-chat source and enables it for copilot-chat filetype (so copilot chat window)
  require('CopilotChat.integrations.cmp').setup()
end

return M
