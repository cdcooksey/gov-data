class V1::ConsumerComplaintsController < V1::ApplicationController

  def index
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
      .offset(offset)
      .limit(PAGE_LIMIT)
  end

end
