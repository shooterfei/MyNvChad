local map = require("core.utils").map

-- telescope
map("n", "<leader>fc", ":Telescope current_buffer_fuzzy_find <CR>")
map("n", "<leader>fp", ":Telescope media_files <CR>")
map("n", "<leader>te", ":Telescope <CR>")

-- truezen
map("n", "<leader>ta", ":TZAtaraxis <CR>")
map("n", "<leader>tm", ":TZMinimalist <CR>")
map("n", "<leader>tf", ":TZFocus <CR>")

-- basic
map("n", "<leader>q", ":q <CR>")

-- dashboard  alpha
map("n", "<leader>db", ":Alpha <CR>")
