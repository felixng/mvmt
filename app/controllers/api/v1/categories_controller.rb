class Api::V1::CategoriesController < Api::V1::BaseController
  def show
    category = Category.find(params[:id])
    render(json: Api::V1::CategorySerializer.new(category).to_json)
  end
end
