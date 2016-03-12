class Api::V1::AdtypeSerializer < ActiveModel::Serializer
  attributes :name
  attributes :height
  attributes :width
end
