require 'test_helper'

class BasicInfosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basic_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basic_info" do
    assert_difference('BasicInfo.count') do
      post :create, :basic_info => { }
    end

    assert_redirected_to basic_info_path(assigns(:basic_info))
  end

  test "should show basic_info" do
    get :show, :id => basic_infos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => basic_infos(:one).to_param
    assert_response :success
  end

  test "should update basic_info" do
    put :update, :id => basic_infos(:one).to_param, :basic_info => { }
    assert_redirected_to basic_info_path(assigns(:basic_info))
  end

  test "should destroy basic_info" do
    assert_difference('BasicInfo.count', -1) do
      delete :destroy, :id => basic_infos(:one).to_param
    end

    assert_redirected_to basic_infos_path
  end
end
