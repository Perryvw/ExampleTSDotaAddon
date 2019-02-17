LinkLuaModifier("modifier_panic", "modifiers/modifier_panic.lua", LuaModifierType.LUA_MODIFIER_MOTION_NONE);

const HeroSelectionTime = 10;

class GameMode {
    constructor() {
        GameRules.SetCustomGameTeamMaxPlayers(DOTATeam_t.DOTA_TEAM_GOODGUYS, 3);
        GameRules.SetCustomGameTeamMaxPlayers(DOTATeam_t.DOTA_TEAM_BADGUYS, 3);

        GameRules.SetShowcaseTime(0);
        GameRules.SetHeroSelectionTime(HeroSelectionTime);

        ListenToGameEvent("game_rules_state_change", () => this.OnStateChange(), null);

        ListenToGameEvent("npc_spawned", event => this.OnNpcSpawned(event), null);
    }

    public OnStateChange(): void {
        const state = GameRules.State_Get();

        // Add 4 bots to lobby in tools
        if (IsInToolsMode() && state == DOTA_GameState.DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP) {
            for (let i = 0; i < 4; i++) {
                Tutorial.AddBot("npc_dota_hero_lina", "", "", false);
            }
        }

        // Start game once pregame hits
        if (state == DOTA_GameState.DOTA_GAMERULES_STATE_PRE_GAME) {
            Timers.CreateTimer(0.2, () => this.StartGame());
        }
    }

    private StartGame(): void {
        print("Game starting!")

        // Do some stuff here
    }

    // Called on script_reload
    public Reload() {
        print("Script reloaded!");

        // Do some stuff here
    }

    private OnNpcSpawned(event: NpcSpawnedEvent) {
        // After a unit spawns, apply modifier_panic for 8 seconds
        const unit = EntIndexToHScript(event.entindex) as CDOTA_BaseNPC; // Cast to npc since this is the 'npc_spawned' event
        if (unit.IsRealHero()) {
            Timers.CreateTimer(1, () => {
                unit.AddNewModifier(undefined, undefined, "modifier_panic", { duration: 8 });
            });

            // Add lua ability to the unit
            unit.AddAbility("meepo_earthbind_ts_example");
        }
    }
}