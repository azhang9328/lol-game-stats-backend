module Lol 
    module Parsers
        class RuneParser
            def parse_dd_response(runesReforged)
                runesReforged.each do |rune_path|
                    rr_slots = rune_path.extract!("slots")["slots"]
                    rr_riot_id = rune_path.extract!("id")["id"]
                    temp_rune_path = rune_path.except("key")

                    new_rune = Rune.new(temp_rune_path)
                    new_rune.riot_id = rr_riot_id
                    new_rune.rune_type = "path"
                    new_rune.save

                    rune_slots(rr_slots)
                end
            end

            def rune_slots(rr_slots)
                rr_slots.each_with_index do |runes, index|
                    runes = runes["runes"]
                    runes.each do |rune|
                        riot_id = rune.extract!("id")["id"]
                        temp_rune = rune.except("key")

                        new_rune = Rune.new(temp_rune)
                        new_rune.riot_id = riot_id
                        index == 0 ? new_rune.rune_type = "keystone" : new_rune.rune_type = "slot #{index}"
                        new_rune.save
                    end
                end
            end
        end
    end
end