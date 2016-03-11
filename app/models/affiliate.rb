class Affiliate < ActiveRecord::Base
  has_and_belongs_to_many :category
  belongs_to :ad_type, :dependent => :destroy

  before_save :default_values
  def default_values
    self.display_count ||= 0
    self.view_count ||= 0
  end

  def self.incrementDisplayCount(affiliate)
    if affiliate
      affiliate.display_count = @affiliate.display_count + 1
      affiliate.save()
    end
  end


  def self.getBanner(query)
    @affiliate = Affiliate.find(query)
    incrementDisplayCount(@affiliate)

    return @affiliate
  end

  def self.getRandomBanner
    @affiliate = Affiliate.offset(rand(Affiliate.count)).first
    incrementDisplayCount(@affiliate)

    return @affiliate
  end

  def self.getRandomVerticalAffiliate
    @adtypes = AdType.getVerticalTypes()
    @affiliates = Affiliate.where(ad_type: @adtypes)
    if @affiliates
      @affiliate = @affiliates.offset(rand(@affiliates.count)).first
      incrementDisplayCount(@affiliate)
      return @affiliate
    end
  end

  def self.getRandomHorizontalAffiliate
    @adtypes = AdType.getHorizontalTypes()
    @affiliates = Affiliate.where(ad_type: @adtypes)
    if @affiliates
      @affiliate = @affiliates.offset(rand(@affiliates.count)).first
      incrementDisplayCount(@affiliate)
      return @affiliate
    end
  end

end
