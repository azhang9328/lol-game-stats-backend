class GameSerializer < ActiveModel::Serializer
    attributes :season, :queue, :riot_id, :gameVersion, :region, :gameDuration, :champion_bans, :winner,
                :game_participants

    def game_participants
        self.object.gpcs.map do |gpc|
            sorted_runes = gpc_sorted_runes(gpc)
            {
                champion: {
                    id: gpc.champion.id,
                    name: gpc.champion.name,
                    title: gpc.champion.title,
                    blurb: gpc.champion.blurb,
                    tags: gpc.champion.tags,
                    items: gpc_items(gpc.items)
                },
                summoner: {
                    id: gpc.summoner.id,
                    name: gpc.summoner.name
                },
                team: gpc.team,
                kills: gpc.kills,
                deaths: gpc.deaths,
                assists: gpc.assists,
                summonerSpells: gpc_summoner_spells(gpc.spells),
                primary_runes: sorted_runes[0],
                secondary_runes: sorted_runes[1],
                stat_perks: sorted_runes[2],
                killSpreeInfo: {
                    largestKillingSpree: gpc.largestKillingSpree,
                    largestMultiKill: gpc.largestMultiKill,
                    killingSprees: gpc.killingSprees,
                    doubleKills: gpc.doubleKills,
                    tripleKills: gpc.tripleKills,
                    quadraKills: gpc.quadraKills,
                    pentaKills: gpc.pentaKills,
                    unrealKills: gpc.unrealKills #6+ kills
                },
                damageDealtInfo: {
                    totalDamageDealt: gpc.totalDamageDealt,
                    magicDamageDealt: gpc.magicDamageDealt,
                    physicalDamageDealt: gpc.physicalDamageDealt,
                    trueDamageDealt: gpc.trueDamageDealt,
                    totalDamageDealtToChampions: gpc.totalDamageDealtToChampions,
                    magicDamageDealtToChampions: gpc.magicDamageDealtToChampions,
                    physicalDamageDealtToChampions: gpc.physicalDamageDealtToChampions,
                    trueDamageDealtToChampions: gpc.trueDamageDealtToChampions,
                    damageDealtToObjectives: gpc.damageDealtToObjectives,
                    damageDealtToTurrets: gpc.damageDealtToTurrets
                },
                damageTakenInfo: {
                    totalDamageTaken: gpc.totalDamageTaken,
                    magicalDamageTaken: gpc.magicalDamageTaken,
                    physicalDamageTaken: gpc.physicalDamageTaken,
                    trueDamageTaken: gpc.trueDamageTaken
                },
                stats: {
                    largestCriticalStrike: gpc.largestCriticalStrike,
                    totalHeal: gpc.totalHeal,
                    damageSelfMitigated: gpc.damageSelfMitigated,
                    visionScore: gpc.visionScore,
                    goldEarned: gpc.goldEarned,
                    goldSpent: gpc.goldSpent,
                    turretKills: gpc.turretKills,
                    inhibitorKills: gpc.inhibitorKills,
                    totalMinionsKilled: gpc.totalMinionsKilled,
                    neutralMinionsKilled: gpc.neutralMinionsKilled,
                    neutralMinionsKilledTeamJungle: gpc.neutralMinionsKilledTeamJungle,
                    neutralMinionsKilledEnemyJungle: gpc.neutralMinionsKilledEnemyJungle,
                    champLevel: gpc.champLevel,
                    visionWardsBoughtInGame: gpc.visionWardsBoughtInGame,
                    sightWardsBoughtInGame: gpc.sightWardsBoughtInGame,
                    wardsPlaced: gpc.wardsPlaced,
                    wardsKilled: gpc.wardsKilled
                }
            }
        end
    end

    def gpc_sorted_runes(gpc)
        rune_paths = gpc.runes.filter do |rune|
            rune.rune_type == "path"
        end
        stat_perks = gpc.runes.filter do |rune|
            rune.rune_type == "stat"
        end
        gpc_find_paths_slot_runes(gpc, rune_paths).sort << stat_perks
    end

    def gpc_find_paths_slot_runes(gpc, rune_paths)
        rune_paths.map do |rune_path|
            slot_runes = gpc.runes.filter do |rune|
                rune.rune_type.match(rune_path.name)
            end
            slot_runes.prepend(rune_path)
        end
    end

    def gpc_items(items)
        items.map do |item|
            {
                id: item.id,
                name: item.name,
                plaintext: item.name,
                gold: {
                    base: item.gold["base"],
                    sell: item.gold["sell"],
                    total: item.gold["total"]
                },
                tags: item.tags
            }
        end
    end

    def gpc_summoner_spells(spells)
        spells.map do |spell|
            {
                id: spell.id,
                name: spell.name,
                cooldown: spell.cooldown
            }
        end
    end
  end
  