class Api::V1::PlacesController < Api::V1::BaseController
  def new
    @place = Place.new
  end

  def index
    @place = Place.where(:approved => true).shuffle
    #@place = Place.all
    render(json: @place)
  end

  def create

    if @place.present?
      render nothing: true, status: :conflict
    else
      @place = AdType.create(place_params)
      render json: @place
    end

      # render json: @place
      # if
      #   render json: @place
      # else
      #   respond_to do |format|
      #     format.html { render text: @place.assign_attributes({name:'Test'}) }
      #     format.json { render text: @place.assign_attributes({name:'Test'}) }
      #   end
      # end

    # respond_to do |format|
    #   format.html {render text: "Your data was sucessfully loaded. Thanks"}
    #   format.json {
    #     Place.create(@json['place'])
    #     render text: Place.last.to_json  # !
    #   }
    # end
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

  def place_params
    params.require(:place).permit(:name, :website, :facebook, :twitter, :instagram)
  end
end
