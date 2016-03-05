class AffiliatesController < ApplicationController
  before_action :set_affiliate, only: [:show, :edit, :update, :destroy]

  def index
    @affiliates = Affiliate.all
    respond_with(@affiliates)
  end

  def show
    respond_with(@affiliate)
  end

  def new
    @affiliate = Affiliate.new
    respond_with(@affiliate)
  end

  def edit
  end

  def create
    @affiliate = Affiliate.new(affiliate_params)
    @affiliate.save
    respond_with(@affiliate)
  end

  def update
    @affiliate.update(affiliate_params)
    respond_with(@affiliate)
  end

  def destroy
    @affiliate.destroy
    respond_with(@affiliate)
  end

  private
    def set_affiliate
      @affiliate = Affiliate.find(params[:id])
    end

    def affiliate_params
      params.require(:affiliate).permit(:name, :adv, :display_count, :view_count)
    end
end
