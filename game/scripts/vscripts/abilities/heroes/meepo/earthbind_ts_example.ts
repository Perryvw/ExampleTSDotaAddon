registerAbility("meepo_earthbind_ts_example", class extends CDOTA_Ability_Lua {
    particle:ParticleID

    GetCooldown() {
        let caster:CDOTA_BaseNPC = this.GetCaster()
        let cooldown = this.GetSpecialValueFor("cooldown")
        if (IsServer()) {
            let talent:CDOTABaseAbility = this.GetCaster().FindAbilityByName("special_bonus_unique_meepo_3")
            if (talent) {
                cooldown -= talent.GetSpecialValueFor("value")
            }
        }
        return cooldown
    }

    OnAbilityPhaseStart() {
        if (IsServer()) {
            this.GetCaster().EmitSound("Hero_Meepo.Earthbind.Cast")
        }
        return true;
    }

    OnAbilityPhaseInterrupted() {
        this.GetCaster().StopSound("Hero_Meepo.Earthbind.Cast")
    }

    OnSpellStart() {
        let caster = this.GetCaster();
        let point = this.GetCursorPosition();
        let projectileSpeed = this.GetSpecialValueFor("speed");

        const direction = (point - caster.GetAbsOrigin() as Vector).Normalized();
        direction.z = 0;
        const distance = (point - caster.GetAbsOrigin() as Vector).Length();

        let radius = this.GetSpecialValueFor("radius");
        this.particle = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_meepo/meepo_earthbind_projectile_fx.vpcf",
            ParticleAttachment_t.PATTACH_CUSTOMORIGIN,
            caster
        );

        print("caster", caster.GetAbsOrigin());
        print("point", point);
        print("speed", projectileSpeed);

        ParticleManager.SetParticleControl(this.particle, 0, caster.GetAbsOrigin());
        ParticleManager.SetParticleControl(this.particle, 1, point);
        ParticleManager.SetParticleControl(this.particle, 2, Vector(projectileSpeed, 0, 0));

        print(distance, radius);

        let projectileTable:LinearProjectileTable = {
            Ability: this,
            EffectName: "",
            vSpawnOrigin: caster.GetAbsOrigin(),
            fDistance: distance,
            fStartRadius: radius,
            fEndRadius: radius,
            Source: caster,
            bHasFrontalCone: false,
            bReplaceExisting: false,
            iUnitTargetTeam: DOTA_UNIT_TARGET_TEAM.DOTA_UNIT_TARGET_TEAM_NONE,
            iUnitTargetFlags: DOTA_UNIT_TARGET_FLAGS.DOTA_UNIT_TARGET_FLAG_NONE,
            iUnitTargetType: DOTA_UNIT_TARGET_TYPE.DOTA_UNIT_TARGET_NONE,
            bDeleteOnHit: false,
            vVelocity: direction * projectileSpeed as Vector,
            bProvidesVision: true,
            iVisionRadius: radius,
            iVisionTeamNumber: caster.GetTeamNumber(),
        }
        ProjectileManager.CreateLinearProjectile(projectileTable)
    }

    OnProjectileHit(target: CDOTA_BaseNPC, location: Vector) {

        let caster = this.GetCaster()
        let duration = this.GetSpecialValueFor("duration")
        let radius = this.GetSpecialValueFor("radius")

        print("location", location);
        print("radius", radius)

        let units = FindUnitsInRadius(
            caster.GetTeamNumber(),
            location,
            null,
            radius,
            DOTA_UNIT_TARGET_TEAM.DOTA_UNIT_TARGET_TEAM_ENEMY,
            DOTA_UNIT_TARGET_TYPE.DOTA_UNIT_TARGET_BASIC | DOTA_UNIT_TARGET_TYPE.DOTA_UNIT_TARGET_HERO,
            DOTA_UNIT_TARGET_FLAGS.DOTA_UNIT_TARGET_FLAG_NONE,
            0,
            false
        )
        for (let unit of units) {
            unit.AddNewModifier(caster,this,"modifier_meepo_earthbind",{duration: duration})
            unit.EmitSound("Hero_Meepo.Earthbind.Target")
        }
        ParticleManager.DestroyParticle(this.particle,false)
        ParticleManager.ReleaseParticleIndex(this.particle)
        return true
    }
});
