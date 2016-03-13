module AffiliatesHelper

  def getRandomVerticalAffiliate
    @affiliate = Affiliate.getRandomVerticalAffiliate
    return @affiliate.adv
  end

  def getRandomHorizontalAffiliate
    @affiliate = Affiliate.getRandomHorizontalAffiliate
    return @affiliate.adv
  end
end
