local obs = require("obsidian")
obs.setup({
    workspaces = {
        {
            name = "personal",
            path = "~/vaults/personal",
        },
    },
    note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
            suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
            for _ = 1, 4 do
                suffix = suffix .. string.char(math.random(65, 90))
            end
        end
        return suffix
    end,
})

vim.opt.conceallevel = 2
