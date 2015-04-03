class FullProfilesController < ApplicationController
  before_action :set_full_profile, only: [:show, :edit, :update, :destroy]

  respond_to :json

  def index
    @full_profiles = FullProfile.all
    respond_with(@full_profiles)
  end

  def show
    respond_with(@full_profile)
  end

  def new
    @full_profile = FullProfile.new
    respond_with(@full_profile)
  end

  def edit
  end

  def create
    @full_profile = FullProfile.new(full_profile_params)
    @full_profile.save
    respond_with(@full_profile)
  end

  def update
    @full_profile.update(full_profile_params)
    respond_with(@full_profile)
  end

  def destroy
    @full_profile.destroy
    respond_with(@full_profile)
  end

  private
    def set_full_profile
      @full_profile = FullProfile.find(params[:id])
    end

    def full_profile_params
      params.require(:full_profile).permit(:associations, :honors, :interests, :user_id)
    end
end
