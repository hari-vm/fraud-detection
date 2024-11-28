# frozen_string_literal: true

require_relative "fraud_detection_client/version"
require 'net/http'
require 'json'
require 'uri'
module FraudDetectionClient
  class Error < StandardError; end

  class Client
    BASE_URL = 'http://localhost:3000/api/v1'

    def initialize(api_url = BASE_URL)
      @api_url = api_url
    end

    # Sending request the 'classify' API
    def classify(data, classification)
      uri = URI("#{@api_url}/classify")
      response = post_request(uri, data: data, classification: classification)
      parse_response(response)
    end

    # Sending request the 'check' API
    def check(data)
      uri = URI("#{@api_url}/check")
      response = post_request(uri, data: data)
      parse_response(response)
    end

    private

    def post_request(uri, params)
      request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      request.body = params.to_json

      Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end
    end

    def parse_response(response)
      case response.code.to_i
      when 200
        JSON.parse(response.body)
      else
        { error: 'API request failed', details: response.body }
      end
    end
  end
end
