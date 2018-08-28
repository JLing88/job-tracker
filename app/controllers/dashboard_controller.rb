class DashboardController < ApplicationController

  def show
    @jobs_by_interest = Job.jobs_by_interest
  end

end
