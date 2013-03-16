require 'test_helper'

class EducationRecordsControllerTest < ActionController::TestCase
  setup do
    @education_record = education_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:education_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create education_record" do
    assert_difference('EducationRecord.count') do
      post :create, education_record: { degree_name: @education_record.degree_name, degree_short_name: @education_record.degree_short_name, end_date: @education_record.end_date, id: @education_record.id, is_current: @education_record.is_current, start_date: @education_record.start_date }
    end

    assert_redirected_to education_record_path(assigns(:education_record))
  end

  test "should show education_record" do
    get :show, id: @education_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @education_record
    assert_response :success
  end

  test "should update education_record" do
    put :update, id: @education_record, education_record: { degree_name: @education_record.degree_name, degree_short_name: @education_record.degree_short_name, end_date: @education_record.end_date, id: @education_record.id, is_current: @education_record.is_current, start_date: @education_record.start_date }
    assert_redirected_to education_record_path(assigns(:education_record))
  end

  test "should destroy education_record" do
    assert_difference('EducationRecord.count', -1) do
      delete :destroy, id: @education_record
    end

    assert_redirected_to education_records_path
  end
end
