class V1::ConsumerComplaintsController < V1::ApplicationController

  def index
    @consumer_complaints = ConsumerComplaint.where(consumer_complaint_params).page(page_params[:page]).per_page(25)
    render json: @consumer_complaints
  end

  def show
    @consumer_complaint = ConsumerComplaint.eager_load(:consumer_complaint_companies,
                                                       :consumer_complaint_issues)
                                           .find_by(consumer_complaint_params)
    render json: @consumer_complaint
  end

  private

  def consumer_complaint_params
    params.permit(:consumer_complaint_company_id,
                  :consumer_complaint_product_id,
                  :consumer_complaint_subproduct_id,
                  :consumer_complaint_issue_id,
                  :consumer_complaint_subissue_id )
  end

  def page_params
    params.permit(:page)
  end

end
