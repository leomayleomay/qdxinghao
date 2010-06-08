require 'test_helper'

class RecruitmentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recruitments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recruitment" do
    assert_difference('Recruitment.count') do
      post :create, :recruitment => { }
    end

    assert_redirected_to recruitment_path(assigns(:recruitment))
  end

  test "should show recruitment" do
    get :show, :id => recruitments(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => recruitments(:one).to_param
    assert_response :success
  end

  test "should update recruitment" do
    put :update, :id => recruitments(:one).to_param, :recruitment => { }
    assert_redirected_to recruitment_path(assigns(:recruitment))
  end

  test "should destroy recruitment" do
    assert_difference('Recruitment.count', -1) do
      delete :destroy, :id => recruitments(:one).to_param
    end

    assert_redirected_to recruitments_path
  end
end
