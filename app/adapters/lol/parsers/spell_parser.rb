module Lol 
    module Parsers
        class SpellParser
            def parse_dd_response(spells)
                spells.each_value do |spell|
                    temp_spell = spell.except("id", "cooldownBurn", "costBurn", "datavalues", "effectBurn", "key", "summonerLevel", "modes", "maxammo", "rangeBurn")
                    temp_spell["riot_id"] = spell["key"]
                    new_spell = Spell.new(temp_spell)
                    new_spell.save
                end
            end

            def parse_champ_spells(spells, champ)
                spells[1].each do |spell|
                    temp_spell = spell.except("id", "leveltip", "cooldownBurn", "costBurn", "datavalues", "effectBurn", "maxammo", "rangeBurn")
                    temp_spell["riot_id"] = spell["id"]
                    new_spell = Spell.new(temp_spell)
                    champ.spells << new_spell
                    new_spell.save
                end
            end
        end
    end
end