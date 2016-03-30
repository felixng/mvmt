require 'rails_helper'

RSpec.describe "offers/new", :type => :view do
  before(:each) do
    assign(:offer, Offer.new(
      :title => "MyString",
      :desc => "MyText",
      :code => "MyString",
      :link => "MyString"
    ))
  end

  it "renders new offer form" do
    render

    assert_select "form[action=?][method=?]", offers_path, "post" do

      assert_select "input#offer_title[name=?]", "offer[title]"

      assert_select "textarea#offer_desc[name=?]", "offer[desc]"

      assert_select "input#offer_code[name=?]", "offer[code]"

      assert_select "input#offer_link[name=?]", "offer[link]"
    end
  end
end
