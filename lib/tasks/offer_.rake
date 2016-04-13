desc 'Grab Offers'

task get_offers_old: :environment do
  headers = { "api:UserAuthentication" => { "sToken" => "mvmt-cron", "sApiKey" => 'fb254e63aaef52ca79339f4cf2c571ee' } }

  client = Savon.client(
		log: true,
		encoding: "UTF-8",
		log_level: :debug,
		pretty_print_xml: true,
		wsdl: "http://v3.core.com.productserve.com/ProductServeService.wsdl",
		soap_header: headers
  )

  merchantId = [610, 1757]

	#Action List:
  #get_category, get_category_tree, get_category_path, get_descendant_category_ids, get_product,
  #get_merchant_product, get_product_list, get_merchant, get_merchant_list, get_query_list,
  #get_related_products, get_discount_codes, get_gift_finder_product_list, get_gift_finder_options

  discount_codes = JSON.parse(client.call(:get_discount_codes, message: { 'iMerchantId' => 3196 }).to_json)
  #products_list = JSON.parse(client.call(:get_product_list, message: { 'sQuery' => 'protein' }).to_json)

	#puts discount_codes['get_discount_codes_response'].to_json
	puts discount_codes.to_json

	#puts products_list.to_json

	#puts client.operations.join(', ').to_json
end