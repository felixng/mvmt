class AdType < ActiveRecord::Base
  has_many :affiliates

  def self.getHorizontalTypes
    return AdType.where( "width > height" )
  end

  def self.getVerticalTypes
    return AdType.where( "width <= height" )
  end

  def self.getSquare
    return AdType.where( "abs(width - height) <= 150" )
  end

end
