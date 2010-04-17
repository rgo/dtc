require 'test_helper'

class WorktopInductionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worktop_inductions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worktop_induction" do
    assert_difference('WorktopInduction.count') do
      post :create, :worktop_induction => { }
    end

    assert_redirected_to worktop_induction_path(assigns(:worktop_induction))
  end

  test "should show worktop_induction" do
    get :show, :id => worktop_inductions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => worktop_inductions(:one).to_param
    assert_response :success
  end

  test "should update worktop_induction" do
    put :update, :id => worktop_inductions(:one).to_param, :worktop_induction => { }
    assert_redirected_to worktop_induction_path(assigns(:worktop_induction))
  end

  test "should destroy worktop_induction" do
    assert_difference('WorktopInduction.count', -1) do
      delete :destroy, :id => worktop_inductions(:one).to_param
    end

    assert_redirected_to worktop_inductions_path
  end
end
