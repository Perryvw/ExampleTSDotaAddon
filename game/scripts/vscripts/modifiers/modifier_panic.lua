--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 2,["5"] = 2,["6"] = 2,["7"] = 2,["8"] = 2,["9"] = 2,["10"] = 2,["11"] = 2,["12"] = 2,["13"] = 2,["14"] = 2,["15"] = 2,["16"] = 4,["17"] = 4,["18"] = 2,["19"] = 8,["20"] = 8,["21"] = 2,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 12,["26"] = 12,["27"] = 12,["28"] = 12,["29"] = 12,["30"] = 12,["31"] = 12,["32"] = 12,["33"] = 12,["34"] = 12,["35"] = 12,["36"] = 14,["37"] = 14,["38"] = 12,["39"] = 21,["40"] = 21,["41"] = 12,["42"] = 24,["43"] = 24,["44"] = 12,["45"] = 30,["46"] = 30,["47"] = 34,["48"] = 30,["50"] = 38,["51"] = 30,["52"] = 12,["53"] = 12,["54"] = 2});
Modifier_Speed = Modifier_Speed or {}
Modifier_Speed.__index = Modifier_Speed
Modifier_Speed.prototype = Modifier_Speed.prototype or {}
Modifier_Speed.prototype.__index = Modifier_Speed.prototype
Modifier_Speed.prototype.constructor = Modifier_Speed
function Modifier_Speed.new(...)
    local self = setmetatable({}, Modifier_Speed.prototype)
    self:____constructor(...)
    return self
end
function Modifier_Speed.prototype.____constructor(self)
end
function Modifier_Speed.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE}
end
function Modifier_Speed.prototype.GetModifierMoveSpeed_Absolute(self)
    return 300
end
registerModifier(nil, "modifier_panic", (function()
    ____ = ____ or {}
    ____.__index = ____
    ____.prototype = ____.prototype or {}
    ____.prototype.__index = ____.prototype
    ____.prototype.constructor = ____
    ____.____super = Modifier_Speed
    setmetatable(____, ____.____super)
    setmetatable(____.prototype, ____.____super.prototype)
    function ____.new(...)
        local self = setmetatable({}, ____.prototype)
        self:____constructor(...)
        return self
    end
    function ____.prototype.CheckState(self)
        return {[MODIFIER_STATE_COMMAND_RESTRICTED] = true}
    end
    function ____.prototype.GetModifierMoveSpeed_Absolute(self)
        return 540
    end
    function ____.prototype.OnCreated(self, params)
        self:StartIntervalThink(0.3)
    end
    function ____.prototype.OnIntervalThink(self)
        local parent = self:GetParent()
        if parent:GetAbsOrigin():Length2D() < 500 then
            parent:MoveToPosition(parent:GetAbsOrigin() + RandomVector(nil, 400))
        else
            parent:MoveToPosition(RandomVector(nil, 300))
        end
    end
    return ____
end)())
