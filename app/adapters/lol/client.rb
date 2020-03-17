module Lol 
    class Client
        RIOT_KEY = ENV["RIOT_KEY"]

        attr_accessor :region
        attr_reader :api_key

        def initialize(api_key = RIOT_KEY, region = "na1")
            @api_key = api_key
            @region = region
        end

    end
end