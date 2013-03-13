module PodcastDl

	class Enclosure
		attr_reader :url
		attr_reader :length
		attr_reader :type

		def initialize elem
			@enclosure_elem = elem
			parse_enclosure
		end

		def to_s
			@enclosure_elem.to_s
		end

		private

		def parse_enclosure
			parse_url
			parse_length
			parse_type
		end

		def parse_url
			@url = @enclosure_elem.attributes['url'].to_s
		end

		def parse_length
			@length = @enclosure_elem.attributes['length'].to_s.to_i
		end

		def parse_type
			@type = @enclosure_elem.attributes['type'].to_s
		end

	end

end