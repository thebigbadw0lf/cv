require 'test_helper'

class RecordsLocationsControllerTest < ActionController::TestCase
  setup do
    @records_location = records_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:records_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create records_location" do
    assert_difference('RecordsLocations.count') do
      post :create, records_location: { location_id: @records_location.location_id, record_id: @records_location.record_id }
    end

    assert_redirected_to records_location_path(assigns(:records_location))
  end

  test "should show records_location" do
    get :show, id: @records_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @records_location
    assert_response :success
  end

  test "should update records_location" do
    put :update, id: @records_location, records_location: { location_id: @records_location.location_id, record_id: @records_location.record_id }
    assert_redirected_to records_location_path(assigns(:records_location))
  end

  test "should destroy records_location" do
    assert_difference('RecordsLocations.count', -1) do
      delete :destroy, id: @records_location
    end

    assert_redirected_to records_locations_index_path
  end
end
