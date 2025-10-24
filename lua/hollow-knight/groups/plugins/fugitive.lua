-- Vim-fugitive plugin support for Hollow Knight theme
-- The Spirit's Git mastery through the void

local M = {}

function M.setup(colors)
  return {
    -- Fugitive commit editing
    fugitiveHeader = { fg = colors.geo_yellow, bold = true },
    fugitiveHunk = { fg = colors.soul_blue },
    fugitiveCount = { fg = colors.crystal_blue },
    fugitiveStagedHeading = { fg = colors.lumafly_green, bold = true },
    fugitiveUnstagedHeading = { fg = colors.infection_orange, bold = true },
    fugitiveUntrackedHeading = { fg = colors.mask_gray, bold = true },
    fugitiveSymbolicRef = { fg = colors.crystal_blue, bold = true },
    fugitiveHash = { fg = colors.shade_purple },

    -- Diff colors for fugitive
    fugitiveDiffAdded = { fg = colors.moss_green },
    fugitiveDiffRemoved = { fg = colors.nail_red },
    fugitiveDiffModified = { fg = colors.soul_blue },
    fugitiveDiffContext = { fg = colors.soul_white },
    fugitiveDiffHeader = { fg = colors.geo_yellow, bold = true },
    fugitiveDiffHunk = { fg = colors.crystal_blue },

    -- Blame annotations
    fugitiveblame = { fg = colors.mask_gray, bg = colors.void_black },
    fugitiveblameBoundary = { fg = colors.deep_black },
    fugitiveblameHash = { fg = colors.shade_purple },
    fugitiveblameUncommitted = { fg = colors.infection_orange },
    fugitiveblameTime = { fg = colors.soul_blue },
    fugitiveblameLineNumber = { fg = colors.crystal_blue },
    fugitiveblameOriginalFile = { fg = colors.geo_yellow },
    fugitiveblameOriginalLineNumber = { fg = colors.crystal_blue },

    -- Status window
    fugitiveSection = { fg = colors.geo_yellow, bold = true },
    fugitiveStagedModifier = { fg = colors.lumafly_green },
    fugitiveUnstagedModifier = { fg = colors.infection_orange },
    fugitiveUntrackedModifier = { fg = colors.mask_gray },
    fugitiveIgnoredModifier = { fg = colors.deep_black },

    -- Tree/log view
    fugitiveTree = { fg = colors.soul_white },
    fugitiveTreeDir = { fg = colors.soul_blue },
    fugitiveCommit = { fg = colors.shade_purple },
    fugitiveAuthor = { fg = colors.crystal_blue },
    fugitiveDate = { fg = colors.mask_gray },
    fugitiveSubject = { fg = colors.soul_white },

    -- Interactive elements
    fugitiveInstruction = { fg = colors.geo_yellow, italic = true },
    fugitiveHelp = { fg = colors.mask_gray, italic = true },
    fugitiveCommand = { fg = colors.crystal_blue },

    -- Merge conflict resolution
    fugitiveConflictMarker = { fg = colors.nail_red, bold = true },
    fugitiveConflictAncestor = { fg = colors.infection_orange },
    fugitiveConflictCurrent = { fg = colors.lumafly_green },
    fugitiveConflictIncoming = { fg = colors.soul_blue },

    -- Special highlights
    fugitiveNoteHeading = { fg = colors.geo_yellow, bold = true },
    fugitiveNote = { fg = colors.soul_white },
    fugitiveWarning = { fg = colors.infection_orange },
    fugitiveError = { fg = colors.nail_red, bold = true },

    -- Additional git commit highlights for fugitive
    gitcommitSelectedFile = { fg = colors.lumafly_green },
    gitcommitDiscardedFile = { fg = colors.nail_red },
    gitcommitOverflow = { fg = colors.infection_orange },
    gitcommitSummary = { fg = colors.soul_blue },
    gitcommitComment = { fg = colors.mask_gray, italic = true },
    gitcommitUntracked = { fg = colors.mask_gray },
    gitcommitDiscarded = { fg = colors.nail_red },
    gitcommitSelected = { fg = colors.lumafly_green },
    gitcommitHeader = { fg = colors.geo_yellow },
    gitcommitSelectedType = { fg = colors.soul_blue },
    gitcommitUnmergedType = { fg = colors.infection_orange },
    gitcommitDiscardedType = { fg = colors.nail_red },
    gitcommitBranch = { fg = colors.crystal_blue, bold = true },
    gitcommitUntrackedFile = { fg = colors.soul_white },
    gitcommitUnmergedFile = { fg = colors.infection_orange, bold = true },
    gitcommitSelectFile = { fg = colors.lumafly_green },
    gitcommitNoBranch = { fg = colors.nail_red, bold = true },
    gitcommitOnBranch = { fg = colors.soul_blue },
    gitcommitFile = { fg = colors.soul_white },
    gitcommitType = { fg = colors.crystal_blue },
    gitcommitArrow = { fg = colors.geo_yellow },
    gitcommitBlank = { fg = colors.nail_red },
  }
end

return M