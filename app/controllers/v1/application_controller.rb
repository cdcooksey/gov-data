module V1
  class ApplicationController < ActionController::API

    include FastJsonApiResponse
    include ExceptionHandler
    include Paginatable
  end
end
