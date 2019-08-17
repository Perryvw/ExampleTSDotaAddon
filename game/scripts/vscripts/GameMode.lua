--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
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

function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or {}
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        _G.__TS__originalTraceback = debug.traceback
        debug.traceback = function(thread, message, level)
            local trace = _G.__TS__originalTraceback(thread, message, level)
            local result = string.gsub(
                trace,
                "(%S+).lua:(%d+)",
                function(file, line)
                    local fileSourceMap = _G.__TS__sourcemap[tostring(file) .. ".lua"]
                    if fileSourceMap and fileSourceMap[line] then
                        return tostring(file) .. ".ts:" .. tostring(fileSourceMap[line])
                    end
                    return tostring(file) .. ".lua:" .. tostring(line)
                end
            )
            return result
        end
    end
end

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["50"] = 1,["51"] = 1,["52"] = 3,["53"] = 5,["54"] = 7,["55"] = 7,["56"] = 7,["57"] = 7,["58"] = 7,["59"] = 7,["61"] = 7,["63"] = 7,["64"] = 7,["66"] = 16,["67"] = 17,["68"] = 19,["69"] = 20,["70"] = 22,["71"] = 22,["72"] = 22,["73"] = 22,["74"] = 22,["75"] = 24,["76"] = 24,["77"] = 24,["78"] = 24,["79"] = 24,["80"] = 15,["81"] = 9,["82"] = 10,["83"] = 12,["84"] = 9,["85"] = 27,["86"] = 28,["87"] = 31,["89"] = 32,["90"] = 32,["91"] = 33,["92"] = 32,["96"] = 38,["97"] = 39,["98"] = 39,["99"] = 39,["100"] = 39,["102"] = 27,["103"] = 43,["104"] = 44,["105"] = 43,["106"] = 50,["107"] = 51,["108"] = 50,["109"] = 56,["110"] = 58,["111"] = 59,["112"] = 60,["113"] = 60,["114"] = 60,["115"] = 61,["116"] = 60,["117"] = 60,["118"] = 64,["119"] = 66,["122"] = 56,["123"] = 7});
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local reloadable = ____dota_ts_adapter.reloadable
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
    ListenToGameEvent(
        "game_rules_state_change",
        function() return self:OnStateChange() end,
        nil
    )
    ListenToGameEvent(
        "npc_spawned",
        function(event) return self:OnNpcSpawned(event) end,
        nil
    )
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
        Timers:CreateTimer(
            0.2,
            function() return self:StartGame() end
        )
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
        Timers:CreateTimer(
            1,
            function()
                unit:AddNewModifier(nil, nil, "modifier_panic", {duration = 8})
            end
        )
        if not unit:HasAbility("meepo_earthbind_ts_example") then
            unit:AddAbility("meepo_earthbind_ts_example")
        end
    end
end
GameMode = __TS__Decorate({reloadable}, GameMode)
