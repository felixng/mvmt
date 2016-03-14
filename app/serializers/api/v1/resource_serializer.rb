class Api::V1::ResourceSerializer < ActiveModel::Serializer
  attributes :name
  attributes :desc
  attributes :logo
  attributes :clickthrough
  attributes :postcode
  attributes :facebook
  attributes :instagram
  attributes :twitter
  attributes :category
end
