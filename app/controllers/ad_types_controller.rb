class AdTypesController < ApplicationController
  before_action :set_ad_type, only: [:show, :edit, :update, :destroy]

  def index
    @ad_types = AdType.all
    respond_with(@ad_types)
  end

  def show
    respond_with(@ad_type)
  end

  def new
    @ad_type = AdType.new
    respond_with(@ad_type)
  end

  def edit
  end

  def create
    @ad_type = AdType.new(ad_type_params)
    @ad_type.save
    respond_with(@ad_type)
  end

  def update
    @ad_type.update(ad_type_params)
    respond_with(@ad_type)
  end

  def destroy
    @ad_type.destroy
    respond_with(@ad_type)
  end

  private
    def set_ad_type
      @ad_type = AdType.find(params[:id])
    end

    def ad_type_params
      params.require(:ad_type).permit(:name, :height, :width)
    end
end
