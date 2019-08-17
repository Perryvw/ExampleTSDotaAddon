--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
function __TS__Decorate(decorators, target, key, desc)
    local result = target
    do
        local i = #decorators
        while i >= 0 do
            local decorator = decorators[i + 1]
            if decorator then
                local oldResult = result
                if key == nil then
                    result = decorator(_G, result)
                elseif desc ~= nil then
                    result = decorator(_G, target, key, result)
                else
                    result = decorator(_G, target, key)
                end
                result = result or oldResult
            end
            i = i - 1
        end
    end
    return result
end

function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or {}
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        _G.__TS__originalTraceback = debug.traceback
        debug.traceback = function(thread, message, level)
            local trace = _G.__TS__originalTraceback(thread, message, level)
            local result = string.gsub(
                trace,
                "(%S+).lua:(%d+)",
                function(file, line)
                    local fileSourceMap = _G.__TS__sourcemap[tostring(file) .. ".lua"]
                    if fileSourceMap and fileSourceMap[line] then
                        return tostring(file) .. ".ts:" .. tostring(fileSourceMap[line])
                    end
                    return tostring(file) .. ".lua:" .. tostring(line)
                end
            )
            return result
        end
    end
end

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["50"] = 1,["51"] = 1,["52"] = 3,["53"] = 3,["54"] = 3,["55"] = 3,["56"] = 3,["57"] = 3,["59"] = 3,["61"] = 3,["62"] = 3,["64"] = 3,["65"] = 7,["66"] = 8,["67"] = 9,["68"] = 10,["69"] = 11,["70"] = 12,["71"] = 13,["74"] = 16,["75"] = 7,["76"] = 19,["77"] = 20,["78"] = 21,["80"] = 23,["81"] = 19,["82"] = 26,["83"] = 27,["84"] = 26,["85"] = 30,["86"] = 31,["87"] = 32,["88"] = 33,["89"] = 35,["90"] = 36,["91"] = 37,["92"] = 39,["93"] = 40,["94"] = 46,["95"] = 46,["96"] = 46,["97"] = 46,["98"] = 46,["99"] = 47,["100"] = 48,["101"] = 48,["102"] = 48,["103"] = 48,["104"] = 48,["105"] = 50,["106"] = 50,["107"] = 50,["108"] = 50,["109"] = 50,["110"] = 50,["111"] = 50,["112"] = 50,["113"] = 50,["114"] = 50,["115"] = 50,["116"] = 50,["117"] = 50,["118"] = 50,["119"] = 50,["120"] = 50,["121"] = 50,["122"] = 50,["123"] = 50,["124"] = 69,["125"] = 30,["126"] = 72,["127"] = 74,["128"] = 75,["129"] = 76,["130"] = 78,["131"] = 78,["132"] = 78,["133"] = 78,["134"] = 78,["135"] = 78,["136"] = 78,["137"] = 78,["138"] = 78,["139"] = 78,["140"] = 78,["141"] = 89,["142"] = 90,["143"] = 91,["145"] = 93,["146"] = 94,["147"] = 95,["148"] = 72,["149"] = 3});
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
