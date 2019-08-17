--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["8"] = 5,["9"] = 6,["10"] = 7,["11"] = 8,["13"] = 11,["14"] = 12,["15"] = 5,["16"] = 18,["17"] = 19,["18"] = 20,["19"] = 21,["20"] = 22,["21"] = 23,["22"] = 24,["25"] = 27,["27"] = 29,["28"] = 30,["29"] = 18,["30"] = 33,["31"] = 34,["32"] = 35,["33"] = 36,["34"] = 37,["35"] = 38,["36"] = 39,["39"] = 42,["41"] = 44,["42"] = 45,["43"] = 33});
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
