class Api::V1::ResourcesController < Api::V1::BaseController
  def show
    resource = Resource.find(params[:id])
    render(json: Api::V1::ResourceSerializer.new(resource).to_json)
  end
end
