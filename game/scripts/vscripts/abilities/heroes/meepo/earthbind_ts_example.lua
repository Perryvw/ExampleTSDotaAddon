--[[ Generated with https://github.com/Perryvw/TypescriptToLua ]]
registerAbility("meepo_earthbind_ts_example", (function()
    ____ = ____ or {};
    ____.__index = ____;
    ____.prototype = ____.prototype or {};
    ____.prototype.__index = ____.prototype;
    ____.prototype.constructor = ____;
    ____.new = function(...)
        local self = setmetatable({}, ____.prototype);
        self:____constructor(...);
        return self;
    end;
    ____.prototype.____constructor = function(self)
    end;
    ____.prototype.GetCooldown = function(self)
        local caster = self:GetCaster();
        local cooldown = self:GetSpecialValueFor("cooldown");
        if IsServer() then
            local talent = self:GetCaster():FindAbilityByName("special_bonus_unique_meepo_3");
            if talent then
                cooldown = cooldown - talent:GetSpecialValueFor("value");
            end
        end
        return cooldown;
    end;
    ____.prototype.OnAbilityPhaseStart = function(self)
        self:GetCaster():EmitSound("Hero_Meepo.Earthbind.Cast");
        return true;
    end;
    ____.prototype.OnAbilityPhaseInterrupted = function(self)
        self:GetCaster():StopSound("Hero_Meepo.Earthbind.Cast");
    end;
    ____.prototype.OnSpellStart = function(self)
        local caster = self:GetCaster();
        local point = self:GetCursorPosition();
        local projectileSpeed = self:GetSpecialValueFor("speed");
        local direction = (point - caster:GetAbsOrigin()):Normalized();
        direction.z = 0;
        local distance = (point - caster:GetAbsOrigin()):Length();
        local radius = self:GetSpecialValueFor("radius");
        self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_meepo/meepo_earthbind_projectile_fx.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster);
        ParticleManager:SetParticleControl(self.particle, 0, caster:GetAbsOrigin());
        ParticleManager:SetParticleControl(self.particle, 1, point);
        ParticleManager:SetParticleControl(self.particle, 2, Vector(projectileSpeed, 0, 0));
        ParticleManager:SetParticleControl(self.particle, 3, point);
        caster:EmitSound("Hero_Meepo.Earthbind.Cast");
        local projectileTable = {Ability = self, EffectName = "", vSpawnOrigin = caster:GetAbsOrigin(), fDistance = distance, fStartRadius = radius, fEndRadius = radius, Source = caster, bHasFrontalCone = false, bReplaceExisting = false, iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_NONE, iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE, iUnitTargetType = DOTA_UNIT_TARGET_NONE, bDeleteOnHit = false, vVelocity = direction * projectileSpeed, bProvidesVision = true, iVisionRadius = radius, iVisionTeamNumber = caster:GetTeamNumber()};
        ProjectileManager:CreateLinearProjectile(projectileTable);
    end;
    ____.prototype.OnProjectileHit = function(self, target, location)
        local caster = self:GetCaster();
        local duration = self:GetSpecialValueFor("duration");
        local radius = self:GetSpecialValueFor("radius");
        local units = FindUnitsInRadius(caster:GetTeamNumber(), location, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, 0, false);
        for ____TS_index = 1, #units do
            local unit = units[____TS_index];
            do
                unit:AddNewModifier(caster, self, "modifier_meepo_earthbind_lua", {duration = duration});
                unit:EmitSound("Hero_Meepo.Earthbind.Target");
            end
            ::__continue9::
        end
        ParticleManager:DestroyParticle(self.particle, false);
        ParticleManager:ReleaseParticleIndex(self.particle);
        return true;
    end;
    return ____;
end)());
