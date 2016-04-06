class Api::V1::PlacesController < Api::V1::BaseController
  def index
    @place = Place.where(:approved => true).shuffle
    #@place = Place.all
    render(json: @place)
  end

  def create
    if @place.present?
      render nothing: true, status: :conflict
    else
      @place = Place.new
      @place.assign_attributes(@json['place'])
      if @place.save
        render json: @place
      else
        render nothing: true, status: :bad_request
      end
    end
  end

  def show
    place = Place.find(params[:id])
    render(json: Api::V1::PlaceSerializer.new(place).to_json)
  end

  def update
    place = Place.find(params[:id])
    if !place.update_attributes(update_params)
      return api_error(status: 422, errors: user.errors)
    else
      render :nothing => true, :status => 200
    end
  end

  private
  def create_params
    params.require(:place).permit(
        :id, :name, :clickthrough
    )
  end

  def update_params
    create_params
  end
end
