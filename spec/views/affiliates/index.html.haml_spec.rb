require 'rails_helper'

RSpec.describe "affiliates/index", :type => :view do
  before(:each) do
    assign(:affiliates, [
      Affiliate.create!(
        :name => "Name",
        :adv => "MyText",
        :display_count => 1,
        :view_count => 2
      ),
      Affiliate.create!(
        :name => "Name",
        :adv => "MyText",
        :display_count => 1,
        :view_count => 2
      )
    ])
  end

  it "renders a list of affiliates" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
