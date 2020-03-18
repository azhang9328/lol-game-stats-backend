module Lol 
    module DataDragon
        class DataRequest
            DATA_SERVICES = {
                :items => "item.json",
                :champions => "championFull.json",
                :summoner_spells => "summoner.json",
                :runes => "runesReforged.json"
            }.freeze

            attr_reader :base_data_url

            def initialize(base_data_url)
                @base_data_url = base_data_url
            end

            def perform_request(service)
                service_url = self.base_data_url + DATA_SERVICES[service]
                req = Typhoeus.get(service_url)
                res = JSON.parse(req.body)
            end
        end
    end
end