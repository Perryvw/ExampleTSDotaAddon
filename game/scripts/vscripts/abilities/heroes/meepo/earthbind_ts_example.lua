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

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["23"] = 1,["24"] = 1,["25"] = 1,["26"] = 1,["27"] = 1,["28"] = 1,["29"] = 1,["37"] = 4,["38"] = 5,["39"] = 6,["40"] = 7,["41"] = 8,["42"] = 9,["43"] = 10,["46"] = 13,["48"] = 16,["49"] = 17,["50"] = 18,["52"] = 20,["54"] = 23,["55"] = 24,["57"] = 27,["58"] = 28,["59"] = 29,["60"] = 30,["61"] = 32,["62"] = 33,["63"] = 34,["64"] = 36,["65"] = 37,["66"] = 43,["67"] = 44,["68"] = 45,["69"] = 47,["70"] = 48,["71"] = 49,["72"] = 51,["73"] = 53,["74"] = 53,["75"] = 53,["76"] = 53,["77"] = 53,["78"] = 53,["79"] = 53,["80"] = 53,["81"] = 53,["82"] = 53,["83"] = 53,["84"] = 53,["85"] = 53,["86"] = 53,["87"] = 53,["88"] = 53,["89"] = 53,["90"] = 53,["91"] = 53,["92"] = 72,["94"] = 75,["95"] = 77,["96"] = 78,["97"] = 79,["98"] = 81,["99"] = 82,["100"] = 84,["101"] = 95,["102"] = 96,["103"] = 97,["105"] = 99,["106"] = 100,["107"] = 101,["110"] = 1});
registerAbility(nil, "meepo_earthbind_ts_example", (function()
    ____ = {}
    ____.name = "____"
    ____.__index = ____
    ____.prototype = {}
    ____.prototype.__index = ____.prototype
    ____.prototype.constructor = ____
    function ____.new(...)
        local self = setmetatable({}, ____.prototype)
        self:____constructor(...)
        return self
    end
    function ____.prototype.____constructor(self)
    end
    function ____.prototype.GetCooldown(self)
        local caster = self:GetCaster()
        local cooldown = self:GetSpecialValueFor("cooldown")
        if IsServer() then
            local talent = self:GetCaster():FindAbilityByName("special_bonus_unique_meepo_3")
            if talent then
                cooldown = cooldown - talent:GetSpecialValueFor("value")
            end
        end
        return cooldown
    end
    function ____.prototype.OnAbilityPhaseStart(self)
        if IsServer() then
            self:GetCaster():EmitSound("Hero_Meepo.Earthbind.Cast")
        end
        return true
    end
    function ____.prototype.OnAbilityPhaseInterrupted(self)
        self:GetCaster():StopSound("Hero_Meepo.Earthbind.Cast")
    end
    function ____.prototype.OnSpellStart(self)
        local caster = self:GetCaster()
        local point = self:GetCursorPosition()
        local projectileSpeed = self:GetSpecialValueFor("speed")
        local direction = point - caster:GetAbsOrigin():Normalized()
        direction.z = 0
        local distance = point - caster:GetAbsOrigin():Length()
        local radius = self:GetSpecialValueFor("radius")
        self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_meepo/meepo_earthbind_projectile_fx.vpcf", PATTACH_CUSTOMORIGIN, caster)
        print("caster", caster:GetAbsOrigin())
        print("point", point)
        print("speed", projectileSpeed)
        ParticleManager:SetParticleControl(self.particle, 0, caster:GetAbsOrigin())
        ParticleManager:SetParticleControl(self.particle, 1, point)
        ParticleManager:SetParticleControl(self.particle, 2, Vector(projectileSpeed, 0, 0))
        print(distance, radius)
        local projectileTable = {
            Ability = self,
            EffectName = "",
            vSpawnOrigin = caster:GetAbsOrigin(),
            fDistance = distance,
            fStartRadius = radius,
            fEndRadius = radius,
            Source = caster,
            bHasFrontalCone = false,
            bReplaceExisting = false,
            iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_NONE,
            iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
            iUnitTargetType = DOTA_UNIT_TARGET_NONE,
            bDeleteOnHit = false,
            vVelocity = direction * projectileSpeed,
            bProvidesVision = true,
            iVisionRadius = radius,
            iVisionTeamNumber = caster:GetTeamNumber(),
        }
        ProjectileManager:CreateLinearProjectile(projectileTable)
    end
    function ____.prototype.OnProjectileHit(self, target, location)
        local caster = self:GetCaster()
        local duration = self:GetSpecialValueFor("duration")
        local radius = self:GetSpecialValueFor("radius")
        print("location", location)
        print("radius", radius)
        local units = FindUnitsInRadius(caster:GetTeamNumber(), location, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, bit.bor(DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_HERO), DOTA_UNIT_TARGET_FLAG_NONE, 0, false)
        for ____, unit in ipairs(units) do
            unit:AddNewModifier(caster, self, "modifier_meepo_earthbind", {duration = duration})
            unit:EmitSound("Hero_Meepo.Earthbind.Target")
        end
        ParticleManager:DestroyParticle(self.particle, false)
        ParticleManager:ReleaseParticleIndex(self.particle)
        return true
    end
    return ____
end)())
