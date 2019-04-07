--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 3,["5"] = 1,["6"] = 1,["7"] = 7,["8"] = 9,["9"] = 7,["10"] = 7,["11"] = 7,["12"] = 7,["13"] = 1,["14"] = 20,["15"] = 20,["16"] = 20,["17"] = 23,["18"] = 24,["19"] = 25,["20"] = 24,["21"] = 24,["22"] = 23,["23"] = 23,["24"] = 20,["25"] = 20,["26"] = 1,["27"] = 34,["28"] = 34,["29"] = 34,["30"] = 37,["31"] = 38,["32"] = 39,["33"] = 38,["34"] = 38,["35"] = 37,["36"] = 37,["37"] = 34,["38"] = 34,["39"] = 1});
if _G.reloadCache == nil then
    _G.reloadCache = {}
end
function reloadable(self, className, constructor)
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
        prototype = getmetatable(nil, prototype)
    end
    getfenv(nil, 1)[name] = instance
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
        prototype = getmetatable(nil, prototype)
    end
    getfenv(nil, 1)[name] = instance
end
