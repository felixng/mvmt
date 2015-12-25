require 'rails_helper'

RSpec.describe "posts/edit", :type => :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :name => "MyString",
      :logo => "MyString",
      :website => "MyString",
      :affilatelink => "MyString",
      :affiliate => false
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input#post_name[name=?]", "post[name]"

      assert_select "input#post_logo[name=?]", "post[logo]"

      assert_select "input#post_website[name=?]", "post[website]"

      assert_select "input#post_affilatelink[name=?]", "post[affilatelink]"

      assert_select "input#post_affiliate[name=?]", "post[affiliate]"
    end
  end
end
