module Lol 
    module DataDragon
        module Parsers
            class ChampionParser
                def parse_dd_response(response)
                    response["data"].each do |champ|
                        champ_data = champ[1]
                        spells = champ_data.extract!("spells")
                        parser = Lol::DataDragon::Parsers::SkillParser.new
                        spells.each do |spell|
                            parser.parse_dd_response(spell)
                        end
                        passive = champ_data.extract!("passive")
                        temp_champ = champ_data.except("id", "key", "recommended")

                        new_champ = Champion.new(temp_champ)
                        new_champ.riot_id = champ_data["key"]
                        byebug
                    end
                end
            end
        end
    end
end