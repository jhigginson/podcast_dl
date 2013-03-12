require 'net/http'
require 'rexml/document'
require 'open-uri'

module PodcastDl

	class Downloader

		#takes a url and returns a string containing xml
		def self.get_xml url
			Net::HTTP.get_response(URI.parse(url)).body
		end

		def self.get_podcast_count xml_data
			doc = REXML::Document.new(xml_data)

			count = 0
			doc.elements.each('//item') do |itm|
				count += 1
			end
			count
		end

		#takes some xml and a number of episodes to get, returns a hash of that many download urls with titles
		def self.get_download_urls xml_data, count
			doc = REXML::Document.new(xml_data)

			urls = []
			doc.elements.each('//item/media:content') do |ele|
				urls << ele.attribute('url').value
			end

			if urls.length < count 
				urls
			else
				urls[0...count]
			end
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
