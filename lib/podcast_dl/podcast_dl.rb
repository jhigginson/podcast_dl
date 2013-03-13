module PodcastDl

	def self.download_podcast url, count, dest_folder
		channel = Channel.new url

		urls = []
		channel.items[0, count].each  do |item|
			urls << item.enclosure.url
		end

		#download the urls to the dest_folder
		Downloader.dl_podcasts urls, dest_folder

		#returns a channel object of the downloaded podcast so you can use the metadata
		channel
	end

end