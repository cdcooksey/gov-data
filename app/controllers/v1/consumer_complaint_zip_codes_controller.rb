class V1::ConsumerComplaintZipCodesController < V1::ApplicationController

  def show
    res = ConsumerComplaintSerializer.new(paginated_complaints)
    json_response(res.serializable_hash, :ok)
  end

  private


  def paginated_complaints
    ConsumerComplaint
      .includes(:consumer_complaint_company,
                :consumer_complaint_product,
                :consumer_complaint_subproduct,
                :consumer_complaint_issue,
                :consumer_complaint_subissue,
                :consumer_complaint_zip_code)
      .where(consumer_complaint_zip_code_id: consumer_complaint_zip_code_params[:id])
      .offset(offset)
      .limit(PAGE_LIMIT)
  end

  def consumer_complaint_zip_code_params
    params.permit(:id)
  end
end
