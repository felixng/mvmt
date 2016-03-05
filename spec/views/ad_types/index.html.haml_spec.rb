require 'rails_helper'

RSpec.describe "ad_types/index", :type => :view do
  before(:each) do
    assign(:ad_types, [
      AdType.create!(
        :name => "Name",
        :height => 1,
        :width => 2
      ),
      AdType.create!(
        :name => "Name",
        :height => 1,
        :width => 2
      )
    ])
  end

  it "renders a list of ad_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
