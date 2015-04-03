require 'test_helper'

class PhoneNosControllerTest < ActionController::TestCase
  setup do
    @phone_no = phone_nos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phone_nos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phone_no" do
    assert_difference('PhoneNo.count') do
      post :create, phone_no: { phone_number: @phone_no.phone_number, phone_type: @phone_no.phone_type, user_id: @phone_no.user_id }
    end

    assert_redirected_to phone_no_path(assigns(:phone_no))
  end

  test "should show phone_no" do
    get :show, id: @phone_no
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phone_no
    assert_response :success
  end

  test "should update phone_no" do
    patch :update, id: @phone_no, phone_no: { phone_number: @phone_no.phone_number, phone_type: @phone_no.phone_type, user_id: @phone_no.user_id }
    assert_redirected_to phone_no_path(assigns(:phone_no))
  end

  test "should destroy phone_no" do
    assert_difference('PhoneNo.count', -1) do
      delete :destroy, id: @phone_no
    end

    assert_redirected_to phone_nos_path
  end
end
