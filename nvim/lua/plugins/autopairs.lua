-- auto-pairs (jiangmiao) -> nvim-autopairs. The cmp <-> autopairs bridge
-- (equivalent to the old AutoPairsReturn() hook into coc's <CR>) is wired
-- from plugins/completion.lua once cmp is guaranteed to be loaded, so it
-- isn't declared here.
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {},
}
