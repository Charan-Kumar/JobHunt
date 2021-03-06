class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @educations = Education.all
    respond_with(@educations)
  end

  def show
    respond_with(@education)
  end

  def new
    @education = Education.new
    respond_with(@education)
  end

  def edit
  end

  def create
    @education = Education.new(education_params)
    @education.save
    respond_with(@education)
  end

  def update
    @education.update(education_params)
    redirect_to linkedin_linkedin_profile_path
  end

  def destroy
    @education.destroy
    respond_with(@education)
  end

  private
    def set_education
      @education = Education.find(params[:id])
    end

    def education_params
      params.require(:education).permit(:school_name, :field_of_study, :start_date, :end_date, :degree, :activities, :notes, :full_profile_id)
    end
end
