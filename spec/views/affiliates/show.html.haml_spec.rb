require 'rails_helper'

RSpec.describe "affiliates/show", :type => :view do
  before(:each) do
    @affiliate = assign(:affiliate, Affiliate.create!(
      :name => "Name",
      :adv => "MyText",
      :display_count => 1,
      :view_count => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
