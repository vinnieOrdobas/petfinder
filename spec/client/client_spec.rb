require 'spec_helper'
require 'petfinder'
require 'webmock'
require 'pry'


RSpec.describe :client do
    
    let(:client) { Petfinder::Client.new(client_id:ENV['client_id'], client_secret:ENV['client_secret']) }

    before do
        binding.pry
        WebMock.stub_request(:post, ENV['GET_TOKEN_URL']).with(
          body: "grant_type=client_credentials&client_id=#{client.client_id}&client_secret=#{client.client_secret}",
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
          }
        ).to_return(status: 200, body: 'Token Granted', headers: {})
    
        WebMock.stub_request(:get, ENV['BASE_URL']).with(
          headers: {
            "Authorization": "Bearer #{client.api_key.body['access_token']}"
          }
        ).to_return(status: 200, body: 'Data Received', headers: {})
      end

    #   it "does something useful" do
    #     expect(:client).to eq(true)
    #   end

  end