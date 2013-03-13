$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'podcast_dl'
require 'rexml/document'

describe PodcastDl::Item do

	before(:all) do
		doc = REXML::Document.new(File.new './spec/tal_podcast.xml')
		item_elem = doc.root.elements['//item']
		@item = PodcastDl::Item.new item_elem
	end

	describe '#initialize' do

		it 'should initialize a title' do
			@item.title.should eq '#489: No Coincidence, No Story!'
		end
		it 'should initialize a link' do
			@item.link.should eq 'http://feeds.thisamericanlife.org/~r/talpodcast/~3/-02JXZm4xO4/no-coincidence-no-story'
		end
		it 'should initialize a description' do
			@item.description.split[0...3].join(' ').should eq 'We asked listeners'
		end
		it 'should initialize an enclosure' do
			@item.enclosure.should be_a PodcastDl::Enclosure
		end
		it 'should initialize a guid' do
			@item.guid.should eq '5881 at http://www.thisamericanlife.org'
		end
		it 'should initialize a pub_date' do
			@item.pub_date.should eq 'Mon, 04 Mar 2013 01:00:00 +0000'
		end

	end

end