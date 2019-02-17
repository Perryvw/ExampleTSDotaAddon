--[[ Generated with https://github.com/Perryvw/TypescriptToLua ]]
registerModifier = function(name, modifier)
    local instance = {};
    local prototype = modifier.prototype;
    while prototype do
        do
            for key in pairs(prototype) do
                do
                    if instance[key] == nil then
                        instance[key] = prototype[key];
                    end
                end
                ::__continue3::
            end
            prototype = getmetatable(prototype);
        end
        ::__continue2::
    end
    getfenv(1)[name] = instance;
end;
registerAbility = function(name, ability)
    local instance = {};
    local prototype = ability.prototype;
    while prototype do
        do
            for key in pairs(prototype) do
                do
                    if instance[key] == nil then
                        instance[key] = prototype[key];
                    end
                end
                ::__continue7::
            end
            prototype = getmetatable(prototype);
        end
        ::__continue6::
    end
    getfenv(1)[name] = instance;
end;
