--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
function __TS__ObjectAssign(to, ...)
    local sources = ({...})
    if to == nil then
        return to
    end
    for ____, source in ipairs(sources) do
        for key in pairs(source) do
            to[key] = source[key]
        end
    end
    return to
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

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["41"] = 1,["42"] = 2,["44"] = 5,["45"] = 6,["46"] = 7,["47"] = 8,["49"] = 11,["50"] = 12,["51"] = 5,["52"] = 18,["53"] = 19,["54"] = 20,["55"] = 21,["56"] = 22,["57"] = 23,["58"] = 24,["61"] = 27,["63"] = 29,["64"] = 30,["65"] = 18,["66"] = 33,["67"] = 34,["68"] = 35,["69"] = 36,["70"] = 37,["71"] = 38,["72"] = 39,["75"] = 42,["77"] = 44,["78"] = 45,["79"] = 33});
local ____exports = {}
if _G.reloadCache == nil then
    _G.reloadCache = {}
end
function ____exports.reloadable(self, constructor)
    local className = constructor.name
    if _G.reloadCache[className] == nil then
        _G.reloadCache[className] = constructor
    end
    __TS__ObjectAssign(_G.reloadCache[className].prototype, constructor.prototype)
    return _G.reloadCache[className]
end
function ____exports.luaModifier(self, modifier)
    local instance = {}
    local prototype = modifier.prototype
    while prototype do
        for key in pairs(prototype) do
            if instance[key] == nil then
                instance[key] = prototype[key]
            end
        end
        prototype = getmetatable(prototype)
    end
    getfenv(1)[modifier.name] = instance
    return instance
end
function ____exports.luaAbility(self, ability)
    local instance = {}
    local prototype = ability.prototype
    while prototype do
        for key in pairs(prototype) do
            if instance[key] == nil then
                instance[key] = prototype[key]
            end
        end
        prototype = getmetatable(prototype)
    end
    getfenv(1)[ability.name] = instance
    return instance
end
return ____exports
