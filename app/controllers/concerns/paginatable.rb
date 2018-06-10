module Paginatable
  PAGE_LIMIT = 50

#  private

  def page_params
    params.permit(:page)
  end

  def offset
    page_params.fetch(:page, '0').to_i * PAGE_LIMIT
  end

end
