require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get projects_index_url
    assert_response :success
  end

  test "should get show" do
    get projects_show_url
    assert_response :success
  end

  test "should get update_status" do
    get projects_update_status_url
    assert_response :success
  end

  test "should get add_comment" do
    get projects_add_comment_url
    assert_response :success
  end
end
