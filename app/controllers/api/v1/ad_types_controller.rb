class Api::V1::AdTypesController < Api::V1::BaseController
  def show
    adType = AdType.find(params[:id])
    render(json: Api::V1::AdTypeSerializer.new(adType).to_json)
  end

  def create
    if @adtype.present?
      render nothing: true, status: :conflict
    else
      @adtype = AdType.create(ad_type_params)
      render json: @adtype
    end
  end

  private
  def ad_type_params
    params.require(:ad_type).permit(:name)
  end
end
