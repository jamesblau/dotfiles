-- Minimal vim-plug -> lazy.nvim shim.
--
-- Loaded from vim/vimrc.bundles (nvim only) when g:james_use_lazy is set. The
-- bundles file collects every `Plug 'repo', {opts}` call into
-- g:dotfiles_lazy_specs via a command shim; this module translates those into
-- lazy.nvim specs and bootstraps lazy. All plugin *configuration* (let g:...,
-- mappings, functions) stays in the vimrc unchanged -- lazy only handles
-- install/load. To revert, comment out g:james_use_lazy and restart nvim.

local specs = vim.g.dotfiles_lazy_specs or {}

-- Bootstrap lazy.nvim itself (clones on first run, like vim-plug's curl did).
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Translate one collected {repo=..., opts={...}} into a lazy.nvim spec.
-- vim-plug option  ->  lazy.nvim key:
--   'do'  -> build   (post-install hook; '\|' un-escaped back to a real pipe)
--   'for' -> ft      (lazy-load on filetype)
--   'on'  -> cmd / keys (lazy-load on command, or <Plug> mapping)
--   branch/tag/commit -> passed through
-- vim-plug's 'dir' (custom clone path) has no clean lazy equivalent, so it is
-- dropped: lazy manages the plugin in its own root. The plugin still loads;
-- only its on-disk location changes (relevant only to fzf here).
-- Implicit load-order dependencies that vim-plug satisfied by adding every
-- plugin to runtimepath before sourcing any. lazy loads one at a time, so
-- these must be declared so the dependency loads first.
local DEPS = {
  ["xolox/vim-session"] = { "xolox/vim-misc" },
  ["kana/vim-textobj-entire"] = { "kana/vim-textobj-user" },
}

local function translate(item)
  local opts = item.opts or {}
  local spec = { item.repo }

  if DEPS[item.repo] then spec.dependencies = DEPS[item.repo] end

  if opts["do"] ~= nil then
    local build = opts["do"]
    if type(build) == "string" then
      build = build:gsub("\\|", "|")
    end
    spec.build = build
  end

  if opts["for"] ~= nil then
    spec.ft = opts["for"]
  end

  if opts["on"] ~= nil then
    local on = opts["on"]
    local list = (type(on) == "table") and on or { on }
    local cmds, keys = {}, {}
    for _, v in ipairs(list) do
      if type(v) == "string" and v:match("^<Plug>") then
        keys[#keys + 1] = v
      else
        cmds[#cmds + 1] = v
      end
    end
    if #cmds > 0 then spec.cmd = cmds end
    if #keys > 0 then spec.keys = keys end
  end

  if opts.branch ~= nil then spec.branch = opts.branch end
  if opts.tag ~= nil then spec.tag = opts.tag end
  if opts.commit ~= nil then spec.commit = opts.commit end

  return spec
end

local lazy_specs = {}
for _, item in ipairs(specs) do
  lazy_specs[#lazy_specs + 1] = translate(item)
end

require("lazy").setup(lazy_specs)
