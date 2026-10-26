--============================================================================--
--                                INSTALLATION                                --
--============================================================================--

vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

--============================================================================--
--                               CONFIGURATION                                --
--============================================================================--

------------------
-- TEXT EDITING --
------------------
require("mini.pairs").setup()
require("mini.surround").setup()

----------------
-- APPEARANCE --
----------------
local hipatterns = require("mini.hipatterns")
hipatterns.setup({ highlighters = { hex_color = hipatterns.gen_highlighter.hex_color() } })

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
