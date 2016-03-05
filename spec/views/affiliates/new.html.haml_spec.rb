require 'rails_helper'

RSpec.describe "affiliates/new", :type => :view do
  before(:each) do
    assign(:affiliate, Affiliate.new(
      :name => "MyString",
      :adv => "MyText",
      :display_count => 1,
      :view_count => 1
    ))
  end

  it "renders new affiliate form" do
    render

    assert_select "form[action=?][method=?]", affiliates_path, "post" do

      assert_select "input#affiliate_name[name=?]", "affiliate[name]"

      assert_select "textarea#affiliate_adv[name=?]", "affiliate[adv]"

      assert_select "input#affiliate_display_count[name=?]", "affiliate[display_count]"

      assert_select "input#affiliate_view_count[name=?]", "affiliate[view_count]"
    end
  end
end
