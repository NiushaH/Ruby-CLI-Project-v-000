
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "villagetopia/version"
require "pry"

Gem::Specification.new do |spec|
  spec.name          = "villagetopia"
  spec.version       = VillagetopiaCLI::VERSION
  spec.authors       = ["Niusha H"]
  spec.email         = ["hello@solomomliving.com"]

  spec.summary       = "Helping single parents find their best place to live."
  spec.description   = "A gem that helps solo parents thoughtfully choose their best
  place to live and thrive as an adult raising their child(ren) with communal
  support of organizations, schools, resources, etc. to establish USA family roots,
  their Villagetopia."
  spec.homepage      = "https://github.com/NiushaH/Ruby-CLI-Project-v-000/villagetopia"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://github.com/NiushaH/Ruby-CLI-Project-v-000/villagetopia"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/NiushaH/Ruby-CLI-Project-v-000/villagetopia"
    spec.metadata["changelog_uri"] = "https://github.com/NiushaH/Ruby-CLI-Project-v-000/villagetopia"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
#   spec.executables = ["villagetopia"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "pry"

  spec.add_dependency "rainbow"
  spec.add_dependency "httparty"
  spec.add_dependency "nokogiri"
end
