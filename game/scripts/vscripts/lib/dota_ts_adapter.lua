--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
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

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["37"] = 1,["38"] = 2,["40"] = 5,["41"] = 6,["42"] = 7,["43"] = 8,["45"] = 11,["46"] = 12,["48"] = 18,["49"] = 19,["50"] = 20,["51"] = 21,["52"] = 22,["53"] = 23,["54"] = 24,["57"] = 27,["59"] = 29,["61"] = 32,["62"] = 33,["63"] = 34,["64"] = 35,["65"] = 36,["66"] = 37,["67"] = 38,["70"] = 41,["72"] = 43});
if _G.reloadCache == nil then
    _G.reloadCache = {}
end
function reloadable(self, constructor)
    local className = constructor.name
    if _G.reloadCache[className] == nil then
        _G.reloadCache[className] = constructor
    end
    __TS__ObjectAssign(_G.reloadCache[className].prototype, constructor.prototype)
    return _G.reloadCache[className]
end
function registerModifier(self, name, modifier)
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
    getfenv(1)[name] = instance
end
function registerAbility(self, name, ability)
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
    getfenv(1)[name] = instance
end
