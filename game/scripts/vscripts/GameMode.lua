--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
function __TS__Decorate(decorators, target, key, desc)
    local result = target
    do
        local i = #decorators
        while i >= 0 do
            local decorator = decorators[i + 1]
            if decorator then
                local oldResult = result
                if key == nil then
                    result = decorator(_G, result)
                elseif desc ~= nil then
                    result = decorator(_G, target, key, result)
                else
                    result = decorator(_G, target, key)
                end
                result = result or oldResult
            end
            i = i - 1
        end
    end
    return result
end

--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or {}
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        _G.__TS__originalTraceback = debug.traceback
        debug.traceback = function(thread, message, level)
            local trace = _G.__TS__originalTraceback(thread, message, level)
            local result = string.gsub(trace, "(%S+).lua:(%d+)", function(file, line)
                if _G.__TS__sourcemap[tostring(file) .. ".lua"] and _G.__TS__sourcemap[tostring(file) .. ".lua"][line] then
                    return tostring(file) .. ".ts:" .. tostring(_G.__TS__sourcemap[tostring(file) .. ".lua"][line])
                end
                return tostring(file) .. ".lua:" .. tostring(line)
            end)
            return result
        end
    end
end

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["47"] = 1,["48"] = 3,["49"] = 5,["50"] = 5,["51"] = 5,["52"] = 5,["53"] = 5,["54"] = 5,["61"] = 14,["62"] = 15,["63"] = 17,["64"] = 18,["65"] = 20,["66"] = 22,["68"] = 7,["69"] = 8,["70"] = 10,["72"] = 25,["73"] = 26,["74"] = 29,["76"] = 30,["77"] = 30,["78"] = 31,["79"] = 30,["83"] = 36,["84"] = 37,["87"] = 41,["88"] = 42,["90"] = 48,["91"] = 49,["93"] = 54,["94"] = 56,["95"] = 57,["96"] = 58,["97"] = 59,["98"] = 58,["99"] = 62,["100"] = 64,["104"] = 5});
LinkLuaModifier("modifier_panic", "modifiers/modifier_panic.lua", LUA_MODIFIER_MOTION_NONE)
local HeroSelectionTime = 10
GameMode = {}
GameMode.name = "GameMode"
GameMode.__index = GameMode
GameMode.prototype = {}
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
    ListenToGameEvent("game_rules_state_change", function() return self:OnStateChange() end, nil)
    ListenToGameEvent("npc_spawned", function(event) return self:OnNpcSpawned(event) end, nil)
end
function GameMode.Precache(context)
    PrecacheResource("particle", "particles/units/heroes/hero_meepo/meepo_earthbind_projectile_fx.vpcf", context)
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_meepo.vsndevts", context)
end
function GameMode.prototype.OnStateChange(self)
    local state = GameRules:State_Get()
    if IsInToolsMode() and state == DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP then
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
    print("Game starting!")
end
function GameMode.prototype.Reload(self)
    print("Script reloaded!")
end
function GameMode.prototype.OnNpcSpawned(self, event)
    local unit = EntIndexToHScript(event.entindex)
    if unit:IsRealHero() then
        Timers:CreateTimer(1, function()
            unit:AddNewModifier(nil, nil, "modifier_panic", {duration = 8})
        end)
        if not unit:HasAbility("meepo_earthbind_ts_example") then
            unit:AddAbility("meepo_earthbind_ts_example")
        end
    end
end
GameMode = __TS__Decorate({reloadable}, GameMode)
