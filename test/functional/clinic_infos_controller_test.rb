require 'test_helper'

class ClinicInfosControllerTest < ActionController::TestCase
  setup do
    @clinic_info = clinic_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clinic_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clinic_info" do
    assert_difference('ClinicInfo.count') do
      post :create, clinic_info: @clinic_info.attributes
    end

    assert_redirected_to clinic_info_path(assigns(:clinic_info))
  end

  test "should show clinic_info" do
    get :show, id: @clinic_info.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clinic_info.to_param
    assert_response :success
  end

  test "should update clinic_info" do
    put :update, id: @clinic_info.to_param, clinic_info: @clinic_info.attributes
    assert_redirected_to clinic_info_path(assigns(:clinic_info))
  end

  test "should destroy clinic_info" do
    assert_difference('ClinicInfo.count', -1) do
      delete :destroy, id: @clinic_info.to_param
    end

    assert_redirected_to clinic_infos_path
  end
end
