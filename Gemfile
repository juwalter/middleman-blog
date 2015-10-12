source 'https://rubygems.org'

gem "middleman-core", :github => "middleman/middleman", :branch => 'v3-stable'

# Specify your gem's dependencies in middleman-blog.gemspec
gemspec

gem "rake",     "~> 10.1.0", :require => false
gem "yard",     "~> 0.8.0", :require => false

# Test tools
gem 'cucumber', '~> 2.0'
gem "fivemat"
gem 'aruba', '~> 0.7.4'
gem 'rspec', '~> 3.0'
gem "simplecov"

gem "timecop",  "~> 0.6.3"
gem "nokogiri"
gem "kramdown"

# Code Quality
gem "cane", :platforms => [:mri_19, :mri_20], :require => false
gem 'coveralls', :require => false

platforms :ruby do
  gem "redcarpet", "~> 3.0"
end
