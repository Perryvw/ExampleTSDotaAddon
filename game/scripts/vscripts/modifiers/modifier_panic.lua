--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
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

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["23"] = 2,["24"] = 2,["25"] = 2,["26"] = 2,["27"] = 2,["28"] = 2,["36"] = 4,["37"] = 5,["39"] = 8,["40"] = 8,["42"] = 12,["43"] = 12,["44"] = 12,["45"] = 12,["46"] = 12,["47"] = 12,["48"] = 12,["49"] = 12,["50"] = 12,["57"] = 14,["58"] = 15,["60"] = 21,["61"] = 21,["63"] = 24,["64"] = 26,["66"] = 30,["67"] = 31,["68"] = 33,["71"] = 12});
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
registerModifier(nil, "modifier_panic", (function()
    ____ = {}
    ____.name = "____"
    ____.__index = ____
    ____.prototype = {}
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
        parent:MoveToPosition(parent:GetAbsOrigin() + RandomVector(400))
    end
    return ____
end)())
