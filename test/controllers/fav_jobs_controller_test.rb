require 'test_helper'

class FavJobsControllerTest < ActionController::TestCase
  setup do
    @fav_job = fav_jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fav_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fav_job" do
    assert_difference('FavJob.count') do
      post :create, fav_job: { boolean: @fav_job.boolean, is_fav: @fav_job.is_fav, job_key: @fav_job.job_key }
    end

    assert_redirected_to fav_job_path(assigns(:fav_job))
  end

  test "should show fav_job" do
    get :show, id: @fav_job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fav_job
    assert_response :success
  end

  test "should update fav_job" do
    patch :update, id: @fav_job, fav_job: { boolean: @fav_job.boolean, is_fav: @fav_job.is_fav, job_key: @fav_job.job_key }
    assert_redirected_to fav_job_path(assigns(:fav_job))
  end

  test "should destroy fav_job" do
    assert_difference('FavJob.count', -1) do
      delete :destroy, id: @fav_job
    end

    assert_redirected_to fav_jobs_path
  end
end
