class V1::ConsumerComplaintCompaniesController < V1::ApplicationController
  def index
    @consumer_complaint_companies = ConsumerComplaintCompany.all.limit(50)
    render json: @consumer_complaint_companies
  end

  def show
    @consumer_complaint_company = ConsumerComplaintCompany.find_by(consumer_complaint_company_params)
    render json: @consumer_complaint_company
  end

  def consumer_complaints
    @consumer_complaints = ConsumerComplaint.where(consumer_complaint_company_id: consumer_complaint_company_params[:id])
    render json: @consumer_complaints
  end

  private

  def consumer_complaint_company_params
    params.permit(:id)
  end
end
