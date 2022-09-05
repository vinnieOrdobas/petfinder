# frozen_string_literal: true

require "spec_helper"
require "petfinder"
require "webmock"
require "pry"
require "json"

RSpec.describe Petfinder::Animal do
  let(:animal) { Petfinder::Animal.new(JSON.parse(File.read("spec/fixtures/fixtures.json"))) }

  it "has a name" do
    expect(animal.name).to eq("Drake")
  end

  it "has a breeds hash" do
    expect(animal.breed).to be_a Hash
  end

  it "has a colour hash" do
    expect(animal.colours).to be_a Hash
  end

  it "has an attribute hash" do
    expect(animal.attributes).to be_a Hash
  end

  it "has tags" do
    expect(animal.tags).to be_a Array
  end

  it "has a description" do
    expect(animal.description).to be_a String
  end

  it "has a model method" do
    expect(animal.model!).to be_a Hash
  end
end
