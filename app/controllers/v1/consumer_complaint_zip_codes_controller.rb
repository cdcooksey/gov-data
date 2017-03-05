class V1::ConsumerComplaintZipCodesController < V1::ApplicationController

  def show
    @consumer_complaint_zip_code = ConsumerComplaintZipCode.find_by(consumer_complaint_zip_code_params)
    render json: @consumer_complaint_zip_code
  end

  private

  def consumer_complaint_zip_code_params
    params.permit(:id)
  end
end
