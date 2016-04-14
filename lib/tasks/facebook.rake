desc 'Grab Details From Facebook'

task get_updates: :environment do
  #@oauth = Koala::Facebook::API.new(ENV['AUTH_FACEBOOK_KEY'], ENV['AUTH_FACEBOOK_SECRET'])
	#@oauth = Koala::Facebook::OAuth.new

  # code = @oauth.url_for_oauth_code
  # access_token = @oauth.get_access_token(code)

	# @oauth = Koala::Facebook::OAuth.new(app_id, app_secret, callback_url)
	#token = @oauth.get_app_access_token

	@graph = Koala::Facebook::API.new('1584641475160139|sL2zudq8pJOR6x_AqFoNa4RuB1k')

  field = "?fields=name,about,contact_address,description,website"
  Place.where.not(:facebook => '').each do |place|

    #UPDATE MODEL DATA METHOD HERE!
    if (place.fetch)
			page = @graph.get_object(place.facebook+field)

      ###only update if empty?
    	place.desc = page['about']  ###if < say, 300 words? Do I want more coz SEO, or less coz pop up?
      if (page['website'] != '')
        place.website = page['website']
      else
        place.website = 'www.facebook.com/' + page['username']
      end
      place.last_fetch = Date.current()

      place.fetch = false
      place.save

    #	image
    #	address
    #	address
    # hours?
    # likes
    # instagram accounts
    end



	end

end