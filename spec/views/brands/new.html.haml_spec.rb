require 'rails_helper'

RSpec.describe "brands/new", :type => :view do
  before(:each) do
    assign(:brand, Brand.new(
      :title => "MyString",
      :desc => "MyText",
      :website => "MyString"
    ))
  end

  it "renders new brand form" do
    render

    assert_select "form[action=?][method=?]", brands_path, "post" do

      assert_select "input#brand_title[name=?]", "brand[title]"

      assert_select "textarea#brand_desc[name=?]", "brand[desc]"

      assert_select "input#brand_website[name=?]", "brand[website]"
    end
  end
end
