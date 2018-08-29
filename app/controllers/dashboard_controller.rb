class DashboardController < ApplicationController

  def show
    @jobs_by_interest = Job.jobs_by_interest
    @job_count_by_location = Job.job_count_by_location
  end

end
