class Affiliate < ActiveRecord::Base
  has_and_belongs_to_many :category
  belongs_to :ad_type, :dependent => :destroy
end
