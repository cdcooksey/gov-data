class V1::ConsumerComplaintsController < V1::ApplicationController

  def index
    res = ConsumerComplaintSerializer.new(paginated_complaints)
    json_response(res.serializable_hash, :ok)
  end

  private

  def paginated_complaints
    ConsumerComplaint.offset(offset).limit(PAGE_LIMIT)
  end

end
