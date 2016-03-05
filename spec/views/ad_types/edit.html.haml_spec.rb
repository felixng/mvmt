require 'rails_helper'

RSpec.describe "ad_types/edit", :type => :view do
  before(:each) do
    @ad_type = assign(:ad_type, AdType.create!(
      :name => "MyString",
      :height => 1,
      :width => 1
    ))
  end

  it "renders the edit ad_type form" do
    render

    assert_select "form[action=?][method=?]", ad_type_path(@ad_type), "post" do

      assert_select "input#ad_type_name[name=?]", "ad_type[name]"

      assert_select "input#ad_type_height[name=?]", "ad_type[height]"

      assert_select "input#ad_type_width[name=?]", "ad_type[width]"
    end
  end
end
