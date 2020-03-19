module Lol 
    module Parsers
        class MatchParser
            #update based on http://static.developer.riotgames.com/docs/lol/seasons.json
            SEASONS = {
                13 => "SEASON 2019"
            }

            QUEUES = {
                420 => "5v5 Ranked Solo"
            }

            TEAMS = {
                100 => "blue",
                200 => "red"
            }

            attr_accessor :winner

            def parse_response(res)
                res = res.except("gameMode", "mapId", "gameType", "gameCreation")
                summoners = res.extract!("participantIdentities")["participantIdentities"]
                parser = Lol::Parsers::SummonerParser.new
                summoners = parser.summoners_from_match(summoners)

                game_team_info = res.extract!("teams")["teams"]
                #shift winning team to game instead of on each gpc?
                bans = game_team_info.map do |team|
                    if team["win"] == "Win"
                        @winner = TEAMS[team["teamId"]]
                    end

                    team["bans"].map do |ban|
                        ban["championId"]
                    end
                end.flatten

                game_info = res.extract!("seasonId", "queueId", "gameId", "gameVersion", "platformId", "gameDuration")
                game_info = {
                    "season" => SEASONS[game_info["seasonId"]],
                    "queue" => QUEUES[game_info["queueId"]],
                    "riot_id" => game_info["gameId"],
                    "gameVersion" => game_info["gameVersion"],
                    "region" => game_info["platformId"],
                    "gameDuration" => game_info["gameDuration"],
                    "champion_bans" => bans,
                    "winner" => @winner
                }

                game_participants_info = res["participants"]

                new_game = Game.create(game_info)

                game_participants_info.map do |participant|
                    stats = participant["stats"].except("totalPlayerScore", "totalScoreRank", "combatPlayerScore", "objectivePlayerScore", "playerScore0", "playerScore1", "playerScore2", "playerScore3", "playerScore4", "playerScore5", "playerScore0", "playerScore6", "playerScore7", "playerScore8", "playerScore9", "totalUnitsHealed", "win")
                    rune_paths = stats.extract!("perkPrimaryStyle", "perkSubStyle")
                    runes = stats.extract!("perk0", "perk1", "perk2", "perk3", "perk4", "perk5")
                    stat_perks = stats.extract!("statPerk0", "statPerk1", "statPerk2")
                    item_ids = stats.extract!("item0", "item1", "item2", "item3", "item4", "item5", "item6")
                    summoner_spell_ids = participant.extract!("spell1Id", "spell2Id")
                    champion_id = participant.extract!("championId")
                    timeline = participant.extract!("timeline")["timeline"]
                    p_lane_role = timeline.extract!("lane", "role")

                    find_participant = summoners.find do |summoner|
                        participant["participantId"] == summoner["participantId"]
                    end
                    summoner = Summoner.find_by(accountId: find_participant["accountId"])
                    summoner ||= Summoner.create(find_participant.except("participantId"))

                    all_runes = rune_paths.merge(runes).merge(stat_perks).map do |rune|
                        Rune.find_by(riot_id: rune[1])
                    end

                    summoner_spells = summoner_spell_ids.map do |summoner_spell|
                        Spell.find_by(riot_id: summoner_spell[1])
                    end

                    items = item_ids.select do |item_pos, item_id|
                        item_id != 0
                    end.map do |item|
                        Item.find_by(riot_id: item[1])
                    end
            
                    champion = Champion.find_by(riot_id: champion_id["championId"])

                    team = {"team" => TEAMS[participant["teamId"]]}

                    belongs_to = {"champion_id" => champion.id, "summoner_id" => summoner.id, "game_id" => new_game.id}

                    full_par = team.merge(stats).merge(p_lane_role).merge(belongs_to)
                    #do I want perk damage? seems like waste of space
                    test_par = full_par.except("perk0Var1", "perk0Var2", "perk0Var3","perk1Var1", "perk1Var2", "perk1Var3","perk2Var1", "perk2Var2", "perk2Var3","perk3Var1", "perk3Var2", "perk3Var3","perk4Var1", "perk4Var2", "perk4Var3","perk5Var1", "perk5Var2", "perk5Var3")

                    new_gpc = Gpc.create(test_par) 

                    new_gpc.runes << all_runes

                    new_gpc.spells << summoner_spells

                    new_gpc.items << items
                end

            end
        end
    end
end