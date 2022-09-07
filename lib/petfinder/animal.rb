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

    def model
      {
        pet_type: type,
        species: species,
        age: age,
        primary_breed: breed["primary"],
        secondary_breed: breed["secondary"],
        mixed_breed: breed["mixed"],
        unknown_breed: breed["unknown"],
        primary_colour: colours["primary"],
        secondary_colour: colours["secondary"],
        tertiary_colour: colours["tertiary"],
        gender: gender,
        size: size,
        coat: coat,
        declawed: attributes["declawed"],
        spayed_neutered: attributes["spayed_neutered"],
        house_trained: attributes["house_trained"],
        special_needs: attributes["special_needs"],
        shots_current: attributes["shots_current"],
        good_with_children: environment["children"],
        good_with_dogs: environment["dogs"],
        good_with_cats: environment["cats"],
        tags: tags.join(", "),
        name: name.include?(" -") ? name.split(" ").first : name,
        description: description
      }
    end
  end
end
