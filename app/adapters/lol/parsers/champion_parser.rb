module Lol 
    module Parsers
        class ChampionParser
            def parse_dd_response(champs)
                champs.each do |champ|
                    champ_data = champ[1]
                    spells = champ_data.extract!("spells")
                    passive = champ_data.extract!("passive")["passive"]
                    temp_champ = champ_data.except("id", "key", "recommended")
                    spell_parser = Lol::Parsers::SpellParser.new
                    passive_parser = Lol::Parsers::PassiveParser.new

                    new_champ = Champion.new(temp_champ)
                    new_champ.riot_id = champ_data["key"]
                    new_champ.save

                    spells.each do |spell|
                        spell_parser.parse_champ_spells(spell, new_champ)
                    end

                    passive_parser.parse_champ_passive(passive, new_champ)
                end
            end
        end
    end
end