local CONFIG = {
    enabled = {"enabled", "bool", true, "Example autorun"},
}

local MANIFEST = {
    id = "Marshallvak.autorunrs",
    author = "Marshall_vak",
    name = "Launch Autorun-rs",
    description = "Starts autorun-rs",
    version = "1",
    config = CONFIG
}

menup(MANIFEST)

local function reload()
    require("autorun")
end

hook.Add("ConfigApply", MANIFEST.id, function(id)
    if id == MANIFEST.id then
        reload()
    end
end)

if IsValid(pnlMainMenu) then
    reload()
else
    hook.Add("MenuVGUIReady", MANIFEST.id, function()
        reload()
    end)
end

return function()
    //DrawBackground = OldDrawBackground
end