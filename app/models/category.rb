class Category < ActiveRecord::Base
  belongs_to :resource
  belongs_to :product
  belongs_to :affiliate
end
