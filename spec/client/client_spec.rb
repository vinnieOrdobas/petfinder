require 'spec_helper'
require 'petfinder'
require 'webmock/rspec'

let(:client) { Petfinder::Client.new }

RSpec.describe :client do
    
    it "does something useful" do
      expect(false).to eq(true)
    end
  end