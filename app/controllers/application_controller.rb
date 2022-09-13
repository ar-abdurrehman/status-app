class ApplicationController < ActionController::API
	
	# require JSON
	require 'net/http'

	def get_request(url)
		uri = URI(url)
	  http = Net::HTTP.new(uri.host, uri.port)
	  http.use_ssl = true
	  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	  request = Net::HTTP::Get.new(uri)
	  response = http.request(request)
	end
end