require 'rails_helper'

RSpec.describe "ad_types/show", :type => :view do
  before(:each) do
    @ad_type = assign(:ad_type, AdType.create!(
      :name => "Name",
      :height => 1,
      :width => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
