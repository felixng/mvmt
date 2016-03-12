class Api::V1::AdtypesController < Api::V1::BaseController
  def show
    adType = AdType.find(params[:id])
    render(json: Api::V1::AdTypeSerializer.new(adType).to_json)
  end
end
