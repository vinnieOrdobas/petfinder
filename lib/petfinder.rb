# frozen_string_literal: true

require_relative "petfinder/version"

module Petfinder
  autoload :Client, "petfinder/client"
  autoload :Error, "petfinder/error"
  autoload :Pet, "petfinder/pet"
end
