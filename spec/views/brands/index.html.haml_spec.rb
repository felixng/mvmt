require 'rails_helper'

RSpec.describe "brands/index", :type => :view do
  before(:each) do
    assign(:brands, [
      Brand.create!(
        :title => "Title",
        :desc => "MyText",
        :website => "Website"
      ),
      Brand.create!(
        :title => "Title",
        :desc => "MyText",
        :website => "Website"
      )
    ])
  end

  it "renders a list of brands" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
  end
end
