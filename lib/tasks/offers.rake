require 'csv'
require 'open-uri'
desc 'Grab Offers'

task get_offers: :environment do
	url = 'https://darwin.affiliatewindow.com/export-promotions/268283/d7c60681730790a40300804e57b164fd?promotionType=&categoryIds=&regionIds=&advertiserIds=&membershipStatus=joined&promotionStatus=active'
	#ENV['AW_OFFER_CSV']
	url_data = open(url).read()

	csv = CSV.new(url_data, :headers => true, :header_converters => :symbol)
	csv.map {|row|
    hash = row.to_hash
		last_fetched = Log.where(entity: 'Offers', action: 'Fetch').order(created_at: :desc)

    if (last_fetched.empty? || hash[:date_added].to_datetime >= last_fetched.first.created_at)
			if (Brand.where(title: hash[:advertiser]).empty?)
    		Brand.create(title: hash[:advertiser])
    	end

			brand = Brand.find_by(title: hash[:advertiser])
			offer = Offer.new do |o|
				o.title = hash[:description]
				o.brand << brand
				o.desc = hash[:terms]
				o.startDate = hash[:starts]
				o.endDate = hash[:ends]
				o.code = hash[:code]
				o.link = hash[:deeplink_tracking]
			end

			offer.save
		end

  }

	Log.create(entity: 'Offers', action: 'Fetch')

end