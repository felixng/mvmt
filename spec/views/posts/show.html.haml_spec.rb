require 'rails_helper'

RSpec.describe "posts/show", :type => :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :name => "Name",
      :logo => "Logo",
      :website => "Website",
      :affilatelink => "Affilatelink",
      :affiliate => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Logo/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Affilatelink/)
    expect(rendered).to match(/false/)
  end
end
