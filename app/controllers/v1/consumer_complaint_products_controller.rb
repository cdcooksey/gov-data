class V1::ConsumerComplaintProductsController < V1::ApplicationController
  def index
    @consumer_complaint_products = ConsumerComplaintProduct.all.limit(50)
    render json: @consumer_complaint_products
  end

  def show
    @consumer_complaint_product = ConsumerComplaintProduct.find_by(consumer_complaint_product_params)
    render json: @consumer_complaint_product
  end

  private

  def consumer_complaint_product_params
    params.permit(:id)
  end
end
