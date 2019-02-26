require 'test_helper'

class TripsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trips_index_url
    assert_response :success
  end

  test "should get show" do
    get trips_show_url
    assert_response :success
  end

  test "should get new" do
    get trips_new_url
    assert_response :success
  end

  test "should get edit" do
    get trips_edit_url
    assert_response :success
  end

  test "should get create" do
    get trips_create_url
    assert_response :success
  end

  test "should get update" do
    get trips_update_url
    assert_response :success
  end

  test "should get destroy" do
    get trips_destroy_url
    assert_response :success
  end

end
