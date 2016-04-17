class PlacesController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!

  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  layout "single", only: [:show]

  def index
    @title = 'MVMT - A curated list of studios and schools for people who move - Movement, Gymnastics, Circus, Parkour, Free Running, Dance, Crossfit'
    @canonical = root_url
    @image = root_url + 'mvmt-logo.png'
    set_meta(@title, @canonical, @image)

    @places = Place.where(:approved => true).shuffle
    @categories = Category.all

    @affiliate = Affiliate.getRandomHorizontalAffiliate()
    @overlayAffiliate = Affiliate.getRandomVerticalAffiliate()
  end

  def show
    @title = @place.name + ' - MVMT - A curated list of studios and schools for people who move.'
    @canonical = url_for()
    @image = @place.logo.url
    set_meta(@title, @canonical, @image)

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
    def set_meta(title, canonical, image)
      set_meta_tags title: title
      set_meta_tags canonical: canonical

      set_meta_tags description: 'Discover yourself through movement.'
      set_meta_tags keywords: ['London Movement', 'London Gymnastics', 'London Circus', 'London Parkour', 'London Free Running', 'London Dance', 'London Crossfit']

      set_meta_tags og: {
                        title:    title,
                        description: 'Discover yourself through movement.',
                        locale: 'en_GB',
                        type: 'website',
                        url: canonical,
                        image: image
                    }

    end

    def set_resource
      @place = Place.friendly.find(params[:id].downcase)
    end

    def place_params
      params.require(:place).permit(:name, :website, :facebook, :twitter, :instagram, :slug)
    end
end
