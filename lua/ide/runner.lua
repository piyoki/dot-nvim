local M = {}

function M.setup()
  require('code_runner').setup({
    -- put here the commands by filetype
    filetype = {
      python = 'python3 -u',
      typescript = 'deno run',
      rust = {
        'cd $dir &&',
        'rustc $fileName &&',
        '$dir/$fileNameWithoutExt',
      },
    },
  })
end

return M
