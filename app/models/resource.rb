class Resource < ActiveRecord::Base
  has_many:category
  validates :category, presence: true
end
