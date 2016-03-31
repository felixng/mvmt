class Category < ActiveRecord::Base
  belongs_to :place
  belongs_to :product
  belongs_to :affiliate
end
