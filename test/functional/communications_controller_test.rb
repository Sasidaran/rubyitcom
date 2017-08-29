require 'test_helper'

class CommunicationsControllerTest < ActionController::TestCase
  setup do
    @communication = communications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:communications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create communication" do
    assert_difference('Communication.count') do
      post :create, communication: { description: @communication.description, save_as_template: @communication.save_as_template, sub_title: @communication.sub_title, title: @communication.title }
    end

    assert_redirected_to communication_path(assigns(:communication))
  end

  test "should show communication" do
    get :show, id: @communication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @communication
    assert_response :success
  end

  test "should update communication" do
    put :update, id: @communication, communication: { description: @communication.description, save_as_template: @communication.save_as_template, sub_title: @communication.sub_title, title: @communication.title }
    assert_redirected_to communication_path(assigns(:communication))
  end

  test "should destroy communication" do
    assert_difference('Communication.count', -1) do
      delete :destroy, id: @communication
    end

    assert_redirected_to communications_path
  end
end
