module OffersHelper
  def displayBrandLogo(brand)
    if (!brand.affiliate.nil?)
      return brand.affiliate.adv
    end
  end
end
