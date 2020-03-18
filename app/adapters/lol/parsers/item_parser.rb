module Lol 
    module Parsers
        class ItemParser
            def parse_dd_response(data)
                data.each do |item_id, item|
                    item_image_instructions = item.extract!("image")["image"]
                    temp_item = item.except("maps","specialRecipe", "hideFromAll", "consumed", "consumeOnFull")
                    new_item = Item.new(temp_item)
                    new_item.image_instructions = item_image_instructions
                    new_item.riot_id = item_id
                    new_item.save
                end
            end
        end
    end
end