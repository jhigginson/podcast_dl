$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'podcast_dl'

# TODO: Below, change the gem name, authors, and email

Gem::Specification.new do |s|
  s.name        = 'podcast_dl'
  s.version     = PodcastDl::VERSION
  s.date        = '2013-03-12'
  s.summary     = "A Podcast Downloader and Metadata Parser Gem"
  s.description = "A gem to allow easy downloading of podcasts and access to metadata"
  s.authors     = ["John Higginson"]
  s.email       = 'jhigginson@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/podcast_dl'
  s.files       = ["lib/podcast_dl.rb", "lib/podcast_dl/version.rb", "lib/podcast_dl/downloader.rb", "lib/podcast_dl/channel.rb", "lib/podcast_dl/item.rb", "lib/podcast_dl/enclosure.rb"]
  s.executables << 'podcast_dl'
end