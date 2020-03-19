module Lol 
    module Parsers
        class SummonerParser
            def parse_response(res)                

            end

            def summoners_from_match(summoners)
                summoners.map do |summoner|
                    participant_id = summoner["participantId"]
                    temp_summoner = summoner["player"]
                    summoner = {
                            "profileIconId"=> temp_summoner["profileIcon"],
                            "name"=> temp_summoner["summonerName"],
                            "accountId"=> temp_summoner["currentAccountId"],
                            "summonerId"=> temp_summoner["summonerId"],
                            "participantId"=> participant_id
                    }
                end
            end
        end
    end
end