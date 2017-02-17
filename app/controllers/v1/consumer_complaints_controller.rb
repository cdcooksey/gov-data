class V1::ConsumerComplaintsController < V1::ApplicationController

  def index
    @consumer_complaints = ConsumerComplaint.all.limit(100)
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
    params.permit(:id)
  end

end
