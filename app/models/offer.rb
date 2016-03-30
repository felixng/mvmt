class Offer < ActiveRecord::Base
  has_and_belongs_to_many :brand
  has_attached_file :image,
                    :styles => {
                        :thumb => "100x100#",
                        :medium => "300x300" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # add a delete_<asset_name> method:
  attr_accessor :delete_asset
  before_validation { self.asset.clear if self.delete_asset == '1' }
end
