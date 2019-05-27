
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative './lib/team_gift/version'

Gem::Specification.new do |spec|
  spec.name          = "team_gift"
  spec.version       = TeamGift::VERSION
  spec.date          = '2019-05-25'
  spec.authors       = ["Niusha Hadziomerovic"]
  spec.email         = ["niusha.hadziomerovic@gmail.com"]

  spec.summary       = %q{"Demonstrating my ability to write concise, easy-to-read Object-Oriented Ruby code (e.g. good design patterns, objects, not hashes; separation of concerns, etc.)...  RegEx and the selectors used to parse scraped web page data are less important for this assignment."}
  spec.description   = %q{"Demonstrating my ability to write concise, easy-to-read Object-Oriented Ruby code (e.g. good design patterns, objects, not hashes; separation of concerns, etc.)...  RegEx and the selectors used to parse scraped web page data are less important for this assignment.".}
  spec.homepage      = 'http://github.com/NiushaH/Ruby-CLI-Project-v-000'
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "Set to 'http://github.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "http://github.com/NiushaH/Ruby-CLI-Project-v-000"
    spec.metadata["changelog_uri"] = "https://github.com/NiushaH/Ruby-CLI-Project-v-000/CHANGELOG.md"
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
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
