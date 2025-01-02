local buf_id = nil
local win_id = nil
local job_id = nil

local create_win = function()
  vim.cmd.vnew()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
  win_id = vim.api.nvim_get_current_win()
end

local create_floating_win = function()
  local path = vim.api.nvim_buf_get_name(0)
  local dir = vim.fn.fnamemodify(path, ":h")
  local editor_width = vim.o.columns
  local editor_height = vim.o.lines
  local win_width = math.floor(editor_width * 0.8)
  local win_height = math.floor(editor_height * 0.8)
  local col = math.floor((editor_width - win_width) / 2)
  local row = math.floor((editor_height - win_height) / 2)
  vim.api.nvim_open_win(0, true, {
    relative = "editor", row = row, col = col, width = win_width, height = win_height
  })
  vim.cmd.term()
  vim.cmd("startinsert")
  vim.fn.chansend(vim.bo.channel, { "cd " .. dir .. "\r\n" })
  vim.fn.chansend(vim.bo.channel, { "clear\r\n" })
end

local create_term = function()
  vim.cmd.term()
  job_id = vim.bo.channel
  buf_id = vim.api.nvim_get_current_buf()
end

local go_to_term = function()
  if win_id ~= nil then
    vim.api.nvim_set_current_win(win_id)
  end
  if buf_id ~= nil then
    vim.api.nvim_set_current_buf(buf_id)
  end
  vim.cmd("startinsert")
end

vim.keymap.set("n", "<C-g>", function()
  create_floating_win()
end)

vim.keymap.set("n", "<C-t>", function()
  if win_id == nil or vim.api.nvim_win_is_valid(win_id) == false then
    create_win()
  end
  if buf_id == nil or vim.api.nvim_buf_is_valid(buf_id) == false then
    create_term()
  end
  go_to_term()
end)

local run_command = function(cmd)
  local prev_win = vim.api.nvim_get_current_win()
  if win_id == nil or vim.api.nvim_win_is_valid(win_id) == false then
    create_win()
  end
  if job_id == nil then
    create_term()
  end
  if win_id ~= nil then
    vim.api.nvim_set_current_win(win_id)
  end
  if buf_id ~= nil then
    vim.api.nvim_set_current_buf(buf_id)
  end
  vim.cmd("$")
  vim.api.nvim_set_current_win(prev_win)
  vim.fn.chansend(job_id, { cmd .. "\r\n" })
end

vim.keymap.set("n", "<leader>ti", function()
  run_command("terraform init")
end, { desc = "[I]nit terraform" })

vim.keymap.set("n", "<leader>tp", function()
  run_command("terraform plan")
end, { desc = "[P]lan terraform" })
