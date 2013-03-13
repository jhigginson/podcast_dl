$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'podcast_dl'
require 'rexml/document'

describe PodcastDl::Enclosure do

	before(:all) do 
		doc = REXML::Document.new(File.new './spec/tal_podcast.xml')
		enc_elem = doc.root.elements['//enclosure']
		@enclosure = PodcastDl::Enclosure.new enc_elem
	end

	describe '#initialize' do

		it 'should initialize a url' do
			@enclosure.url.should eq 'http://feeds.thisamericanlife.org/~r/talpodcast/~5/GeiVjyNX5JU/489.mp3'
		end

		it 'should initialize a length' do
			@enclosure.length.should eq 0
		end

		it 'should initialize a type' do
			@enclosure.type.should eq 'audio/mpeg'
		end

	end

end