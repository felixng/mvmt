require 'rails_helper'

RSpec.describe "resources/new", :type => :view do
  before(:each) do
    assign(:resource, Resource.new(
      :name => "MyString",
      :logo => "MyString",
      :website => "MyString",
      :affilatelink => "MyString",
      :affiliate => false
    ))
  end

  it "renders new resource form" do
    render

    assert_select "form[action=?][method=?]", resources_path, "post" do

      assert_select "input#resource_name[name=?]", "resource[name]"

      assert_select "input#resource_logo[name=?]", "resource[logo]"

      assert_select "input#resource_website[name=?]", "resource[website]"

      assert_select "input#resource_affilatelink[name=?]", "resource[affilatelink]"

      assert_select "input#resource_affiliate[name=?]", "resource[affiliate]"
    end
  end
end
