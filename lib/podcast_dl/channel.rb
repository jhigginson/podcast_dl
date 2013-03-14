require 'rexml/document'

module PodcastDl

	class Channel

		attr_reader :xml
		attr_reader :title
		attr_reader :link
		attr_reader :description
		attr_reader :items

		def initialize feed_url
			@xml = Downloader.get_xml feed_url
			@doc = REXML::Document.new(@xml)
			parse
		end

		def download count, directory
			urls = []
			@items[0, count].each  do |item|
				urls << item.enclosure.url
			end

			Downloader.dl_podcasts urls, directory
		end

		def to_s
			@xml
		end

		private

		def parse
			parse_title
			parse_link
			parse_description
			parse_items
		end

		def parse_title
			@title = @doc.root.elements['channel/title'][0].to_s
		end

		def parse_link
			@link = @doc.root.elements['channel/link'][0].to_s
		end

		def parse_description
			@description = @doc.root.elements['channel/description'][0].to_s
		end

		def parse_items
			@items = []
			@doc.elements.each('//item') do |itm|
				@items << Item.new(itm)
			end
		end

	end

end