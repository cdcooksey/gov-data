class V1::ConsumerComplaintSubissuesController < V1::ApplicationController
  def index
    @consumer_complaint_subissues = ConsumerComplaintSubissue.all.limit(50)
    render json: @consumer_complaint_subissues
  end

  def show
    @consumer_complaint_subissue = ConsumerComplaintSubissue.find_by(consumer_complaint_subissue_params)
    render json: @consumer_complaint_subissue
  end

  private

  def consumer_complaint_subissue_params
    params.permit(:id)
  end
end
