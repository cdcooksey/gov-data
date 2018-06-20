class V1::ConsumerComplaintCompaniesController < V1::ApplicationController

  def index
    res = ConsumerComplaintCompanySerializer.new(company)
    json_response(res.serializable_hash, :ok)
  end

  def show
    res = ConsumerComplaintSerializer.new(paginated_complaints)
    json_response(res.serializable_hash, :ok)
  end

  private

  def paginated_complaints
    ConsumerComplaint
      .where(consumer_complaint_company_id: consumer_complaint_company_params[:id])
      .offset(offset)
      .limit(PAGE_LIMIT)
  end

  def company
    ConsumerComplaintCompany.offset(offset).limit(PAGE_LIMIT)
  end

  def consumer_complaint_company_params
    params.permit(:id)
  end
end
