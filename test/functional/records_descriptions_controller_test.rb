require 'test_helper'

class RecordsDescriptionsControllerTest < ActionController::TestCase
  setup do
    @records_description = records_descriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:records_descriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create records_description" do
    assert_difference('RecordsDescriptions.count') do
      post :create, records_description: { description_id: @records_description.description_id, record_id: @records_description.record_id }
    end

    assert_redirected_to records_description_path(assigns(:records_description))
  end

  test "should show records_description" do
    get :show, id: @records_description
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @records_description
    assert_response :success
  end

  test "should update records_description" do
    put :update, id: @records_description, records_description: { description_id: @records_description.description_id, record_id: @records_description.record_id }
    assert_redirected_to records_description_path(assigns(:records_description))
  end

  test "should destroy records_description" do
    assert_difference('RecordsDescriptions.count', -1) do
      delete :destroy, id: @records_description
    end

    assert_redirected_to records_descriptions_index_path
  end
end
