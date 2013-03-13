require 'rexml/document'

module PodcastDl

	class Item

		attr_reader :title
		attr_reader :link
		attr_reader :description
		attr_reader :enclosure
		attr_reader :guid
		attr_reader :pub_date

		#expects a REXML::Text of the item
		def initialize elem
			@item_elem = elem
			parse_item
		end

		private
		
		def parse_item
			parse_title
			parse_link
			parse_description
			parse_enclosure
			parse_guid
			parse_pub_date
		end

		def parse_title
			@title = @item_elem.elements['title'].text.to_s
		end

		def parse_link
			@link = @item_elem.elements['link'].text.to_s
		end

		def parse_description
			@description = @item_elem.elements['description'].text.to_s
		end

		def parse_enclosure
			@enclosure = Enclosure.new @item_elem.elements['enclosure']
		end

		def parse_guid
			@guid = @item_elem.elements['guid'].text.to_s
		end

		def parse_pub_date
			@pub_date = @item_elem.elements['pubDate'].text.to_s
		end

	end

end