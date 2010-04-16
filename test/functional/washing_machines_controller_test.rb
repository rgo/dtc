require 'test_helper'

class WashingMachinesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:washing_machines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create washing_machine" do
    assert_difference('WashingMachine.count') do
      post :create, :washing_machine => { }
    end

    assert_redirected_to washing_machine_path(assigns(:washing_machine))
  end

  test "should show washing_machine" do
    get :show, :id => washing_machines(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => washing_machines(:one).to_param
    assert_response :success
  end

  test "should update washing_machine" do
    put :update, :id => washing_machines(:one).to_param, :washing_machine => { }
    assert_redirected_to washing_machine_path(assigns(:washing_machine))
  end

  test "should destroy washing_machine" do
    assert_difference('WashingMachine.count', -1) do
      delete :destroy, :id => washing_machines(:one).to_param
    end

    assert_redirected_to washing_machines_path
  end
end
