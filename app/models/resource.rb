class Resource < ActiveRecord::Base
  has_and_belongs_to_many :category
end