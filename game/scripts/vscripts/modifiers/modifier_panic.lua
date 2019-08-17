--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 4,["7"] = 4,["8"] = 4,["9"] = 4,["10"] = 4,["11"] = 4,["13"] = 4,["15"] = 4,["16"] = 4,["18"] = 4,["19"] = 6,["20"] = 7,["21"] = 6,["22"] = 10,["23"] = 10,["24"] = 10,["25"] = 13,["26"] = 13,["27"] = 13,["28"] = 13,["29"] = 13,["30"] = 13,["31"] = 14,["32"] = 14,["35"] = 13,["37"] = 13,["38"] = 13,["39"] = 16,["40"] = 17,["41"] = 16,["42"] = 23,["43"] = 23,["44"] = 23,["45"] = 26,["46"] = 28,["47"] = 26,["48"] = 32,["49"] = 33,["50"] = 35,["51"] = 35,["52"] = 35,["53"] = 32,["54"] = 13});
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local luaModifier = ____dota_ts_adapter.luaModifier
Modifier_Speed = {}
Modifier_Speed.name = "Modifier_Speed"
Modifier_Speed.__index = Modifier_Speed
Modifier_Speed.prototype = {}
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
modifier_panic = {}
modifier_panic.name = "modifier_panic"
modifier_panic.__index = modifier_panic
modifier_panic.prototype = {}
modifier_panic.prototype.__index = modifier_panic.prototype
modifier_panic.prototype.constructor = modifier_panic
modifier_panic.____super = Modifier_Speed
setmetatable(modifier_panic, modifier_panic.____super)
setmetatable(modifier_panic.prototype, modifier_panic.____super.prototype)
function modifier_panic.new(...)
    local self = setmetatable({}, modifier_panic.prototype)
    self:____constructor(...)
    return self
end
function modifier_panic.prototype.CheckState(self)
    return {[MODIFIER_STATE_COMMAND_RESTRICTED] = true}
end
function modifier_panic.prototype.GetModifierMoveSpeed_Absolute(self)
    return 540
end
function modifier_panic.prototype.OnCreated(self, params)
    self:StartIntervalThink(0.3)
end
function modifier_panic.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    parent:MoveToPosition(
        parent:GetAbsOrigin() + RandomVector(400)
    )
end
modifier_panic = __TS__Decorate({luaModifier}, modifier_panic)
