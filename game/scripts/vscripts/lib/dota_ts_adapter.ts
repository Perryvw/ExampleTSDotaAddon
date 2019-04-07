declare const _G: any;

if (_G.reloadCache === undefined) {
    _G.reloadCache = {}
}

function reloadable<T extends {new(...args: any[]): {}}>(className: string, constructor: T): T {

    if (_G.reloadCache[className] === undefined) {
        _G.reloadCache[className] = constructor;
    }

    Object.assign(_G.reloadCache[className].prototype, constructor.prototype);
    return _G.reloadCache[className];
}

declare function getfenv(obj: any): {[key: string]: any};
declare function getmetatable(obj: object): object;

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