require 'test_helper'

class SchoolsControllerTest < ActionController::TestCase
  setup do
    @school = schools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school" do
    assert_difference('School.count') do
      post :create, school: { degree: @school.degree, degree_short: @school.degree_short, end_date: @school.end_date, link: @school.link, location_id: @school.location_id, logo_link: @school.logo_link, name: @school.name, start_date: @school.start_date }
    end

    assert_redirected_to school_path(assigns(:school))
  end

  test "should show school" do
    get :show, id: @school
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school
    assert_response :success
  end

  test "should update school" do
    put :update, id: @school, school: { degree: @school.degree, degree_short: @school.degree_short, end_date: @school.end_date, link: @school.link, location_id: @school.location_id, logo_link: @school.logo_link, name: @school.name, start_date: @school.start_date }
    assert_redirected_to school_path(assigns(:school))
  end

  test "should destroy school" do
    assert_difference('School.count', -1) do
      delete :destroy, id: @school
    end

    assert_redirected_to schools_path
  end
end
