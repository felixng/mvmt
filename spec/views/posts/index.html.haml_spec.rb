require 'rails_helper'

RSpec.describe "posts/index", :type => :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :name => "Name",
        :logo => "Logo",
        :website => "Website",
        :affilatelink => "Affilatelink",
        :affiliate => false
      ),
      Post.create!(
        :name => "Name",
        :logo => "Logo",
        :website => "Website",
        :affilatelink => "Affilatelink",
        :affiliate => false
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Logo".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Affilatelink".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
