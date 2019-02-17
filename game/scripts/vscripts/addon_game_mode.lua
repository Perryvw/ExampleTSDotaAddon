--=======================================================================================
-- Root lua file
--=======================================================================================
require("lib.timers")

require("GameMode")

function Precache()
end

function Activate()
    GameRules.Addon = GameMode.new(true)
end

if GameRules.Addon then
    GameRules.Addon:Reload()
end
