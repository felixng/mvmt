require 'rails_helper'

RSpec.describe "products/new", :type => :view do
  before(:each) do
    assign(:product, Product.new(
      :id => 1,
      :name => "MyString",
      :slug => "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_id[name=?]", "product[id]"

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_slug[name=?]", "product[slug]"
    end
  end
end
