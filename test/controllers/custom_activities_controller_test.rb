require 'test_helper'

class CustomActivitiesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @custom_activity = custom_activities(:one)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custom_activities)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should create custom_activity" do
    assert_difference('CustomActivity.count') do
      post :create, custom_activity: { completion_time: @custom_activity.completion_time, content: @custom_activity.content, link: @custom_activity.link, name: @custom_activity.name, snippet: @custom_activity.snippet }
    end
  
    assert_redirected_to custom_activity_path(assigns(:custom_activity))
  end
  
  test "should show custom_activity" do
    get :show, id: @custom_activity
    assert_response :success
  end
  
  test "should get edit" do
    get :edit, id: @custom_activity
    assert_response :success
  end
  
  test "should update custom_activity" do
    patch :update, id: @custom_activity, custom_activity: { completion_time: @custom_activity.completion_time, content: @custom_activity.content, link: @custom_activity.link, name: @custom_activity.name, snippet: @custom_activity.snippet }
    assert_redirected_to custom_activity_path(assigns(:custom_activity))
  end
  
  test "should destroy custom_activity" do
    assert_difference('CustomActivity.count', -1) do
      delete :destroy, id: @custom_activity
    end
  
    assert_redirected_to custom_activities_path
  end
end
