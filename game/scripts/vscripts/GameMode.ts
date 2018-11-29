const HeroSelectionTime = 10;

class GameMode {
    constructor() {
        GameRules.SetCustomGameTeamMaxPlayers(DOTATeam_t.DOTA_TEAM_GOODGUYS, 3);
        GameRules.SetCustomGameTeamMaxPlayers(DOTATeam_t.DOTA_TEAM_BADGUYS, 3);

        GameRules.SetShowcaseTime(0);
        GameRules.SetHeroSelectionTime(HeroSelectionTime);

        ListenToGameEvent("game_rules_state_change", () => this.OnStateChange(), null);
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
        // Set hero positions
        this.PositionHeroes();

        // Disallow players from doing any orders directly (only allowed through UI)
        GameRules.GetGameModeEntity().SetExecuteOrderFilter((ctx, order) => order.issuer_player_id_const == -1, this);
    }

    // Called on script_reload
    public Reload() {
        print("Reload");
    }

    // Position heroes in a circle
    private PositionHeroes(): void {
        const heroes = HeroList.GetAllHeroes();

        const dAngle = 2 * Math.PI / 15;
        const scale = 15 / heroes.length;

        heroes.forEach((hero, index) => {
            const quadrant = Math.floor(index * scale);
            const direction = Vector(Math.cos(quadrant * dAngle), Math.sin(quadrant * dAngle));

            hero.SetAbsOrigin(GetGroundPosition(direction * 600, hero));
            hero.SetForwardVector(-direction);
        });
    }
}