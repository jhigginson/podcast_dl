$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'podcast_dl'

describe PodcastDl::Channel do

	before(:all) do
			@channel = PodcastDl::Channel.new 'http://feeds.thisamericanlife.org/talpodcast?format=xml'
			@temp_dir = "/Users/john/test/"
			@description = 'Official free, weekly podcast of the award-winning radio show "This American Life." First-person stories and short fiction pieces that are touching, funny, and surprising. Hosted by Ira Glass, from WBEZ Chicago Public Radio. In mp3 and updated Mondays.'
	end

	describe '#initialize' do

		it 'should download and initialize the xml attribute' do
			@channel.xml.should_not be_nil
		end

		it 'should parse and initialize the title element' do
			@channel.title.should eq "This American Life"
		end

		it 'should parse and initialize the link element'	do
			@channel.link.should eq "http://www.thisamericanlife.org"
		end

		it 'should parse and initialize the description element' do
			@channel.description.should eq @description
		end

		it 'should parse and initialize the items elements' do
			@channel.items.length.should eq 3
		end	

	end

	describe '#download' do

		it 'should download the number of episodes in count', :slow => true do
			urls = []
			kexp_chan = PodcastDl::Channel.new('http://feeds.kexp.org/kexp/songoftheday?format=xml')
			kexp_chan.items[0, 1].each  do |item|
				urls << item.enclosure.url
			end

			kexp_chan.download 1, @temp_dir
			result = true
			urls.each do |url|
				path = @temp_dir + File.basename(url)
				result = false if !File.exists? path
			end

			result.should eq true
		
		end
		
	end

	
end