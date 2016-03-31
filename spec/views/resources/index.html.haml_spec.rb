require 'rails_helper'

RSpec.describe "places/index", :type => :view do
  before(:each) do
    assign(:places, [
      Place.create!(
        :name => "Name",
        :logo => "Logo",
        :website => "Website",
        :affilatelink => "Affilatelink",
        :affiliate => false
      ),
      Place.create!(
        :name => "Name",
        :logo => "Logo",
        :website => "Website",
        :affilatelink => "Affilatelink",
        :affiliate => false
      )
    ])
  end

  it "renders a list of places" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Logo".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Affilatelink".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
