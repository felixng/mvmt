require 'rails_helper'

RSpec.describe "offers/index", :type => :view do
  before(:each) do
    assign(:offers, [
      Offer.create!(
        :title => "Title",
        :desc => "MyText",
        :code => "Code",
        :link => "Link"
      ),
      Offer.create!(
        :title => "Title",
        :desc => "MyText",
        :code => "Code",
        :link => "Link"
      )
    ])
  end

  it "renders a list of offers" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
