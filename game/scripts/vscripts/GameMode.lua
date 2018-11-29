
-- Lua Library Imports
function __TS__ArrayForEach(arr,callbackFn)
    local i = 0
    while(i<#arr) do
        do
            callbackFn(arr[(i)+1],i,arr);
        end
        i = (i+1)
    end
end

local HeroSelectionTime = 10;
GameMode = GameMode or {}
GameMode.__index = GameMode
function GameMode.new(construct, ...)
    local self = setmetatable({}, GameMode)
    if construct and GameMode.constructor then GameMode.constructor(self, ...) end
    return self
end
function GameMode.constructor(self)
    GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_GOODGUYS,3);
    GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_BADGUYS,3);
    GameRules:SetShowcaseTime(0);
    GameRules:SetHeroSelectionTime(HeroSelectionTime);
    ListenToGameEvent("game_rules_state_change",function() return self:OnStateChange() end,nil);
end
function GameMode.OnStateChange(self)
    local state = GameRules:State_Get();
    if IsInToolsMode() and (state==DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP) then
        local i = 0
        while(i<4) do
            do
                Tutorial:AddBot("npc_dota_hero_lina","","",false);
            end
            ::__continue0::
            i = (i+1)
        end
    end
    if state==DOTA_GAMERULES_STATE_PRE_GAME then
        Timers:CreateTimer(0.2,function() return self:StartGame() end);
    end
end
function GameMode.StartGame(self)
    self:PositionHeroes();
    GameRules:GetGameModeEntity():SetExecuteOrderFilter(function(ctx,order) return order.issuer_player_id_const==-1 end,self);
end
function GameMode.Reload(self)
    print("Reload");
end
function GameMode.PositionHeroes(self)
    local heroes = HeroList:GetAllHeroes();
    local dAngle = (2*math.pi)/15;
    local scale = 15/#heroes;
    __TS__ArrayForEach(heroes, function(hero,index)
        local quadrant = math.floor(index*scale);
        local direction = Vector(math.cos(quadrant*dAngle),math.sin(quadrant*dAngle));
        hero:SetAbsOrigin(GetGroundPosition(direction*600,hero));
        hero:SetForwardVector(-direction);
    end
);
end
