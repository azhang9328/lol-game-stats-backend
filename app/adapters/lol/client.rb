module Lol 
    class Client
        RIOT_KEY = ENV["RIOT_KEY"]
        BASE_RIOT_URL = "api.riotgames.com/lol/"

        attr_accessor :region, :data_dragon, :parser
        attr_reader :api_key, :region_url, :rate_limiter1, :rate_limiter2

        def initialize(api_key = RIOT_KEY, region = "na1")
            @api_key = api_key
            @region = region
            @region_url = "https://#{@region}." + BASE_RIOT_URL
            @rate_limiter1 = Limiter::RateQueue.new(20, interval: 1)
            @rate_limiter2 = Limiter::RateQueue.new(100, interval: 120)
                        
            # RATE LIMITS
            # 20 requests every 1 seconds(s)
            # 100 requests every 2 minutes(s)
        end

        def dd_get(service)
            @data_dragon ||= Lol::DataDragon::Client.new
            @data_dragon.get_data(service)
        end

        def request(service, options={})
            req = Lol::Request.new(@region_url, @api_key, @rate_limiter1, @rate_limiter2, options)
            res = req.perform_request(service)

            case service 
            when :match
                @parser = Lol::Parsers::MatchParser.new
            when :summoner
                @parser = Lol::Parsers::SummonerParser.new
            end

            @parser.parse_response(res)
        end
    end
end