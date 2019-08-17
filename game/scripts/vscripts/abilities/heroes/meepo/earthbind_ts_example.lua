--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 3,["7"] = 3,["8"] = 3,["9"] = 3,["10"] = 3,["11"] = 3,["13"] = 3,["15"] = 3,["16"] = 3,["18"] = 3,["19"] = 7,["20"] = 8,["21"] = 9,["22"] = 10,["23"] = 11,["24"] = 12,["25"] = 13,["28"] = 16,["29"] = 7,["30"] = 19,["31"] = 20,["32"] = 21,["34"] = 23,["35"] = 19,["36"] = 26,["37"] = 27,["38"] = 26,["39"] = 30,["40"] = 31,["41"] = 32,["42"] = 33,["43"] = 35,["44"] = 36,["45"] = 37,["46"] = 39,["47"] = 40,["48"] = 46,["49"] = 46,["50"] = 46,["51"] = 46,["52"] = 46,["53"] = 47,["54"] = 48,["55"] = 48,["56"] = 48,["57"] = 48,["58"] = 48,["59"] = 50,["60"] = 50,["61"] = 50,["62"] = 50,["63"] = 50,["64"] = 50,["65"] = 50,["66"] = 50,["67"] = 50,["68"] = 50,["69"] = 50,["70"] = 50,["71"] = 50,["72"] = 50,["73"] = 50,["74"] = 50,["75"] = 50,["76"] = 50,["77"] = 50,["78"] = 69,["79"] = 30,["80"] = 72,["81"] = 74,["82"] = 75,["83"] = 76,["84"] = 78,["85"] = 78,["86"] = 78,["87"] = 78,["88"] = 78,["89"] = 78,["90"] = 78,["91"] = 78,["92"] = 78,["93"] = 78,["94"] = 78,["95"] = 89,["96"] = 90,["97"] = 91,["99"] = 93,["100"] = 94,["101"] = 95,["102"] = 72,["103"] = 3});
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local luaAbility = ____dota_ts_adapter.luaAbility
meepo_earthbind_ts_example = {}
meepo_earthbind_ts_example.name = "meepo_earthbind_ts_example"
meepo_earthbind_ts_example.__index = meepo_earthbind_ts_example
meepo_earthbind_ts_example.prototype = {}
meepo_earthbind_ts_example.prototype.__index = meepo_earthbind_ts_example.prototype
meepo_earthbind_ts_example.prototype.constructor = meepo_earthbind_ts_example
function meepo_earthbind_ts_example.new(...)
    local self = setmetatable({}, meepo_earthbind_ts_example.prototype)
    self:____constructor(...)
    return self
end
function meepo_earthbind_ts_example.prototype.____constructor(self)
end
function meepo_earthbind_ts_example.prototype.GetCooldown(self)
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
function meepo_earthbind_ts_example.prototype.OnAbilityPhaseStart(self)
    if IsServer() then
        self:GetCaster():EmitSound("Hero_Meepo.Earthbind.Cast")
    end
    return true
end
function meepo_earthbind_ts_example.prototype.OnAbilityPhaseInterrupted(self)
    self:GetCaster():StopSound("Hero_Meepo.Earthbind.Cast")
end
function meepo_earthbind_ts_example.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local projectileSpeed = self:GetSpecialValueFor("speed")
    local direction = (point - caster:GetAbsOrigin()):Normalized()
    direction.z = 0
    local distance = (point - caster:GetAbsOrigin()):Length()
    local radius = self:GetSpecialValueFor("radius")
    self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_meepo/meepo_earthbind_projectile_fx.vpcf", PATTACH_CUSTOMORIGIN, caster)
    ParticleManager:SetParticleControl(
        self.particle,
        0,
        caster:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(self.particle, 1, point)
    ParticleManager:SetParticleControl(
        self.particle,
        2,
        Vector(projectileSpeed, 0, 0)
    )
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
        iVisionTeamNumber = caster:GetTeamNumber()
    }
    ProjectileManager:CreateLinearProjectile(projectileTable)
end
function meepo_earthbind_ts_example.prototype.OnProjectileHit(self, target, location)
    local caster = self:GetCaster()
    local duration = self:GetSpecialValueFor("duration")
    local radius = self:GetSpecialValueFor("radius")
    local units = FindUnitsInRadius(
        caster:GetTeamNumber(),
        location,
        nil,
        radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        bit.bor(DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_HERO),
        DOTA_UNIT_TARGET_FLAG_NONE,
        0,
        false
    )
    for ____, unit in ipairs(units) do
        unit:AddNewModifier(caster, self, "modifier_meepo_earthbind", {duration = duration})
        unit:EmitSound("Hero_Meepo.Earthbind.Target")
    end
    ParticleManager:DestroyParticle(self.particle, false)
    ParticleManager:ReleaseParticleIndex(self.particle)
    return true
end
meepo_earthbind_ts_example = __TS__Decorate({luaAbility}, meepo_earthbind_ts_example)
