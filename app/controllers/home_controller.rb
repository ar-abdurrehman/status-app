class HomeController < ApplicationController

	SOCIAL_MEDIA= {twitter: "https://takehome.io/twitter",
									facebook: "https://takehome.io/facebook",
									instagram: "https://takehome.io/instagram"}.freeze

	def index
		@status_response = {}
		SOCIAL_MEDIA.each do |k,url|
			response = get_request(url)
			@status_response[k] = set_statuses(k.to_s, response)
		end
		render json: @status_response, status: 200
	end

	def set_statuses(k, response)
		if response.code == '200'
			body  = JSON.parse(response.body)
			param = ""
			if k == "twitter"
				param = "tweet"
			elsif k == "facebook"
				param = "status"
			elsif k == "instagram"
				param = "picture"
			end

		 	body.map{|record| record[param]}
		else
			'some thing went wrong'
		end
	end

end
