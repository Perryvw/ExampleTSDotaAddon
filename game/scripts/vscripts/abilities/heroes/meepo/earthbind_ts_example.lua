--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 1,["15"] = 1,["16"] = 1,["17"] = 4,["18"] = 4,["19"] = 4,["20"] = 7,["21"] = 4,["22"] = 9,["23"] = 4,["24"] = 4,["25"] = 4,["26"] = 4,["27"] = 1,["28"] = 16,["29"] = 16,["30"] = 16,["31"] = 1,["32"] = 21,["33"] = 21,["34"] = 1,["35"] = 25,["36"] = 25,["37"] = 25,["38"] = 25,["39"] = 25,["40"] = 25,["41"] = 25,["42"] = 25,["43"] = 25,["44"] = 25,["45"] = 25,["46"] = 25,["47"] = 25,["48"] = 25,["49"] = 43,["50"] = 43,["51"] = 43,["52"] = 43,["53"] = 43,["54"] = 43,["55"] = 43,["56"] = 43,["57"] = 43,["58"] = 43,["59"] = 43,["60"] = 43,["61"] = 43,["62"] = 43,["63"] = 43,["64"] = 43,["65"] = 43,["66"] = 43,["67"] = 25,["68"] = 25,["69"] = 1,["70"] = 65,["71"] = 65,["72"] = 65,["73"] = 65,["74"] = 65,["75"] = 65,["76"] = 65,["77"] = 65,["78"] = 65,["79"] = 65,["80"] = 65,["81"] = 65,["82"] = 65,["83"] = 1,["84"] = 1,["85"] = 1});
registerAbility(nil, "meepo_earthbind_ts_example", (function()
    ____ = ____ or {}
    ____.__index = ____
    ____.prototype = ____.prototype or {}
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
        if IsServer(nil) then
            local talent = self:GetCaster():FindAbilityByName("special_bonus_unique_meepo_3")
            if talent then
                cooldown = cooldown - talent:GetSpecialValueFor("value")
            end
        end
        return cooldown
    end
    function ____.prototype.OnAbilityPhaseStart(self)
        self:GetCaster():EmitSound("Hero_Meepo.Earthbind.Cast")
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
        self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_meepo/meepo_earthbind_projectile_fx.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
        ParticleManager:SetParticleControl(self.particle, 0, caster:GetAbsOrigin())
        ParticleManager:SetParticleControl(self.particle, 1, point)
        ParticleManager:SetParticleControl(self.particle, 2, Vector(nil, projectileSpeed, 0, 0))
        ParticleManager:SetParticleControl(self.particle, 3, point)
        caster:EmitSound("Hero_Meepo.Earthbind.Cast")
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
        local units = FindUnitsInRadius(nil, caster:GetTeamNumber(), location, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, 0, false)
        for ____TS_index = 1, #units do
            local unit = units[____TS_index]
            unit:AddNewModifier(caster, self, "modifier_meepo_earthbind_lua", {duration = duration})
            unit:EmitSound("Hero_Meepo.Earthbind.Target")
        end
        ParticleManager:DestroyParticle(self.particle, false)
        ParticleManager:ReleaseParticleIndex(self.particle)
        return true
    end
    return ____
end)())
