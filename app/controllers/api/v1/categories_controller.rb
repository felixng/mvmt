class Api::V1::CategoriesController < Api::V1::BaseController
  def show
    category = Category.find(params[:id])
    render(json: Api::V1::CategorySerializer.new(category).to_json)
  end

  def create
    if @category.present?
      render nothing: true, status: :conflict
    else
      @category = Category.create(category_params)
      render json: @category
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
