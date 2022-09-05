# frozen_string_literal: true

module Petfinder
  class Animal
    attr_reader :name, :type, :species, :attributes, :breed, :colours,
                :age, :coat, :size, :environment, :description, :tags, :gender

    def initialize(attributes)
      @type = attributes.fetch(:type.to_s)
      @species = attributes.fetch(:species.to_s)
      @breed = attributes.fetch(:breeds.to_s)
      @colours = attributes.fetch(:colors.to_s)
      @age = attributes.fetch(:age.to_s)
      @gender = attributes.fetch(:gender.to_s)
      @size = attributes.fetch(:size.to_s)
      @coat = attributes.fetch(:coat.to_s)
      @attributes = attributes.fetch(:attributes.to_s)
      @environment = attributes.fetch(:environment.to_s)
      @tags = attributes.fetch(:tags.to_s)
      @name = attributes.fetch(:name.to_s)
      @description = attributes.fetch(:description.to_s)
    end
  end
end
