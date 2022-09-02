# frozen_string_literal: true

require "spec_helper"
require "petfinder"
require "webmock/rspec"

RSpec.describe :client do
  let(:client) { Petfinder::Client.new }

  before do
    WebMock.stub_request(:post, "https://dev-0erpan4x.us.auth0.com/oauth/token").with(
      body: "client_id=#{client.client_id}&client_secret=#{client.client_secret}&grant_type=client_credentials&audience=https://athletedataservice.thesportsoffice.com",
      headers: {
        'Content-Type': "application/x-www-form-urlencoded"
      }
    ).to_return(status: 200, body: "Token Granted", headers: {})

    WebMock.stub_request(:get, "https://athletedataservice.azurewebsites.net/summary").with(
      headers: {
        "Authorization": "Bearer #{client.api_key.body["access_token"]}"
      }
    ).to_return(status: 200, body: "Data Received", headers: {})
  end

  it "does something useful" do
    expect(:client).to eq(true)
  end
end
