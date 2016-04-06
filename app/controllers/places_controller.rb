class PlacesController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  layout "single", only: [:show]

  def index

    set_meta_tags title: 'MVMT - A curated list of studios and schools for people who move - Movement, Gymnastics, Circus, Parkour, Free Running, Dance, Crossfit'
    set_meta_tags canonical: 'https://mvmt.io/'
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
    @place = Place.new(resource_params)
    respond_to do |format|
      if @place.save
        # format.html { redirect_to @place, notice: 'Person was successfully created.' }
        # format.json { render json: @place, status: :created, location: @place }
        # # added:
        # format.js   { render action: 'show', status: :created, location: @place }
        respond_with(@place)
      else
        format.html { render action: 'new' }
        format.json { render json: @place.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @place.update(resource_params)
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
      puts 'set_resource'
      @place = Place.friendly.find(params[:id].downcase)
    end

    def resource_params
      params.require(:place).permit(:name, :website, :facebook, :twitter, :instagram)
    end
end
