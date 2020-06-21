lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gifted_schools_cli_project/version"

Gem::Specification.new do |spec|
  spec.name          = "gifted_schools_cli_project"
  spec.version       = GiftedSchoolsCLIProject::VERSION
  spec.authors       = ["Niusha H"]
  spec.email         = ["hello@embarkmoms.com"]

  spec.summary       = %q{Show a list of schools and then offer the user specific contact information so they may reach out or learn more about the school.}
  spec.description   = %q{This Gifted Schools CLI Project is a stepping stone to a more complex application that I would like to build called Villagetopia.}
  spec.homepage      = "https://github.com/NiushaH/Ruby-CLI-Project-v-000/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "https://github.com/NiushaH/Ruby-CLI-Project-v-000/"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/NiushaH/Ruby-CLI-Project-v-000/"
    spec.metadata["changelog_uri"] = "https://github.com/NiushaH/Ruby-CLI-Project-v-000/"
  # else
    # raise "RubyGems 2.0 or newer is required to protect against " \
    #   "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
#   spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
#     `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
#   end
#   spec.bindir        = "exe"
#   spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
#  #   spec.executables = ["gifted_schools_cli_project"]
#  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  # spec.add_development_dependency "pp"
  spec.add_development_dependency "pry"

  spec.add_dependency "rainbow"
  spec.add_dependency "nokogiri"
end
