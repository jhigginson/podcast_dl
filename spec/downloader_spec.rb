$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'podcast_dl'

describe PodcastDl::Downloader do

	before(:all) do
		@temp_dir = "/Users/john/test/"
		@tal_xml = PodcastDl::Downloader.get_xml('http://feeds.thisamericanlife.org/talpodcast?format=xml')
		@kexp_xml = PodcastDl::Downloader.get_xml('http://feeds.kexp.org/kexp/songoftheday?format=xml')
	end

	describe '::get_xml' do

		it 'should download an xml file' do
			expected = '<?xml version="1.0" encoding="UTF-8"?>'
			actual = @tal_xml.lines.first.chomp
			actual.should eq expected
		end

	end

	describe '::get_podcast_count' do

		it 'should count all the podcasts in an xml rss feed' do
			expected = 3
			actual = PodcastDl::Downloader.get_podcast_count(@tal_xml)
			actual.should eq expected
		end

	end

	describe '::get_download_urls' do

		it 'should parse the number of urls requested' do
			urls = PodcastDl::Downloader.get_download_urls @tal_xml, 2
			urls.length.should eq 2
		end

		it 'should give you all the urls in a feed if you request more than the total number of podcasts in the feed' do
			expected = PodcastDl::Downloader.get_podcast_count @kexp_xml
			actual = PodcastDl::Downloader.get_download_urls(@kexp_xml, 50000).length
			actual.should eq expected
		end

	end

	describe '::dl_podcasts' do

		it 'should download urls to a directory' do
			urls = PodcastDl::Downloader.get_download_urls @kexp_xml, 2
			PodcastDl::Downloader.dl_podcasts urls, @temp_dir
			result = true
			urls.each do |url|
				path = @temp_dir + File.basename(url)
				result = false if !File.exists? path
			end

			result.should eq true
		end

	end

	after(:all) do
		#delete all the files downloaded in temp_dir
		Dir.foreach(@temp_dir) {|f| fn = File.join(@temp_dir, f); File.delete(fn) if f != '.' && f != '..'}
	end
	
end