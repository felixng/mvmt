require 'rails_helper'

RSpec.describe "products/index", :type => :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :id => 1,
        :name => "Name",
        :slug => "Slug"
      ),
      Product.create!(
        :id => 1,
        :name => "Name",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
