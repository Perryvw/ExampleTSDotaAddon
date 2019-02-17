declare const _G: {[key: string]: any};
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
    _G[name] = instance;
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
    _G[name] = instance;
}
