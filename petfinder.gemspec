# frozen_string_literal: true

require_relative "lib/petfinder/version"

Gem::Specification.new do |spec|
  spec.name = "petfinder"
  spec.version = Petfinder::VERSION
  spec.authors = ["Vinnie Ordobas"]
  spec.email = ["vordobas@kitmanlabs.com"]

  spec.summary = "Consumes the Petfinder API"
  spec.description = "Wraps the Petfinder API with classes and methods to make it easier to consume the API"
  spec.homepage = "https://github.com/vinnieOrdobas?tab=repositories"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = "https://github.com/vinnieOrdobas?tab=repositories"
  spec.metadata["source_code_uri"] = "https://github.com/vinnieOrdobas?tab=repositories"
  spec.metadata["changelog_uri"] = "https://github.com/vinnieOrdobas?tab=repositories"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_dependency "faraday", "~> 1.7"
  spec.add_dependency "faraday_middleware", "~> 1.1"
  spec.add_development_dependency("json")
  spec.add_development_dependency("pry")
  spec.add_development_dependency("webmock", "~> 3.0")
end
