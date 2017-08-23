# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "simplicity"
  spec.version       = "0.0.9"
  spec.authors       = ["bananaappletw"]
  spec.email         = ["bananaappletw@gmail.com"]

  spec.summary       = %q{simplicity: simple theme built by flexbox}
  spec.homepage      = "https://github.com/bananaappletw/simplicity"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.5"
  spec.add_runtime_dependency "jekyll-feed"
  spec.add_runtime_dependency "jekyll-paginate"
  spec.add_runtime_dependency "jekyll-coffeescript"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
