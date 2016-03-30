class OfferSerializer < ActiveModel::Serializer
  attributes :id, :title, :desc, :code, :link
end
