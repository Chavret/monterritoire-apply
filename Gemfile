source "https://rubygems.org"

ruby "3.2.0"

gem "rails", "~> 7.0.4"

# sqlite sur ma machine = problême de setup (windows 10)
# gem "sqlite3", "~> 1.4"
# je me permet donc d'utiliser Postgresql à la place
gem "pg"
gem "puma", "~> 5.0"
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :test do
  gem "shoulda-matchers"
end
