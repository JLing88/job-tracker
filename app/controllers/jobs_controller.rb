class JobsController < ApplicationController
  def index
    if params[:location]
      @jobs = Job.location_filter(params[:location])
    elsif params[:interest_level]
      @jobs = Job.sort_by(params[:interest_level])
    else
      @jobs = Job.all
    end
  end

  def new
    @companies = Company.all
    @categories = Category.all
    @job = Job.new
  end

  def create
    job = Job.create(job_params)
    redirect_to job_path(job)
    flash[:notice] = "You created #{job.title} at #{job.company.name}"
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    job = Job.find(params[:id])
    job.update(job_params)
    redirect_to jobs_path
  end

  def destroy
    Job.destroy(params[:id])
    redirect_to jobs_path
  end

  private

    def job_params
      params.require(:job).permit(:title, :description, :level_of_interest, :city, :company_id, :category_id)
    end
end
