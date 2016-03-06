class Affiliate < ActiveRecord::Base
  has_and_belongs_to_many :category
  belongs_to :ad_type, :dependent => :destroy

  before_save :default_values
  def default_values
    self.display_count ||= 0
    self.view_count ||= 0
  end

end
