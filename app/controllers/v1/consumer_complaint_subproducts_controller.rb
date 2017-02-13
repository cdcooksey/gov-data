class V1::ConsumerComplaintSubproductsController < V1::ApplicationController
  def index
    @consumer_complaint_subproducts = ConsumerComplaintSubproduct.all.limit(50)
    render json: @consumer_complaint_subproducts
  end

  def show
    @consumer_complaint_subproduct = ConsumerComplaintSubproduct.find_by(consumer_complaint_company_params)
    render json: @consumer_complaint_subproduct
  end

  private

  def consumer_complaint_subproduct_params
    params.permit(:id)
  end
end
