class SkillsController < ApplicationController
  before_action :set_Skill, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def show
    respond_with(@Skill)
  end

  def new
    @skill = Skill.new
    
  end

  def edit
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.full_profile_id = current_user.full_profile.id
    @skill.save
    redirect_to linkedin_linkedin_profile_path
  end

  def update
    @skill.update(skill_params)
    redirect_to linkedin_linkedin_profile_path
  end

  def destroy
    @skill.destroy
    redirect_to linkedin_linkedin_profile_path
  end

  private
    def set_Skill
      @skill = Skill.find(params[:id])
    end

    def skill_params
      params.require(:skill).permit(:name,:skill_id,:full_profile_id)
    end
end
