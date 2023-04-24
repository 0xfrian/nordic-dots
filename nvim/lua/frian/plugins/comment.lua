-- ===========
-- | comment |
-- ===========

local status_comment, comment = pcall(require, "nvim_comment")
if not status_comment then
  return
end

comment.setup({})

