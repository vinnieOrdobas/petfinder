# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

require_relative "env"

module Petfinder
  class Client

    attr_reader :api_key, :adapter, :headers, :data, :client_id, :client_secret

    def initialize(client_id:, client_secret:, adapter: Faraday.default_adapter)
      @connection = Faraday.new(url: ENV['BASE_URL']) do |conn|
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter
      end
      @client_id = client_id
      @client_secret = client_secret
      @api_key = get_token(@client_id, @client_secret)
      @headers = {
        "Authorization": "Bearer #{@api_key.body["access_token"]}"
      }
      @adapter = adapter
      @data = fetch_animals
    end

    def fetch_animals
      data = @connection.get do |req|
        req.headers = @headers
      end
      data.body["animals"]
    end

    private

    def get_token(client_id, client_secret)
      headers = {
        'Content-Type': "application/x-www-form-urlencoded"
      }
      data = "grant_type=client_credentials&client_id=#{client_id}&client_secret=#{client_secret}"
      @connection.post ENV['GET_TOKEN_URL'] do |req|
        req.headers = headers
        req.body = data
      end
    end
  end
end
