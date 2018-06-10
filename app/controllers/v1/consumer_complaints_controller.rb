class V1::ConsumerComplaintsController < V1::ApplicationController
  PAGE_LIMIT = 50

  def index
    res = ConsumerComplaintSerializer.new(paginated_complaints)
    json_response(res.serializable_hash, :ok)
  end

  private

  def paginated_complaints
    ConsumerComplaint.offset(offset).limit(PAGE_LIMIT)
  end

  def page_params
    params.permit(:page)
  end

  def offset
    page_params.fetch(:page, '0').to_i * PAGE_LIMIT
  end

end
