module Lol
    module DataDragon
        class Client    
            BASE_DD_URL = "https://ddragon.leagueoflegends.com"

            attr_accessor :language, :dd_version, :data_dd, :parser, :asset_dd
            attr_reader :dd_vers_url
    
            def initialize(language = "en_US", dd_version = "10.5.1")
                @language = language
                @dd_version = dd_version
                @dd_vers_url = BASE_DD_URL + "/cdn/#{self.dd_version}"
                @data_dd = Lol::DataDragon::DataRequest.new(@dd_vers_url + "/data/#{self.language}/")
                @asset_dd = Lol::DataDragon::AssetRequest.new(@dd_vers_url + "/img/")
            end

            def get_data(service)
                res = self.data_dd.perform_request(service)
                service == :runes ? data = res : data = res["data"]

                case service
                when :items
                    @parser = Lol::Parsers::ItemParser.new
                when :champions
                    @parser = Lol::Parsers::ChampionParser.new
                when :summoner_spells
                    @parser = Lol::Parsers::SpellParser.new
                when :runes
                    @parser = Lol::Parsers::RuneParser.new
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