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

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["50"] = 1,["51"] = 1,["52"] = 4,["53"] = 4,["54"] = 4,["55"] = 4,["56"] = 4,["57"] = 4,["59"] = 4,["61"] = 4,["62"] = 4,["64"] = 4,["65"] = 6,["66"] = 7,["67"] = 6,["68"] = 10,["69"] = 10,["70"] = 10,["71"] = 13,["72"] = 13,["73"] = 13,["74"] = 13,["75"] = 13,["76"] = 13,["77"] = 14,["78"] = 14,["81"] = 13,["83"] = 13,["84"] = 13,["85"] = 16,["86"] = 17,["87"] = 16,["88"] = 23,["89"] = 23,["90"] = 23,["91"] = 26,["92"] = 28,["93"] = 26,["94"] = 32,["95"] = 33,["96"] = 35,["97"] = 35,["98"] = 35,["99"] = 32,["100"] = 13});
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
