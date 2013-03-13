require 'net/http'
require 'rexml/document'
require 'open-uri'

module PodcastDl

	class Downloader

		#takes a url and returns a string containing xml
		def self.get_xml url
			Net::HTTP.get_response(URI.parse(url)).body
		end
		
		def self.dl_podcasts urls, directory
			urls.each do |url|
				File.open(directory + File.basename(url), "wb") do |saved_file|
  				# the following "open" is provided by open-uri
  				open(url, 'rb') do |read_file|
    				saved_file.write(read_file.read)
  				end
				end

			end
		end

	end
end
