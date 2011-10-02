require 'test_helper'

class SchedulePlansControllerTest < ActionController::TestCase
  setup do
    @schedule_plan = schedule_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_plan" do
    assert_difference('SchedulePlan.count') do
      post :create, schedule_plan: @schedule_plan.attributes
    end

    assert_redirected_to schedule_plan_path(assigns(:schedule_plan))
  end

  test "should show schedule_plan" do
    get :show, id: @schedule_plan.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_plan.to_param
    assert_response :success
  end

  test "should update schedule_plan" do
    put :update, id: @schedule_plan.to_param, schedule_plan: @schedule_plan.attributes
    assert_redirected_to schedule_plan_path(assigns(:schedule_plan))
  end

  test "should destroy schedule_plan" do
    assert_difference('SchedulePlan.count', -1) do
      delete :destroy, id: @schedule_plan.to_param
    end

    assert_redirected_to schedule_plans_path
  end
end
