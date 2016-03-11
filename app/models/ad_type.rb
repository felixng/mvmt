class AdType < ActiveRecord::Base
  has_many :affiliates

  def self.getHorizontalTypes
    return AdType.where( :height <= :width )
  end

  def self.getVerticalTypes
    return AdType.where( :height >= :width )
  end

  def self.getSquare
    return AdType.where( (:height - :width).abs >= 150 )
  end

end
