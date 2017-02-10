class TestController< ApplicationController
  def index
    render json: 'hi!'.to_json
  end
end