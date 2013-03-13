$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'podcast_dl'

describe PodcastDl do

	context '::download' do

		it 'should download podcast episodes given a podcast rss feed' do
			urls = []
			PodcastDl::Channel.new('http://feeds.kexp.org/kexp/songoftheday?format=xml').items[0, 2].each  do |item|
				urls << item.enclosure.url
			end
			
			PodcastDl.download_podcast 'http://feeds.kexp.org/kexp/songoftheday?format=xml', 2, '/Users/john/test/'
			result = true
			urls.each do |url|
				path = "/Users/john/test/" + File.basename(url)
				result = false if !File.exists? path
			end

			result.should eq true
		end

	end
	
end