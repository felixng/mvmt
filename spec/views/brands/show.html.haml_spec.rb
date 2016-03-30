require 'rails_helper'

RSpec.describe "brands/show", :type => :view do
  before(:each) do
    @brand = assign(:brand, Brand.create!(
      :title => "Title",
      :desc => "MyText",
      :website => "Website"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Website/)
  end
end
