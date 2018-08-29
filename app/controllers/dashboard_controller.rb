class DashboardController < ApplicationController

  def show
    @jobs_by_interest = Job.jobs_by_interest
    @job_count_by_location = Job.job_count_by_location
    @top_companies_by_interest = Company.top_companies_by_interest
  end
end
