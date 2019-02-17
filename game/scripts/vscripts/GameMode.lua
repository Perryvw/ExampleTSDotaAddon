--[[ Generated with https://github.com/Perryvw/TypescriptToLua ]]
LinkLuaModifier("modifier_panic", "modifiers/modifier_panic.lua", LUA_MODIFIER_MOTION_NONE);
local HeroSelectionTime = 10;
GameMode = GameMode or {};
GameMode.__index = GameMode;
GameMode.prototype = GameMode.prototype or {};
GameMode.prototype.__index = GameMode.prototype;
GameMode.prototype.constructor = GameMode;
GameMode.new = function(...)
    local self = setmetatable({}, GameMode.prototype);
    self:____constructor(...);
    return self;
end;
GameMode.prototype.____constructor = function(self)
    GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_GOODGUYS, 3);
    GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_BADGUYS, 3);
    GameRules:SetShowcaseTime(0);
    GameRules:SetHeroSelectionTime(HeroSelectionTime);
    ListenToGameEvent("game_rules_state_change", function()
        return self:OnStateChange();
    end, nil);
    ListenToGameEvent("npc_spawned", function(event)
        return self:OnNpcSpawned(event);
    end, nil);
end;
GameMode.prototype.OnStateChange = function(self)
    local state = GameRules:State_Get();
    if IsInToolsMode() and (state == DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP) then
        local i = 0;
        while i < 4 do
            do
                Tutorial:AddBot("npc_dota_hero_lina", "", "", false);
            end
            ::__continue6::
            i = i + 1;
        end
    end
    if state == DOTA_GAMERULES_STATE_PRE_GAME then
        Timers:CreateTimer(0.2, function()
            return self:StartGame();
        end);
    end
end;
GameMode.prototype.StartGame = function(self)
    print("Game starting!");
end;
GameMode.prototype.Reload = function(self)
    print("Script reloaded!");
end;
GameMode.prototype.OnNpcSpawned = function(self, event)
    local unit = EntIndexToHScript(event.entindex);
    if unit:IsRealHero() then
        Timers:CreateTimer(1, function()
            unit:AddNewModifier(nil, nil, "modifier_panic", {duration = 8});
        end);
        unit:AddAbility("meepo_earthbind_ts_example");
    end
end;
