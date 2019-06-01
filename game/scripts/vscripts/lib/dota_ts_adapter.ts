if (_G.reloadCache === undefined) {
    _G.reloadCache = {}
}

function reloadable<T extends {new(...args: any[]): {}}>(constructor: T): T {
    const className = constructor.name;
    if (_G.reloadCache[className] === undefined) {
        _G.reloadCache[className] = constructor;
    }

    Object.assign(_G.reloadCache[className].prototype, constructor.prototype);
    return _G.reloadCache[className];
}

declare function getfenv(this: void, obj: any): {[key: string]: any};
declare function getmetatable(this: void, obj: object): object;

function registerModifier(name: string, modifier: new () => CDOTA_Modifier_Lua) {
    const instance: any = {};
    let prototype = modifier.prototype;
    while (prototype) {
        for (const key in prototype) {
            if (instance[key] === undefined) {
                instance[key] = prototype[key];
            }
        }
        prototype = getmetatable(prototype);
    }
    getfenv(1)[name] = instance;
}

function registerAbility(name: string, ability: new () => CDOTA_Ability_Lua) {
    const instance: any = {};
    let prototype = ability.prototype;
    while (prototype) {
        for (const key in prototype) {
            if (instance[key] === undefined) {
                instance[key] = prototype[key];
            }
        }
        prototype = getmetatable(prototype);
    }
    getfenv(1)[name] = instance;
}