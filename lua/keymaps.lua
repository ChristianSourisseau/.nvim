vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

--start a browser-sync for Live Reloading
--vim.api.nvim_set_keymap('n', '<leader>l', ':!browser-sync start --server --files "*.html, *.css, *.js"<CR>', { noremap = true })
--
vim.keymap.set('n', '<leader>l', function()
  vim.loop.spawn('kitty', {
    args = {
      '--',
      'bash',
      '-c',
      "browser-sync start --server --files '*.html, *.css, *.js'; exec bash",
    },
    detached = true,
  }, function(code, signal)
    if code ~= 0 then
      print('Live server exited with code ' .. code .. ' (signal ' .. signal .. ')')
    end
  end)
end, { desc = 'Start Live Server in New Terminal' })

vim.keymap.set('n', '<leader>k', function()
  os.execute 'pkill -f browser-sync'
end, { desc = 'Kill Live Server' })
-- vim: ts=2 sts=2 sw=2 et
