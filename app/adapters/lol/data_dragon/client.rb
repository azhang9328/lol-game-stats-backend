module Lol
    module DataDragon
        class Client    
            BASE_DD_URL = "https://ddragon.leagueoflegends.com"

            attr_accessor :language, :dd_version, :data_dd, :parser

    
            def initialize(language = "en_US", dd_version = "10.5.1")
                @language = language
                @dd_version = dd_version
                @data_dd = Lol::DataDragon::DataRequest.new(BASE_DD_URL + "/cdn/#{self.dd_version}/data/#{self.language}/")
            end

            def get_all(service)
                res = self.data_dd.perform_request(service)
                case service
                when :items
                    @parser = Lol::DataDragon::Parsers::ItemParser.new
                when :champions
                    @parser = Lol::DataDragon::Parsers::ChampionParser.new
                when :summoner_spells
                    @parser = Lol::DataDragon::Parsers::SummonerParser.new
                end
                
                self.parser.parse_dd_response(res)
            end
    
            def latest_dd
                dd_version_list[0]
            end
    
            def dd_version_list
                req = Typhoeus.get(BASE_DD_URL + "/api/versions.json")
                res = JSON.parse(req.body)
                puts res
            end
        end
    end
end