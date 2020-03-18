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
                data = res["data"]

                case service
                when :items
                    @parser = Lol::Parsers::ItemParser.new
                when :champions
                    @parser = Lol::Parsers::ChampionParser.new
                when :summoner_spells
                    @parser = Lol::Parsers::SpellParser.new
                when :masteries
                    @parser = Lol::Parsers::MasteryParser.new
                end

                self.parser.parse_dd_response(data)
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