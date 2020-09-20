
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hash_wizard/version"

Gem::Specification.new do |spec|
  spec.name          = "hash_wizard"
  spec.version       = HashWizard::VERSION
  spec.authors       = ["Shiv"]
  spec.email         = ["spsparmar1729@gmail.com"]

  spec.summary       = %q{This gem is useful in playing with ruby nested hashes, also in json format.}
  spec.description   = %q{This gem has methods to delete keys from a nested hash even from arrays, and to set value of a specific key in entire hash and to rename a key in the entire hash. }
  spec.homepage      = "https://github.com/spsp008/hash_wizard.git"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
