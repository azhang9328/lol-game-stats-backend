module Lol 
    module Parsers
        class PassiveParser
            def parse_champ_passive(passive, champ)
                new_passive = Passive.new(passive)
                new_passive["champion_id"] = champ.id
                new_passive.save
            end
        end
    end
end