require 'test_helper'

class BasicProfilesControllerTest < ActionController::TestCase
  setup do
    @basic_profile = basic_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basic_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basic_profile" do
    assert_difference('BasicProfile.count') do
      post :create, basic_profile: { first_name: @basic_profile.first_name, formatted_name: @basic_profile.formatted_name, headline: @basic_profile.headline, industry: @basic_profile.industry, last_name: @basic_profile.last_name, location: @basic_profile.location, maiden_name: @basic_profile.maiden_name, picture_url: @basic_profile.picture_url, public_profile_url: @basic_profile.public_profile_url, specialties: @basic_profile.specialties, summary: @basic_profile.summary, user_id: @basic_profile.user_id }
    end

    assert_redirected_to basic_profile_path(assigns(:basic_profile))
  end

  test "should show basic_profile" do
    get :show, id: @basic_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @basic_profile
    assert_response :success
  end

  test "should update basic_profile" do
    patch :update, id: @basic_profile, basic_profile: { first_name: @basic_profile.first_name, formatted_name: @basic_profile.formatted_name, headline: @basic_profile.headline, industry: @basic_profile.industry, last_name: @basic_profile.last_name, location: @basic_profile.location, maiden_name: @basic_profile.maiden_name, picture_url: @basic_profile.picture_url, public_profile_url: @basic_profile.public_profile_url, specialties: @basic_profile.specialties, summary: @basic_profile.summary, user_id: @basic_profile.user_id }
    assert_redirected_to basic_profile_path(assigns(:basic_profile))
  end

  test "should destroy basic_profile" do
    assert_difference('BasicProfile.count', -1) do
      delete :destroy, id: @basic_profile
    end

    assert_redirected_to basic_profiles_path
  end
end
