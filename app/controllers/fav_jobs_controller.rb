class FavJobsController < ApplicationController
  before_action :set_fav_job, only: [:show, :edit, :update, :destroy]

  respond_to :json

  def index
    @fav_jobs = FavJob.all
    respond_with(@fav_jobs)
  end

  def show
    respond_with(@fav_job)
  end

  def new
    @fav_job = FavJob.new
    respond_with(@fav_job)
  end

  def edit
  end

  def create
    @fav_job = FavJob.new(fav_job_params)
    @fav_job.save
    respond_to do |format|
      format.json{render json: @fav_job}
    end
  end

  def update
    @fav_job.update(fav_job_params)
    respond_with(@fav_job)
  end

  def destroy
    @fav_job.destroy
    respond_with(@fav_job)
  end

  private
    def set_fav_job
      @fav_job = FavJob.find(params[:id])
    end

    def fav_job_params
      params.require(:fav_job).permit(:job_key, :is_fav, :user_id)
    end
end
