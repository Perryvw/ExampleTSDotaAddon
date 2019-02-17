--[[ Generated with https://github.com/Perryvw/TypescriptToLua ]]
Modifier_Speed = Modifier_Speed or {};
Modifier_Speed.__index = Modifier_Speed;
Modifier_Speed.prototype = Modifier_Speed.prototype or {};
Modifier_Speed.prototype.__index = Modifier_Speed.prototype;
Modifier_Speed.prototype.constructor = Modifier_Speed;
Modifier_Speed.new = function(...)
    local self = setmetatable({}, Modifier_Speed.prototype);
    self:____constructor(...);
    return self;
end;
Modifier_Speed.prototype.____constructor = function(self)
end;
Modifier_Speed.prototype.DeclareFunctions = function(self)
    return {MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE};
end;
Modifier_Speed.prototype.GetModifierMoveSpeed_Absolute = function(self)
    return 300;
end;
registerModifier("modifier_panic", (function()
    ____ = ____ or {};
    ____.__index = ____;
    ____.prototype = ____.prototype or {};
    ____.prototype.__index = ____.prototype;
    ____.prototype.constructor = ____;
    ____.____super = Modifier_Speed;
    setmetatable(____, ____.____super);
    setmetatable(____.prototype, ____.____super.prototype);
    ____.new = function(...)
        local self = setmetatable({}, ____.prototype);
        self:____constructor(...);
        return self;
    end;
    ____.prototype.CheckState = function(self)
        return {[MODIFIER_STATE_COMMAND_RESTRICTED] = true};
    end;
    ____.prototype.GetModifierMoveSpeed_Absolute = function(self)
        return 540;
    end;
    ____.prototype.OnCreated = function(self, params)
        self:StartIntervalThink(0.3);
    end;
    ____.prototype.OnIntervalThink = function(self)
        local parent = self:GetParent();
        if parent:GetAbsOrigin():Length2D() < 500 then
            parent:MoveToPosition(parent:GetAbsOrigin() + RandomVector(400));
        else
            parent:MoveToPosition(RandomVector(300));
        end
    end;
    return ____;
end)());
