# frozen_string_literal: true

module Petfinder
  class Animal
    attr_reader :name, :species, :characteristics, :breed, :colours, :age, :coat, :size, :social

    def initialize(attributes)
      @name = attributes.fetch(:name.to_s)
      @species = attributes.fetch(:species.to_s)
      @characteristics = attributes.fetch(:attributes.to_s)
      @breed = attributes.fetch(:breeds.to_s)
      @colours = attributes.fetch(:colors.to_s)
      @age = attributes.fetch(:age.to_s)
      @coat = attributes.fetch(:coat.to_s)
      @size = attributes.fetch(:size.to_s)
      @social = attributes.fetch(:environment.to_s)
    end
  end
end
