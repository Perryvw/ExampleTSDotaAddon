--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 3,["7"] = 5,["8"] = 7,["9"] = 7,["10"] = 7,["11"] = 7,["12"] = 7,["13"] = 7,["15"] = 7,["17"] = 7,["18"] = 7,["20"] = 16,["21"] = 17,["22"] = 19,["23"] = 20,["24"] = 22,["25"] = 22,["26"] = 22,["27"] = 22,["28"] = 22,["29"] = 24,["30"] = 24,["31"] = 24,["32"] = 24,["33"] = 24,["34"] = 15,["35"] = 9,["36"] = 10,["37"] = 12,["38"] = 9,["39"] = 27,["40"] = 28,["41"] = 31,["43"] = 32,["44"] = 32,["45"] = 33,["46"] = 32,["50"] = 38,["51"] = 39,["52"] = 39,["53"] = 39,["54"] = 39,["56"] = 27,["57"] = 43,["58"] = 44,["59"] = 43,["60"] = 50,["61"] = 51,["62"] = 50,["63"] = 56,["64"] = 58,["65"] = 59,["66"] = 60,["67"] = 60,["68"] = 60,["69"] = 61,["70"] = 60,["71"] = 60,["72"] = 64,["73"] = 66,["76"] = 56,["77"] = 7});
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
