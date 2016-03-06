module AffiliatesHelper
  def displayAd
    @affiliate = Affiliate.first()
    @affiliate.display_count = @affiliate.display_count + 1
    @affiliate.save()
    return @affiliate.adv
  end
end
