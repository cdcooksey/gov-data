class V1::ConsumerComplaintCompaniesController < V1::ApplicationController
  def index
    @consumer_complaint_companies = ConsumerComplaintCompany.all.limit(3)
    render json: @consumer_complaint_companies
  end

  def show
    @consumer_complaints = ConsumerComplaintCompany.find_by(consumer_complaint_company_params)
                             # .consumer_complaints
                             # .page(consumer_complaint_company_params[:page])
                             # .per_page(25)
    render json: @consumer_complaints
  end

  def consumer_complaints
    @consumer_complaints = ConsumerComplaint.where(consumer_complaint_company_id: consumer_complaint_company_params[:id]).limit(3)
    render json: @consumer_complaints
  end

  private

  def consumer_complaint_company_params
    params.permit(:id, :page)
  end
end
