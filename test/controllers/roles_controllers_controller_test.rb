require 'test_helper'

class RolesControllersControllerTest < ActionController::TestCase
  setup do
    @roles_controller = roles_controllers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roles_controllers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roles_controller" do
    assert_difference('RolesController.count') do
      post :create, roles_controller: {  }
    end

    assert_redirected_to roles_controller_path(assigns(:roles_controller))
  end

  test "should show roles_controller" do
    get :show, id: @roles_controller
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roles_controller
    assert_response :success
  end

  test "should update roles_controller" do
    patch :update, id: @roles_controller, roles_controller: {  }
    assert_redirected_to roles_controller_path(assigns(:roles_controller))
  end

  test "should destroy roles_controller" do
    assert_difference('RolesController.count', -1) do
      delete :destroy, id: @roles_controller
    end

    assert_redirected_to roles_controllers_path
  end
end
