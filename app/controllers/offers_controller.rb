class OffersController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :set_meta, only: [:show, :edit, :update, :destroy]

  def index
    @offers = Offer.where('"endDate" > ?', Date.current())
    @offers
  end

  def show
    @offer
  end

  def new
    @offer = Offer.new
    @offer
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.save
    @offer
  end

  def update
    @offer.update(offer_params)
    @offer
  end

  def destroy
    @offer.destroy
    respond_with(@offer)
  end

  private
    def set_meta
      set_meta_tags title: 'Product Offers and Discounts MVMT - A curated list of studios and schools for people who move'
      set_meta_tags canonical: url_for()
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

    def set_offer
      @offer = Offer.find(params[:id])
    end

    def offer_params
      params.require(:offer).permit(:title, :desc, :code, :link)
    end
end
