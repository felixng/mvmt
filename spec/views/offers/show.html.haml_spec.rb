require 'rails_helper'

RSpec.describe "offers/show", :type => :view do
  before(:each) do
    @offer = assign(:offer, Offer.create!(
      :title => "Title",
      :desc => "MyText",
      :code => "Code",
      :link => "Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Link/)
  end
end
