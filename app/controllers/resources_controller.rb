class ResourcesController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    set_meta_tags title: 'MVMT - A curated list of studios and schools for people who move - Movement, Gymnastics, Circus, Parkour, Free Running, Dance, Crossfit'
    set_meta_tags description: 'Discover yourself through movement.'
    set_meta_tags keywords: %w[London Movement, London Gymnastics, London Circus, London Parkour, London Free Running, London Dance, London Crossfit]
    set_meta_tags canonical: 'https://mvmt.io/'

    set_meta_tags og: {
                      sitename: 'MVMT',
                      title:    'MVMT - A curated list of studios and schools for people who move - Movement, Gymnastics, Circus, Parkour, Free Running, Dance, Crossfit',
                      description: 'Discover yourself through movement.',
                      locale: 'en_GB',
                      type: 'website',
                      url:      'https://mvmt.io',
                  }

    @resources = Resource.where(:approved => true).shuffle
    @categories = Category.all

    @affiliate = Affiliate.getRandomBanner()

  end

  def show
    respond_with(@resource)
  end

  def new
    @resource = Resource.new
    respond_with(@resource)
  end

  def edit
  end

  def create
    @resource = Resource.new(resource_params)
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
    def set_resource
      @resource = Resource.find(params[:id])
    end

    def resource_params
      params.require(:resource).permit(:name, :logo, :website, :affilatelink, :affiliate)
    end
end
