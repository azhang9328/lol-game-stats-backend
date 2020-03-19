module Lol 
    class Request
        API_SERVICES = {
            :status => "status/v3/shard-data",
            :match => "match/v4/matches/",
            :timeline => "match/v4/timelines/by-match/",
            :summoner => "summoners/by-account/"
        }.freeze

        attr_reader :region_url, :match_id, :account_id, :api_key, :rate_limiter1, :rate_limiter2

        def initialize(region_url, api_key, rate_limiter1, rate_limiter2, options={})
            @region_url = region_url
            @api_key = api_key
            @match_id = options[:match_id]
            @rate_limiter1 = rate_limiter1
            @rate_limiter2 = rate_limiter2
        end

        def perform_request(service)
            service_url = @region_url + API_SERVICES[service]

            case service
            when :status
                req = Typhoeus.get(service_url, headers: {"X-Riot-Token": @api_key})
            when :match || :timeline 
                @rate_limiter1.shift 
                @rate_limiter2.shift
                req = Typhoeus.get(service_url + @match_id, headers: {"X-Riot-Token": @api_key})
            when :summoner
                @rate_limiter1.shift 
                @rate_limiter2.shift
                req = Typhoeus.get(service_url + @account_id, headers: {"X-Riot-Token": @api_key})
            end

            res = JSON.parse(req.body)
        end

    end
end