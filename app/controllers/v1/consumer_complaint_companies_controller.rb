class V1::ConsumerComplaintCompaniesController < V1::ApplicationController
  def index
    @consumer_complaint_companies = ConsumerComplaintCompany.all.limit(50)
    render json: @consumer_complaint_companies
  end

  def show
    @consumer_complaint_company = ConsumerComplaintCompany.find_by(consumer_complaint_company_params)
    render json: @consumer_complaint_company
  end

  private

  def consumer_complaint_company_params
    params.permit(:id)
  end
end
