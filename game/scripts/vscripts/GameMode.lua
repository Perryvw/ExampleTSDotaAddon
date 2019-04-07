--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 5,["12"] = 5,["13"] = 5,["14"] = 5,["15"] = 1,["16"] = 6,["17"] = 6,["18"] = 6,["19"] = 6,["20"] = 6,["21"] = 6,["22"] = 6,["23"] = 1,["24"] = 18,["25"] = 18,["26"] = 22,["28"] = 23,["29"] = 23,["30"] = 23,["31"] = 23,["33"] = 18,["34"] = 18,["35"] = 29,["36"] = 18,["37"] = 18,["38"] = 1,["39"] = 34,["40"] = 34,["41"] = 1,["42"] = 41,["43"] = 41,["44"] = 1,["45"] = 47,["46"] = 47,["47"] = 50,["48"] = 51,["49"] = 51,["50"] = 47,["51"] = 47,["52"] = 47,["53"] = 1});
LinkLuaModifier(nil, "modifier_panic", "modifiers/modifier_panic.lua", LUA_MODIFIER_MOTION_NONE)
local HeroSelectionTime = 10
GameMode = GameMode or {}
GameMode.__index = GameMode
GameMode.prototype = GameMode.prototype or {}
GameMode.prototype.__index = GameMode.prototype
GameMode.prototype.constructor = GameMode
function GameMode.new(...)
    local self = setmetatable({}, GameMode.prototype)
    self:____constructor(...)
    return self
end
function GameMode.prototype.____constructor(self)
    GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_GOODGUYS, 3)
    GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_BADGUYS, 3)
    GameRules:SetShowcaseTime(0)
    GameRules:SetHeroSelectionTime(HeroSelectionTime)
    ListenToGameEvent(nil, "game_rules_state_change", function() return self:OnStateChange() end, nil)
    ListenToGameEvent(nil, "npc_spawned", function(____, event) return self:OnNpcSpawned(event) end, nil)
end
function GameMode.prototype.OnStateChange(self)
    local state = GameRules:State_Get()
    if IsInToolsMode(nil) and state == DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP then
        do
            local i = 0
            while i < 4 do
                Tutorial:AddBot("npc_dota_hero_lina", "", "", false)
                i = i + 1
            end
        end
    end
    if state == DOTA_GAMERULES_STATE_PRE_GAME then
        Timers:CreateTimer(0.2, function() return self:StartGame() end)
    end
end
function GameMode.prototype.StartGame(self)
    print(nil, "Game starting!")
end
function GameMode.prototype.Reload(self)
    print(nil, "Script reloaded!")
end
function GameMode.prototype.OnNpcSpawned(self, event)
    local unit = EntIndexToHScript(nil, event.entindex)
    if unit:IsRealHero() then
        Timers:CreateTimer(1, function()
            unit:AddNewModifier(nil, nil, "modifier_panic", {duration = 8})
        end)
        unit:AddAbility("meepo_earthbind_ts_example")
    end
end
