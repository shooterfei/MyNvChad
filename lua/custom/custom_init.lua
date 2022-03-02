-- 设置屏幕中间竖条
-- vim.o.colorcolumn = "130"

-- 禁用多光标警告
vim.g.VM_show_warnings = 0

-- 设置asynctasks窗口排版
vim.g.asynctasks_term_pos = "bottom"
vim.g.asynctasks_term_rows = 15

-- vim-table-mode更改为markdown语法
vim.g.table_mode_corner = "|"

vim.opt.fileencodings = "utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1"
-- 自动切换输入法配置
-- vim.o.ttimeoutlen=0

vim.g.loaded_zip = 0
vim.g.loaded_zipPlugin = 0

local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = nil
end
