return {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
        local status = require "astroui.status"
        local utils = require "heirline.utils"
        local conditions = require "heirline.conditions"
        local color = require "palette"

        local FileNameBlock = {
            -- let's first set up some attributes needed by this component and its children
            init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end,
        }
        -- We can now define some children separately and add them later

        local FileName = {
            provider = function(self)
                -- first, trim the pattern relative to the current directory. For other
                -- options, see :h filename-modifers
                local filename = vim.fn.fnamemodify(self.filename, ":.")
                if filename == "" then return "" end
                -- now, if the filename would occupy more than 1/4th of the available
                -- space, we trim the file path to its initials
                -- See Flexible Components section below for dynamic truncation
                if not conditions.width_percent_below(#filename, 0.25) then filename = vim.fn.pathshorten(filename) end
                return filename
            end,
            hl = { fg = color.gray600 },
        }

        local FileFlags = {
            {
                condition = function() return vim.bo.modified end,
                provider = " [+] ",
                hl = { fg = color.green600 },
            },
            {
                condition = function() return not vim.bo.modifiable or vim.bo.readonly end,
                provider = function(self)
                    if self.filename then return "  " end
                    return ""
                end,
                hl = { fg = color.gray600 },
            },
        }

        -- Now, let's say that we want the filename color to change if the buffer is
        -- modified. Of course, we could do that directly using the FileName.hl field,
        -- but we'll see how easy it is to alter existing components using a "modifier"
        -- component

        local FileNameModifer = {
            hl = function()
                if vim.bo.modified then
                    -- use `force` because we need to override the child's hl foreground
                    return { fg = color.gray600 }
                end
            end,
        }

        -- let's add the children to our FileNameBlock component
        FileNameBlock = utils.insert(
            FileNameBlock,
            utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
            FileFlags,
            { provider = "%<" }                      -- this means that the statusline is cut here when there's not enough space
        )

        local Git = {
            condition = conditions.is_git_repo,

            init = function(self)
                self.status_dict = vim.b.gitsigns_status_dict
                self.has_changes = self.status_dict.added ~= 0
                    or self.status_dict.removed ~= 0
                    or self.status_dict.changed ~= 0
            end,

            hl = { fg = color.green800 },

            { -- git branch name
                provider = function(self) return "  " .. self.status_dict.head end,
                hl = { bold = false },
            },
            -- You could handle delimiters, icons and counts similar to Diagnostics
            {
                condition = function(self) return self.has_changes end,
                provider = "(",
            },
            {
                provider = function(self)
                    local count = self.status_dict.added or 0
                    return count > 0 and ("+" .. count)
                end,
                hl = { fg = color.green600 },
            },
            {
                provider = function(self)
                    local count = self.status_dict.removed or 0
                    return count > 0 and ("-" .. count)
                end,
                hl = { fg = color.red600 },
            },
            {
                provider = function(self)
                    local count = self.status_dict.changed or 0
                    return count > 0 and ("~" .. count)
                end,
                hl = { fg = color.yellow600 },
            },
            {
                condition = function(self) return self.has_changes end,
                provider = ")",
            },
        }
        opts.winbar = nil
        opts.tabline = nil  -- remove tabline
        -- opts.statusline = nil
        opts.statusline = { -- statusline
            -- hl = { fg = "fg", bg = "bg" },
            status.component.git_branch(Git),
            status.component.builder(FileNameBlock),
            -- status.component.file_info(),
            -- status.component.git_diff(),
            -- status.component.diagnostics(),
            status.component.fill(),
            status.component.diagnostics(),
            -- status.component.cmd_info(),
            -- status.component.fill(),
            status.component.lsp(),
            -- status.component.virtual_env(),
            -- status.component.treesitter(),
            -- status.component.nav {},
            -- status.component.mode { surround = { separator = "right" } },
        }
        opts.statuscolumn = { -- statuscolumn
            init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
            -- status.component.foldcolumn(),
            status.component.numbercolumn(),
            status.component.signcolumn(),
        }
    end,
}
