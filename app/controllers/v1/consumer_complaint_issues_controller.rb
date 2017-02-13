class V1::ConsumerComplaintIssuesController < V1::ApplicationController
def index
  @consumer_complaint_issues = ConsumerComplaintIssue.all.limit(50)
  render json: @consumer_complaint_issues
end

def show
  @consumer_complaint_issue = ConsumerComplaintIssue.find_by(consumer_complaint_issue_params)
  render json: @consumer_complaint_issue
end

  private

  def consumer_complaint_issue_params
    params.permit(:id)
  end
end
