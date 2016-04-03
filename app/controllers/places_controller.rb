class PlacesController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  layout "single", only: [:show]

  def index
    set_meta_tags title: 'MVMT - A curated list of studios and schools for people who move - Movement, Gymnastics, Circus, Parkour, Free Running, Dance, Crossfit'
    set_meta_tags canonical: 'https://mvmt.io/'
    set_meta()

    @resources = Place.where(:approved => true).shuffle
    @categories = Category.all

    @affiliate = Affiliate.getRandomHorizontalAffiliate()
    @overlayAffiliate = Affiliate.getRandomVerticalAffiliate()

  end

  def show
    set_meta_tags title: @resource.name + ' - MVMT - A curated list of studios and schools for people who move - Movement, Gymnastics, Circus, Parkour, Free Running, Dance, Crossfit'
    set_meta_tags canonical: url_for()
    set_meta()

    @resource
  end

  def new
    @resource = Place.new
    respond_with(@resource)
  end

  def edit
  end

  def create
    @resource = Place.new(resource_params)
    @resource.save
    respond_with(@resource)
  end

  def update
    @resource.update(resource_params)
    respond_with(@resource)
  end

  def destroy
    @resource.destroy
    respond_with(@resource)
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
                        image: root_url + ActionController::Base.helpers.image_path('mvmt-logo.png')
                    }

    end

    def set_resource
      @resource = Place.friendly.find(params[:id].downcase)
    end

    def resource_params
      params.require(:resource).permit(:name, :logo, :website, :affilatelink, :affiliate)
    end
end
