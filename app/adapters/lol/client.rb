module Lol 
    class Client
        RIOT_KEY = ENV["RIOT_KEY"]

        attr_accessor :region, :data_dragon
        attr_reader :api_key

        def initialize(api_key = RIOT_KEY, region = "na1")
            @api_key = api_key
            @region = region
            @data_dragon = Lol::DataDragon::Client.new
        end

        def dd_get_data(service)
            @data_dragon.get_data(service)
        end

    end
end