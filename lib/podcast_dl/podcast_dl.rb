module PodcastDl

	def self.download_podcast url, count, dest_folder
		#get the xml
		xml_data = Downloader.get_xml url
		#parse out the first x urls
		mp3_urls = Downloader.get_download_urls xml_data, count
		#download the urls to the dest_folder
		Downloader.dl_podcasts mp3_urls, dest_folder

	end

end