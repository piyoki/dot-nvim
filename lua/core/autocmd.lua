local autocmd = {}
local nvim_cmd = vim.api.nvim_command
local nvim_exec = vim.api.nvim_exec

function autocmd.setup()
  -- return to the previous edit position
  nvim_cmd([[
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " Return to the previous edit position
  ]])

  nvim_exec(
    [[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost * FormatWrite
      autocmd BufNewFile,BufRead *.hcl set filetype=terraform syntax=terraform
    augroup END
  ]],
    true
  )

  -- enable comment string
  nvim_cmd([[
    autocmd FileType apache setlocal commentstring=#\ %s
  ]])

  -- TelescopePrompt setup
  vim.cmd([[
    augroup cmp
      autocmd!
      autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
    augroup end
  ]])

  -- set current working directory when opening vim
  vim.cmd([[
    augroup cdpwd
      autocmd!
      autocmd VimEnter * cd $PWD
    augroup end
  ]])

  -- change working directory to the project root when opening a file
  nvim_cmd([[
    lua require("nvim-rooter").setup({
      manual = true,
    })
  ]])
end

return autocmd
