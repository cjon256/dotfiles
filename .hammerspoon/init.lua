--# selene: allow(unscoped_variables)
---@diagnostic disable(lowercase_global)
-- then this hack makes the other errors around hs and spoon go away
hs = hs
-- spoon = spoon

hs.hotkey.bind({ "alt" }, ",", function()
    hs.reload()
end)

hs.hotkey.bind({ "alt", "ctrl", "shift" }, "=", function()
    hs.caffeinate.systemSleep()
end)

hs.hotkey.bind({ "alt", "ctrl", "shift" }, "\\", function()
    hs.fs.volume.eject("/Volumes/ADV360")
end)

-- local alt_cmd = { "alt" }
local MY_HOTKEYS = {
    ["1Password"] = "p",
    ["Firefox"]   = "f",
    ["Reminders"] = "r",
    ["Drafts"]    = "d",
    ["Kitty"]     = "t",
    ["Things"]    = "n",
    ["Slack"]     = "s",
    ["WezTerm"]   = "w",
    ["Vivaldi"]   = "v",
    ["TextEdit"]  = "b",
    ["Finder"]    = "z",
}

-- function table_invert(tbl)
--     local rv = {}
--     for key, val in pairs(tbl) do
--         rv[val] = key
--     end
--     return rv
-- end
--
-- hs.spoons.use("AppLauncher", { hotkeys = table_invert(MY_HOTKEYS), modifiers = alt_cmd })

-- -- Create a window filter based off of MY_HOTKEYS
-- -- Note: giving this function to convey intention
function filterHotKeyApps(w)
    -- return true if the app has no hotkey
    return MY_HOTKEYS[w:application():name()] == nil
end

local my_filter = hs.window.filter.new(filterHotKeyApps)
--
-- -- Create a new switcher instance
local switcher = hs.window.switcher.new(my_filter)
--
-- -- Customize the switcher UI
hs.window.switcher.ui.backgroundColor = { 0, 0, 0, 0.7 }
hs.window.switcher.ui.highlightColor = { 0.8, 0.8, 0.8, 0.8 }
hs.window.switcher.ui.showThumbnails = false
hs.window.switcher.ui.showTitles = false
hs.window.switcher.ui.showSelectedThumbnail = false
hs.window.switcher.ui.showSelectedTitle = false
-- local uiGlobal =
--   textColor={1,1,1},
--   fontName='Lucida Grande',
--   textSize=16,
--
--   backgroundColor={0.3,0.3,0.3,1},
--   highlightColor={0.8,0.5,0,0.8},
--
--   showTitles=true,
--   titleBackgroundColor={0,0,0},
--   showThumbnails=true,
--   thumbnailSize=128,
--
--   showSelectedThumbnail=true,
--   selectedThumbnailSize=384,
--   showSelectedTitle=true,
--   showExtraKeys=true,
-- }
--
-- -- Bind hotkeys to cycle through windows
hs.hotkey.bind({ "cmd", "alt" }, "tab",
    function()
        switcher:next()
    end)
hs.hotkey.bind({ "cmd", "alt", "shift" }, "tab",
    function()
        switcher:previous()
    end)


hs.hotkey.bind({ "cmd", "alt", "opt", "shift" }, "\\",
    function()
        hs.fs.volume.eject("/Volumes/ADV360")
    end)
