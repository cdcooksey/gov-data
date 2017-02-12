class TestController< ApplicationController
  def index
    render json: 'Hello'.to_json
  end
end