require 'rails_helper'

RSpec.describe "brands/edit", :type => :view do
  before(:each) do
    @brand = assign(:brand, Brand.create!(
      :title => "MyString",
      :desc => "MyText",
      :website => "MyString"
    ))
  end

  it "renders the edit brand form" do
    render

    assert_select "form[action=?][method=?]", brand_path(@brand), "post" do

      assert_select "input#brand_title[name=?]", "brand[title]"

      assert_select "textarea#brand_desc[name=?]", "brand[desc]"

      assert_select "input#brand_website[name=?]", "brand[website]"
    end
  end
end
