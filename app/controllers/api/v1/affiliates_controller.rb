class Api::V1::AffiliatesController < Api::V1::BaseController
  def show
    affiliate = Affiliate.find(params[:id])
    render(json: Api::V1::AffiliateSerializer.new(affiliate).to_json)
  end

  def update
    respond_with Affiliate.find(params[:id]).update_attributes(params[:affiliate])
  end

end
