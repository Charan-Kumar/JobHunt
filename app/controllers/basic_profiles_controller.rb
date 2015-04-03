class BasicProfilesController < ApplicationController
  before_action :set_basic_profile, only: [:show, :edit, :update, :destroy]

  respond_to :json

  def index
    @basic_profiles = BasicProfile.all
    respond_with(@basic_profiles)
  end

  def show
    respond_with(@basic_profile)
  end

  def new
    @basic_profile = BasicProfile.new
    respond_with(@basic_profile)
  end

  def edit
  end

  def create
    @basic_profile = BasicProfile.new(basic_profile_params)
    @basic_profile.save
    respond_with(@basic_profile)
  end

  def update
    @basic_profile.update(basic_profile_params)
    respond_with(@basic_profile)
    
  end

  def destroy
    @basic_profile.destroy
    respond_with(@basic_profile)
  end

  private
    def set_basic_profile
      @basic_profile = BasicProfile.find(params[:id])
    end

    def basic_profile_params
      params.require(:basic_profile).permit(:first_name, :last_name, :maiden_name, :formatted_name, :headline, :location, :industry, :summary, :specialties, :picture_url, :public_profile_url, :user_id)
    end
end
