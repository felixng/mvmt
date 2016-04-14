class PlacesController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  layout "single", only: [:show]

  def index
    set_meta_tags title: 'MVMT - A curated list of studios and schools for people who move - Movement, Gymnastics, Circus, Parkour, Free Running, Dance, Crossfit'
    set_meta_tags canonical: url_for()
    set_meta()

    @places = Place.where(:approved => true).shuffle
    @categories = Category.all

    @affiliate = Affiliate.getRandomHorizontalAffiliate()
    @overlayAffiliate = Affiliate.getRandomVerticalAffiliate()
  end

  def show
    set_meta_tags title: @place.name + ' - MVMT - A curated list of studios and schools for people who move - Movement, Gymnastics, Circus, Parkour, Free Running, Dance, Crossfit'
    set_meta_tags canonical: url_for()
    set_meta()

    @place
  end

  def new
    puts 'new'
    @place = Place.new
    respond_with(@place)
  end

  def edit
  end

  # def create
  #   @place = Place.new(resource_params)
  #   @place.save
  #   respond_with(@place)
  # end

  def create
    @place =Place.new(place_params)
    # @place.save
    respond_with(@place)
  end

  def update
    @place.update(place_params)
    respond_with(@place)
  end

  def destroy
    @place.destroy
    respond_with(@place)
  end

  private
    def set_meta

      set_meta_tags description: 'Discover yourself through movement.'
      set_meta_tags keywords: ['London Movement', 'London Gymnastics', 'London Circus', 'London Parkour', 'London Free Running', 'London Dance', 'London Crossfit']

      set_meta_tags og: {
                        sitename: 'MVMT',
                        title:    'MVMT - A curated list of studios and schools for people who move - Movement, Gymnastics, Circus, Parkour, Free Running, Dance, Crossfit',
                        description: 'Discover yourself through movement.',
                        locale: 'en_GB',
                        type: 'website',
                        url: url_for(),
                        image: root_url + 'mvmt-logo.png'
                    }

    end

    def set_resource
      @place = Place.friendly.find(params[:id].downcase)
    end

    def place_params
      params.require(:place).permit(:name, :website, :facebook, :twitter, :instagram)
    end
end
