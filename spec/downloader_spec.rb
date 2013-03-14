$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'podcast_dl'

describe PodcastDl::Downloader do

	before(:all) do
		@temp_dir = "/Users/john/test/"
		@kexp_xml = PodcastDl::Downloader.get_xml('http://feeds.kexp.org/kexp/songoftheday?format=xml')
	end

	describe '::get_xml' do

		it 'should download an xml file' do
			tal_xml = PodcastDl::Downloader.get_xml('http://feeds.thisamericanlife.org/talpodcast?format=xml')
			expected = '<?xml version="1.0" encoding="UTF-8"?>'
			actual = tal_xml.lines.first.chomp
			actual.should eq expected
		end

	end

	describe '::dl_podcasts' do

		it 'should download urls to a directory', :slow => true do
			urls = []
			PodcastDl::Channel.new('http://feeds.kexp.org/kexp/songoftheday?format=xml').items[0, 1].each  do |item|
				urls << item.enclosure.url
			end

			PodcastDl::Downloader.dl_podcasts urls, @temp_dir
			result = true
			urls.each do |url|
				path = @temp_dir + File.basename(url)
				result = false if !File.exists? path
			end

			result.should eq true
		end

	end
	
end