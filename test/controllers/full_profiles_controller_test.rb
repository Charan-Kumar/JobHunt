require 'test_helper'

class FullProfilesControllerTest < ActionController::TestCase
  setup do
    @full_profile = full_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:full_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create full_profile" do
    assert_difference('FullProfile.count') do
      post :create, full_profile: { associations: @full_profile.associations, honors: @full_profile.honors, interests: @full_profile.interests, user_id: @full_profile.user_id }
    end

    assert_redirected_to full_profile_path(assigns(:full_profile))
  end

  test "should show full_profile" do
    get :show, id: @full_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @full_profile
    assert_response :success
  end

  test "should update full_profile" do
    patch :update, id: @full_profile, full_profile: { associations: @full_profile.associations, honors: @full_profile.honors, interests: @full_profile.interests, user_id: @full_profile.user_id }
    assert_redirected_to full_profile_path(assigns(:full_profile))
  end

  test "should destroy full_profile" do
    assert_difference('FullProfile.count', -1) do
      delete :destroy, id: @full_profile
    end

    assert_redirected_to full_profiles_path
  end
end
