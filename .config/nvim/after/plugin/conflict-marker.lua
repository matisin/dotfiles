vim.api.nvim_set_var('conflict_marker_begin', '^<<<<<<< .*$')
vim.api.nvim_set_var('conflict_marker_end', '^>>>>>>> .*$')

local function set_conflict_marker_color(marker, highlight_group)
  local color = vim.api.nvim_get_hl_by_name(highlight_group, false).background
  vim.api.nvim_set_hl(0, marker, { guibg = color })
end

set_conflict_marker_color('ConflictMarkerBegin', 'Normal')
set_conflict_marker_color('ConflictMarkerOurs', 'NormalNC')
set_conflict_marker_color('ConflictMarkerTheirs', 'Pmenu')
set_conflict_marker_color('ConflictMarkerEnd', 'PmenuSel')
set_conflict_marker_color('ConflictMarkerCommonAncestorsHunk', 'VertSplit')
