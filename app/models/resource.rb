class Resource < ActiveRecord::Base
  extend FriendlyId
  has_and_belongs_to_many :category
  has_attached_file :logo,
                    :styles => {
                        :thumb => "100x100#",
                        :medium => "300x300" }
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
  # add a delete_<asset_name> method:
  attr_accessor :delete_asset
  before_validation { self.asset.clear if self.delete_asset == '1' }

end
