class OffersController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

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
    def set_offer
      @offer = Offer.find(params[:id])
    end

    def offer_params
      params.require(:offer).permit(:title, :desc, :code, :link)
    end
end
