require 'rails_helper'

RSpec.describe "ad_types/new", :type => :view do
  before(:each) do
    assign(:ad_type, AdType.new(
      :name => "MyString",
      :height => 1,
      :width => 1
    ))
  end

  it "renders new ad_type form" do
    render

    assert_select "form[action=?][method=?]", ad_types_path, "post" do

      assert_select "input#ad_type_name[name=?]", "ad_type[name]"

      assert_select "input#ad_type_height[name=?]", "ad_type[height]"

      assert_select "input#ad_type_width[name=?]", "ad_type[width]"
    end
  end
end
