$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'podcast_dl'

# TODO: Below, change the gem name, authors, and email

Gem::Specification.new do |s|
  s.name        = 'podcast_dl'
  s.version     = PodcastDl::VERSION
  s.date        = '2013-02-28'
  s.summary     = "A Podcast Downloader Gem"
  s.description = "A gem to allow easy downloading of podcasts"
  s.authors     = ["John Higginson"]
  s.email       = 'jhigginson@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/podcast_dl'
  s.files       = ["lib/podcast_dl.rb", "lib/podcast_dl/version.rb", "lib/podcast_dl/downloader.rb", "lib/podcast_dl/podcast_dl.rb"]
  s.executables << 'podcast_organzier'
end