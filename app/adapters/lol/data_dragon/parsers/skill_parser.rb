module Lol 
    module DataDragon
        module Parsers
            class SkillParser
                def parse_dd_response(response)
                    response[1].each do |skill|
                        temp_skill = skill.except("id", "leveltip", "cooldownBurn", "costBurn", "datavalues", "effectBurn", "maxammo", "rangeBurn")
                        temp_skill["riot_id"] = skill["id"]
                        new_skill = Skill.new(temp_skill)
                        byebug
                    end
                end
            end
        end
    end
end